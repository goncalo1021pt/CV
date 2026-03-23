#import "../template/theme.typ": *

#section("SKILLS")

#grid(
  columns: (auto, 1fr, auto, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.4em,

  text(font: ("Poppins",), weight: "semibold")[Languages:],
  [C, C++, Python, JavaScript, Bash, SQL],

  text(font: ("Poppins",), weight: "semibold")[Systems:],
  [Linux, Embedded Linux, Raw Sockets, ioctl, Signals, Process Management],

  text(font: ("Poppins",), weight: "semibold")[Backend:],
  [Django, FastAPI, PostgreSQL, REST APIs, WebSockets],

  text(font: ("Poppins",), weight: "semibold")[Tooling:],
  [Git, Docker, GDB, Valgrind, VS Code],
)