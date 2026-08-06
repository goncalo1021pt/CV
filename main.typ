#import "template/theme.typ": *

// Applies the page, text, paragraph and list rules. Without this show
// rule the theme's `set` rules never reach the document.
#show: conf

// ─────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────
#align(center)[

  #text(
    font: sans,
    size: 24pt,
    weight: "bold",
    fill: ink,
  )[Gonçalo Pereira]

  #v(0.75em)

  #text(
    font: sans,
    size: 9pt,
    fill: accent,
    tracking: 0.3pt,
  )[Embedded Systems · Network Programming · Backend Development]

  #v(0.5em)

  #text(size: 9pt, fill: dim)[
    #link("mailto:goncalo.pereira.1021@gmail.com")[goncalo.pereira.1021\@gmail.com]
    #h(1.2em)
    #link("https://github.com/goncalo1021pt")[Github]
    #h(1.2em)
    #link("https://goncalo.fontao.net")[Portfolio]
    #h(1.2em)
    #link("https://www.linkedin.com/in/goncalo-santos-pereira-3a5080187")[LinkedIn]
    #h(1.2em)
    +351 925 526 272
    #h(1.2em)
    Lisbon, Portugal
  ]
]

#v(0.55em)

#text(size: 9.6pt, fill: dim)[
  Embedded software engineer working in C on telecom network gateways running embedded Linux.
  Background in systems and network programming from 42 Lisboa, and hands-on experience designing,
  shipping and operating a production Go service with its own CI, deployment and monitoring.
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
    font: sans,
    size: 8.5pt,
    fill: dim,
  )[Portuguese (Native) · English (Fluent)]
]