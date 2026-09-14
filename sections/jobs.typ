#import "../template/theme.typ": *

#section("EXPERIENCE")

#entry(
  "Embedded Software Engineer",
  "Streambow",
  "Dec 2025 - Present · Sintra, Portugal",
  [
    - Build the network diagnostics agent shipped on telecom operator gateways: raw-socket ICMP, TWAMP, throughput and browsing probes reporting over MQTT
    - Added a traceroute diagnostic measuring per-hop RTT and loss, so support can locate #emph[where] a subscriber path degrades instead of only that it does
    - Diagnosed and fixed two gateway crash mechanisms in the receive path: a per-CPU backlog fallback that re-injected every packet under RPS until the watchdog fired, and a double free on upload
    - Replaced brittle route parsing with libnl queries against the kernel route cache, and made WAN detection event-driven by subscribing to netlink route notifications
    - Ported the agent and its three kernel modules onto seven OEM gateway platforms across prplOS, OpenWrt and buildroot — ARMv7 and aarch64, musl and glibc, kernels to 5.4, GCC 5.5 to 7.5
    - Automated customer releases end to end — compile, strip, document, checksum and package in one command — and publish container targets as versioned OCI images
  ]
)

#entry(
  "Student Supervisor",
  "42 Lisboa",
  "Jul 2024 - Oct 2024 · Lisbon, Portugal",
  [
    - Reviewed and evaluated C and systems programming projects against specification
    - Delivered technical presentations to audiences of 100+ students
  ]
)
