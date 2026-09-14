#import "../template/theme.typ": *

#section("SKILLS")

#let skill(label, items) = (
  text(font: sans, weight: "semibold", size: 9pt, fill: ink)[#label],
  text(size: 9.5pt)[#items],
)

#grid(
  columns: (auto, 1fr),
  column-gutter: 0.7em,
  row-gutter: sp.row,

  ..skill("Languages",     [C, C++, Go, Python, Bash, x86-64 Assembly, SQL, TypeScript, Rust (basics)]),
  ..skill("Networking",    [Raw sockets, TCP/IP, ICMP, netlink/libnl, MQTT, packet analysis (Wireshark, tcpdump)]),
  ..skill("Linux",         [Kernel modules, network stack, syscalls, signals, threads, memory management, cross-compilation]),
  ..skill("Observability", [Prometheus, Grafana, metrics instrumentation, alerting as code]),
  ..skill("Backend",       [Go (chi, sqlc, pgx), PostgreSQL, REST and OpenAPI, OAuth2/JWT/TOTP]),
  ..skill("Infrastructure",[Docker, Docker Compose, GitHub Actions CI/CD, NGINX, Make, Git, GDB, Valgrind]),
)
