
# Domain Status Checker

This script allows you to check the availability of domain names. It can be used for checking a single domain or for processing a list of domains from a file.

## Features

- **Check Single Domain:** You can input a domain name to check if it's available or not.
- **Process Domain List from File:** You can provide a file containing a list of domain names to check all of them.
- **Filter Results:** You can filter the output to only show available domains or unavailable domains.
- **Color-Coded Output:**
  - 🟢 : Available domain
  - 🔴 : Unavailable domain

## Requirements

The script uses the `whois` command to check domain availability, so ensure it's installed on your system.

- On **Ubuntu**:
  ```bash
  sudo apt install whois
  ```

- On **macOS** (using Homebrew):
  ```bash
  brew install whois
  ```

## Usage

### 1. Check a single domain:

```bash
./check_domain_status.sh <domain>
```

Example:

```bash
./check_domain_status.sh example.com
```

This will check if `example.com` is available or not.

### 2. Check a list of domains from a file:

```bash
./check_domain_status.sh <file_path>
```

The file should contain one domain per line.

Example:

```bash
./check_domain_status.sh domains.txt
```

This will check all the domains listed in `domains.txt`.

### 3. Filter by domain status:

You can filter the output to only show available or unavailable domains by providing an optional `on` or `off` argument.

- **Show only available domains:**

```bash
./check_domain_status.sh <file_path> on
```

- **Show only unavailable domains:**

```bash
./check_domain_status.sh <file_path> off
```

If you do not provide any filter, the script will show both available and unavailable domains.

### 4. Show all domains:

If you leave the filter empty, the script will show both available and unavailable domains:

```bash
./check_domain_status.sh <file_path>
```

## Example Outputs

- **Single domain:**
  ```bash
  🟢 : example.com
  ```

- **File with multiple domains:**
  ```bash
  🟢 : example.com
  🔴 : example.net
  🟢 : example.org
  ```

## Troubleshooting

- If you encounter the error `whois: command not found`, it means the `whois` command is not installed on your system. To install it, follow the installation instructions in the Requirements section.

## License

This script is open-source and released under the [MIT License](LICENSE).
