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
  )[Network Systems · Linux Kernel Internals · Backend Development]

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

#v(0.7em)

// Running prose, so it gets looser leading than the bullet lists, whose
// tighter `sp.line` is there to distinguish a wrapped line from a new item.
#par(leading: 0.74em)[
  #text(size: 9.6pt, fill: dim)[
    Systems developer working in C on the packet path of telecom operator gateways: raw-socket network
    diagnostics, Linux kernel modules in the receive path and netlink-driven routing, shipped across seven
    OEM platforms. Completing an RNCP Level 7 specialisation in systems and kernel programming at 42 Lisboa,
    and separately design, ship and operate a production Go service with its own CI and Prometheus/Grafana
    monitoring.
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
// Fixed gap on top of the 1fr, so the footer keeps its breathing room
// even when the page is completely full and the 1fr collapses to zero.
#v(sp.section)
#line(length: 100%, stroke: 0.5pt + hairline)

#v(0.55em)

#align(center)[
  #text(
    font: sans,
    size: 8.5pt,
    fill: dim,
  )[Portuguese (Native) · English (Fluent)]
]