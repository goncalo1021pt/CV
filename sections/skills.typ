#import "../template/theme.typ": *

#section("Skills")

#grid(
  columns: (auto, 1fr),
  gutter: 1em,
  text(weight: "bold")["Languages:"], [C, Python, JavaScript, TypeScript, SQL],
  text(weight: "bold")["Backend:"], [Django, FastAPI, PostgreSQL, Docker],
  text(weight: "bold")["Systems:"], [Linux, Networking, Signal Handling, Process Management],
  text(weight: "bold")["Tools:"], [Git, Docker, VS Code, Linux Command Line],
)
