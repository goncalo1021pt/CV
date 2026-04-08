#import "template/theme.typ": *

// ─────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────
#align(center)[

  #text(
    font: ("Poppins", "TeX Gyre Heros", "sans-serif"),
    size: 26pt,
    weight: "bold",
    fill: ink,
  )[Gonçalo Pereira]

  #v(-1em)

  #text(
    font: ("Poppins", "TeX Gyre Heros", "sans-serif"),
    size: 9pt,
    fill: accent,
    tracking: 0.3pt,
  )[Embedded Systems · Network Programming · Backend Development]

  #v(0.45em)

  #text(size: 9pt, fill: dim)[
    #link("mailto:goncalo.pereira.1021@gmail.com")[goncalo.pereira.1021\@gmail.com]
    #h(1.2em)
    #link("https://github.com/goncalo1021pt")[Github]
    #h(1.2em)
    #link("https://goncalo1021pt.github.io")[Portfolio]
    #h(1.2em)
    #link("https://www.linkedin.com/in/goncalo-santos-pereira-3a5080187")[LinkedIn]
    #h(1.2em)
    +351 925 526 272
    #h(1.2em)
    Lisbon, Portugal
  ]
]

#include "sections/jobs.typ"
#include "sections/projects.typ"
#include "sections/education.typ"
#include "sections/skills.typ"

// ─────────────────────────────────────────────────────────────
// Footer Languages
// ─────────────────────────────────────────────────────────────
#v(1fr)
#line(length: 100%, stroke: 0.5pt + hairline)

#v(0em)

#align(center)[
  #text(
    font: ("Poppins", "TeX Gyre Heros", "sans-serif"),
    size: 8.5pt,
    fill: dim,
  )[Portuguese (Native) · English (Fluent)]
]