# Domain Checker Script

A simple script to check the availability of domain names using WHOIS.

## Features
- Checks the availability of a single domain or multiple domains from a file.
- Filters results to show available (`on`) or unavailable (`off`) domains, or shows all by default.
- Provides a user-friendly output with green (🟢) for available domains and red (🔴) for unavailable ones.

## Prerequisites
- The script requires the `whois` command-line tool to query the WHOIS database. Ensure it's installed on your system.

### Install `whois` (if needed)
- **On Ubuntu/Debian**:
  ```bash
  sudo apt-get install whois
