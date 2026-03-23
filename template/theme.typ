// ─────────────────────────────────────────────────────────────
// Page
// ─────────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 1.7cm, y: 1.3cm),
)

// ─────────────────────────────────────────────────────────────
// Typography
// ─────────────────────────────────────────────────────────────
#set text(
  font: ("Lora", "Georgia", "serif"),
  size: 10pt,
  lang: "en",
  fill: rgb("#1e1e1e"),
)

#set par(
  leading: 0.50em,
  spacing: 0em,
)

// ─────────────────────────────────────────────────────────────
// Palette
// ─────────────────────────────────────────────────────────────
#let ink      = rgb("#1e1e1e")
#let accent   = rgb("#3A5F87")   // engineering blue
#let dim      = rgb("#555555")
#let hairline = rgb("#cfd4d9")

// ─────────────────────────────────────────────────────────────
// Section Header
// ─────────────────────────────────────────────────────────────
#let section(title) = {
  v(0.0em)

  grid(
    columns: (auto, 1fr),
    column-gutter: 0.6em,
    align: horizon,

    text(
      font: ("Poppins", "TeX Gyre Heros", "sans-serif"),
      weight: "semibold",
      size: 9pt,
      fill: accent,
    )[#title],

    line(stroke: 0.6pt + hairline),
  )

  v(0.1em)
}

// ─────────────────────────────────────────────────────────────
// Entry Block
// ─────────────────────────────────────────────────────────────
#let entry(title, subtitle, date, body) = {

  grid(
    columns: (1fr, auto),
    column-gutter: 0.6em,
    align: top,

    [
      #text(
        font: ("Poppins", "TeX Gyre Heros", "sans-serif"),
        weight: "bold",
        size: 10pt,
        fill: ink,
      )[#title]

      #if subtitle != "" [
        #h(0.3em)
        #text(
          size: 9pt,
          fill: dim,
        )[#subtitle]
      ]
    ],

    text(
      font: ("Poppins", "TeX Gyre Heros", "sans-serif"),
      size: 8.3pt,
      fill: dim,
    )[#date],
  )

  v(0.1em)
  body
  v(0.25em)
}

// ─────────────────────────────────────────────────────────────
// Lists
// ─────────────────────────────────────────────────────────────
#set list(
  marker: text(fill: accent, size: 8pt)[•],
  indent: 0.45em,
  body-indent: 0.5em,
)