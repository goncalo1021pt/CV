#import "template/theme.typ": *

// Header with name and contact info
#align(center)[
  #text(size: 20pt, weight: "bold", fill: primary)[Gonçalo Pereira]
  
  #text(size: 10pt)[Software Developer · Networking · Systems Programming]
  
  #text(size: 9pt, fill: rgb("#666"))[
    #link("mailto:goncalo.pereira.1021@gmail.com")[goncalo.pereira.1021\@gmail.com] | 
    #link("https://github.com/goncalo1021pt")[GitHub] | 
    #link("https://www.linkedin.com/in/goncalo-santos-pereira-3a5080187")[LinkedIn] |
    Lisbon, Portugal
  ]
]

#section("Summary")

Systems-focused developer with strong experience in C, network programming, and backend development using Django. Passionate about infrastructure, performance optimization, and low-level systems design. Currently advancing skills through intensive project-based learning at 42 School.

#include "sections/jobs.typ"
#include "sections/education.typ"
#include "sections/skills.typ"
#include "sections/projects.typ"