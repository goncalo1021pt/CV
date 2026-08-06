// ─────────────────────────────────────────────────────────────
// Palette
// ─────────────────────────────────────────────────────────────
#let ink      = rgb("#1e1e1e")
#let accent   = rgb("#3A5F87")   // engineering blue
#let dim      = rgb("#555555")
#let hairline = rgb("#cfd4d9")

// ─────────────────────────────────────────────────────────────
// Font stacks
// ─────────────────────────────────────────────────────────────
#let sans  = ("Poppins", "TeX Gyre Heros", "sans-serif")
#let serif = ("Lora", "Georgia", "serif")

// ─────────────────────────────────────────────────────────────
// Vertical rhythm
// ─────────────────────────────────────────────────────────────
// Every gap in the document comes from here, so the spacing can be
// reasoned about as a scale rather than as magic numbers scattered
// across the template.
//
// `line` and `bullet` are the important pair. Block spacing is set to
// zero (each block below places its own space explicitly), which makes a
// bullet list "tight" — and a tight list takes the gap between items
// from `leading`. That made the space between two separate bullets
// identical to the space between the wrapped lines of a single bullet,
// so a two-line bullet read as two bullets. `bullet` is therefore set
// explicitly and deliberately larger than `line`.
#let sp = (
  line:    0.60em,   // between wrapped lines within one bullet
  bullet:  0.84em,   // between separate bullets
  title:   0.50em,   // entry title down to its bullets
  entry:   0.98em,   // between entries
  section: 1.25em,   // above a section heading
  rule:    0.55em,   // section rule down to the first entry
  row:     0.68em,   // between rows of the skills table
)

// ─────────────────────────────────────────────────────────────
// Document configuration
// ─────────────────────────────────────────────────────────────
// These have to live inside a show rule, not at this file's top level.
// `#import` only brings across definitions — top-level `set` rules stay
// scoped to the module that declares them, so as plain top-level rules
// they silently never reached the document. Applied via `#show: conf`
// in main.typ.
#let conf(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.5cm, y: 1.15cm),
  )

  set text(
    font: serif,
    size: 10pt,
    lang: "en",
    fill: ink,
  )

  set par(
    leading: sp.line,
    spacing: 0em,
    justify: false,
  )

  set list(
    marker: text(fill: accent, size: 7.5pt)[•],
    indent: 0.45em,
    body-indent: 0.55em,
    spacing: sp.bullet,
  )

  show link: set text(fill: accent)

  body
}

// ─────────────────────────────────────────────────────────────
// Section Header
// ─────────────────────────────────────────────────────────────
#let section(title) = {
  v(sp.section)

  grid(
    columns: (auto, 1fr),
    column-gutter: 0.6em,
    align: horizon,

    text(
      font: sans,
      weight: "semibold",
      size: 9pt,
      fill: accent,
      tracking: 0.4pt,
    )[#title],

    // `length` must be explicit — without it Typst uses a fixed default
    // rather than filling the grid cell, so the rule stops short.
    line(length: 100%, stroke: 0.6pt + hairline),
  )

  v(sp.rule)
}

// ─────────────────────────────────────────────────────────────
// Entry Block
// ─────────────────────────────────────────────────────────────
// Title and subtitle share one line — the previous version left a blank
// line between them, which Typst read as a paragraph break and dropped
// the subtitle onto a line of its own.
#let entry(title, subtitle, date, body) = {

  grid(
    columns: (1fr, auto),
    column-gutter: 0.8em,
    align: (left + top, right + top),

    {
      text(font: sans, weight: "bold", size: 10pt, fill: ink)[#title]
      if subtitle != "" {
        text(size: 8.6pt, fill: dim)[ · #subtitle]
      }
    },

    text(font: sans, size: 8.2pt, fill: dim)[#date],
  )

  v(sp.title)
  body
  v(sp.entry)
}
