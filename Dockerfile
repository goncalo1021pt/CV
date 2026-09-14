# syntax=docker/dockerfile:1

# Reproducible build environment for the CV.
#
# The document asks for three font families (Poppins, TeX Gyre Heros, Lora).
# A missing family is not an error in Typst — it warns and quietly falls back
# to the default serif, which is how a CV meant to be set in Poppins and Lora
# ended up committed rendered entirely in Libertinus. Baking the fonts into an
# image removes the failure mode; scripts/build.sh then asserts that the
# substitution cannot creep back in unnoticed.

# Matches the Typst used for local development. Bump both together.
ARG TYPST_VERSION=0.14.2
# Google ships fonts from a rolling branch, so pin a revision: an image rebuilt
# a year from now then still renders the CV with the same glyphs.
ARG GOOGLE_FONTS_REF=809e4d8b8d7e9364a914909bb777679606c178b8
ARG FONTTOOLS_VERSION=4.65.0

# ─────────────────────────────────────────────────────────────
# Typst binary
# ─────────────────────────────────────────────────────────────
FROM debian:trixie-slim AS typst
ARG TYPST_VERSION

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl xz-utils \
 && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    case "$(uname -m)" in \
      x86_64)  target=x86_64-unknown-linux-musl  ;; \
      aarch64) target=aarch64-unknown-linux-musl ;; \
      *) echo "unsupported architecture: $(uname -m)" >&2; exit 1 ;; \
    esac; \
    curl -fsSL "https://github.com/typst/typst/releases/download/v${TYPST_VERSION}/typst-${target}.tar.xz" \
      | tar -xJ -C /tmp; \
    install -m 0755 "/tmp/typst-${target}/typst" /usr/local/bin/typst; \
    typst --version

# ─────────────────────────────────────────────────────────────
# Fonts
# ─────────────────────────────────────────────────────────────
FROM python:3.12-slim AS fonts
ARG GOOGLE_FONTS_REF
ARG FONTTOOLS_VERSION

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir "fonttools==${FONTTOOLS_VERSION}"

WORKDIR /src

# Poppins ships as static instances, so it needs no further work. Lora is
# published only as a variable font.
RUN set -eux; \
    base="https://raw.githubusercontent.com/google/fonts/${GOOGLE_FONTS_REF}"; \
    for weight in Regular Italic Medium SemiBold Bold; do \
      curl -fsSL -o "Poppins-${weight}.ttf" "${base}/ofl/poppins/Poppins-${weight}.ttf"; \
    done; \
    curl -fsSL -o "Lora.ttf"        "${base}/ofl/lora/Lora%5Bwght%5D.ttf"; \
    curl -fsSL -o "Lora-Italic.ttf" "${base}/ofl/lora/Lora-Italic%5Bwght%5D.ttf"

# Typst 0.14 reads a variable font at its default instance only — it reports
# `Lora` as weight 400 and nothing else, so `weight: "bold"` on the serif stack
# would be synthesised rather than real Lora Bold. Flattening the wght axis into
# static faces gives Typst the four genuine variants to pick from.
RUN set -eux; \
    mkdir -p /out; \
    cp Poppins-*.ttf /out/; \
    fonttools varLib.instancer -o /out/Lora-Regular.ttf    Lora.ttf        wght=400; \
    fonttools varLib.instancer -o /out/Lora-Bold.ttf       Lora.ttf        wght=700; \
    fonttools varLib.instancer -o /out/Lora-Italic.ttf     Lora-Italic.ttf wght=400; \
    fonttools varLib.instancer -o /out/Lora-BoldItalic.ttf Lora-Italic.ttf wght=700

# ─────────────────────────────────────────────────────────────
# Build environment
# ─────────────────────────────────────────────────────────────
FROM debian:trixie-slim

# fonts-texgyre supplies TeX Gyre Heros, the fallback in the sans stack.
# poppler-utils supplies pdfinfo/pdffonts, which scripts/build.sh verifies with.
RUN apt-get update \
 && apt-get install -y --no-install-recommends fonts-texgyre poppler-utils \
 && rm -rf /var/lib/apt/lists/*

COPY --from=typst /usr/local/bin/typst /usr/local/bin/typst
COPY --from=fonts /out/ /usr/local/share/fonts/cv/

# The container runs as the invoking host user (see the Makefile) so that the
# generated PDF is not root-owned. That uid has no home directory, so point the
# paths Typst writes to somewhere world-writable.
ENV TYPST_FONT_PATHS=/usr/local/share/fonts/cv \
    XDG_CACHE_HOME=/tmp/cache \
    HOME=/tmp

WORKDIR /cv
CMD ["scripts/build.sh"]
