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

  ..skill("Languages",     [C, Go, Rust, C++, Python, x86-64 Assembly, Bash, SQL, TypeScript]),
  ..skill("Networking",    [Raw sockets, TCP/IP, ICMP, netlink/libnl, MQTT, packet analysis (Wireshark, tcpdump)]),
  ..skill("Linux",         [Kernel modules, receive path, syscalls, signals, threads, memory management, cross-compilation]),
  ..skill("Observability", [Prometheus, Grafana, metrics instrumentation, alerting as code]),
  ..skill("Backend",       [Go (chi, sqlc, pgx), PostgreSQL, REST and OpenAPI, WebSockets, OAuth2/JWT/TOTP]),
  ..skill("Infrastructure",[Docker, Kubernetes (K3s), GitHub Actions CI/CD, NGINX, Git, GDB, Valgrind]),
)
