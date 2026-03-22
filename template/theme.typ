// Theme Configuration for CV

// Page setup - professional margins
#set page(
  margin: (x: 2cm, y: 1.5cm),
  paper: "a4"
)

// Typography - clean and readable
#set text(
  font: "DejaVu Sans",
  size: 11pt,
  lang: "en"
)

// Color scheme - professional and modern
#let primary = rgb("#1f4e79")
#let accent = rgb("#c55a11")
#let text-light = rgb("#444444")

// Paragraph spacing
#set par(
  leading: 0.6em,
  spacing: 0.6em
)

// Section header styling
#let section(title) = [
  #v(0.8em)
  #text(weight: "bold", size: 13pt, fill: primary)[#title]
  #line(length: 100%, stroke: 1.5pt + primary)
  #v(0.4em)
]

// Job/Project entry with title, subtitle, date, and description
#let entry(title, subtitle, date, body) = [
  #grid(
    columns: (1fr, auto),
    column-gutter: 0.5em,
    [
      #text(weight: "bold", fill: text-light)[#title]
      #if subtitle != "" [
        \ #text(style: "italic", size: 10pt, fill: rgb("#666"))[#subtitle]
      ]
    ],
    [#text(size: 10pt, fill: primary, weight: "bold")[#date]]
  )
  #v(0.2em)
  #body
  #v(0.6em)
]

// Bullet point styling for consistency
#set list(marker: "•")