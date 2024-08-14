# SimpleX Chat Desktop AppImage Updater

This repository contains a shell script designed to automatically check for updates to the SimpleX Chat Desktop AppImage and download the latest version if available. This ensures you always have the most recent features and security patches.

## Features

- Automatically checks for the latest release of the SimpleX Chat Desktop AppImage from GitHub.
- Downloads the latest version if an update is available.
- Removes the old AppImage version before installing the new one.
- Maintains a version file to keep track of the currently installed version.

## Prerequisites

- `curl`: Used for fetching the latest release information and downloading the AppImage.

## Usage

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/simplex-chat-updater.git
   ```

2. **Make the Script Executable**
   ```bash
   chmod +x simplex-chat-updater/update_simplex.sh
   ```
   
3. **Modify script and change ´$target_dir´ to your wanted installdir**


3. **Run the Script**
   ```bash
   ./simplex-chat-updater/update_simplex.sh
   ```

## Script Overview

- The script checks the SimpleX Chat GitHub repository for the latest release information.
- If the directory `target_dir` does not exist, it creates it and initializes a `version.txt` file with version `0`.
- The script compares the latest version from GitHub with the installed version.
- If a newer version is found, the script removes the old AppImage, downloads the new one, updates the permissions, and writes the new version to `version.txt`.

## Troubleshooting

- **Permission Issues**: Ensure the script and the directory have the correct permissions.
- **curl Not Installed**: Install `curl` using your package manager (`apt`, `yum`, `brew`, etc.).

## Contributing

Feel free to fork this repository and submit pull requests. We welcome contributions that improve the script's functionality or usability.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
