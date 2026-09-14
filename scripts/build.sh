#!/bin/sh
# Compile the CV and assert the result is actually the document we intended.
#
# Typst is forgiving in ways that matter here: a missing font family is a
# warning, not an error, so a broken toolchain still produces a plausible
# looking PDF set in the wrong typeface. Every check below exists to turn one
# of those silent degradations into a non-zero exit code.
#
# Runs inside the image built by the Dockerfile; `make build` is the entry
# point, and CI runs this exact script so local and CI agree by construction.
set -eu

SRC=${SRC:-main.typ}
OUT=${OUT:-cv.pdf}
# A CV that silently grows onto a second page is a bug worth failing on.
EXPECTED_PAGES=${EXPECTED_PAGES:-1}
# Families the document is designed in. Each must appear in the output.
REQUIRED_FONTS=${REQUIRED_FONTS:-"Poppins Lora"}
# Families allowed to appear at all. Anything else means Typst substituted
# something behind our back.
ALLOWED_FONTS=${ALLOWED_FONTS:-"Poppins Lora TeXGyreHeros"}

log=$(mktemp)
failures=0

fail() {
    printf '  ✗ %s\n' "$*"
    failures=$((failures + 1))
}

pass() {
    printf '  ✓ %s\n' "$*"
}

# ── compile ──────────────────────────────────────────────────
printf '\n▸ Compiling %s → %s\n' "$SRC" "$OUT"

status=0
typst compile "$SRC" "$OUT" >"$log" 2>&1 || status=$?
[ -s "$log" ] && sed 's/^/  /' "$log"

if [ "$status" -ne 0 ]; then
    printf '\n✗ typst exited with status %s\n' "$status"
    exit 1
fi
pass "compiled"

# Warnings are how Typst reports a missing font family, so they are failures
# here rather than noise to scroll past.
if grep -q '^warning:' "$log"; then
    fail "typst emitted warnings (see above)"
else
    pass "no typst warnings"
fi

# ── the artefact exists ──────────────────────────────────────
printf '\n▸ Verifying %s\n' "$OUT"

if [ ! -s "$OUT" ]; then
    printf '  ✗ %s is missing or empty\n' "$OUT"
    exit 1
fi
pass "$(printf '%s is %s bytes' "$OUT" "$(wc -c <"$OUT" | tr -d ' ')")"

# ── page count ───────────────────────────────────────────────
pages=$(pdfinfo "$OUT" 2>/dev/null | awk '/^Pages:/ { print $2 }')
if [ "$pages" = "$EXPECTED_PAGES" ]; then
    pass "$pages page(s)"
else
    fail "expected $EXPECTED_PAGES page(s), got ${pages:-unknown}"
fi

# ── embedded fonts ───────────────────────────────────────────
# pdffonts prints a two-line header, then one row per font whose first column
# is a `ABCDEF+` subset tag followed by the PostScript name.
families=$(pdffonts "$OUT" 2>/dev/null \
    | tail -n +3 \
    | awk 'NF { print $1 }' \
    | sed 's/^[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z]+//' \
    | sort -u)

if [ -z "$families" ]; then
    fail "no embedded fonts found"
fi

for required in $REQUIRED_FONTS; do
    if printf '%s\n' "$families" | grep -qi "$required"; then
        pass "$required is embedded"
    else
        fail "$required is missing — Typst substituted a fallback"
    fi
done

for family in $families; do
    allowed=no
    for candidate in $ALLOWED_FONTS; do
        case "$family" in
            *"$candidate"*) allowed=yes ;;
        esac
    done
    [ "$allowed" = yes ] || fail "unexpected font '$family' (not one of: $ALLOWED_FONTS)"
done

printf '\n  embedded fonts:\n'
printf '%s\n' "$families" | sed 's/^/    /'

# ── verdict ──────────────────────────────────────────────────
if [ "$failures" -gt 0 ]; then
    printf '\n✗ %s check(s) failed\n\n' "$failures"
    exit 1
fi

printf '\n✓ %s is good\n\n' "$OUT"
