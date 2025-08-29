#!/usr/bin/env python3
"""
Script to check for new versions of corgea-cli on PyPI and update the Homebrew formula.
"""

import os
import re
import sys
import json
import hashlib
import requests
from urllib.parse import urlparse
from pathlib import Path

# Configuration
PACKAGE_NAME = "corgea-cli"
PYPI_API_URL = f"https://pypi.org/pypi/{PACKAGE_NAME}/json"
FORMULA_PATH = "Formula/corgea-cli.rb"

def get_pypi_info():
    """Get the latest version and download URL from PyPI."""
    try:
        response = requests.get(PYPI_API_URL, timeout=30)
        response.raise_for_status()
        data = response.json()
        
        latest_version = data["info"]["version"]
        
        # Find the source distribution (tar.gz) for the latest version
        releases = data["releases"].get(latest_version, [])
        source_dist = None
        
        for release in releases:
            if release["packagetype"] == "sdist" and release["filename"].endswith(".tar.gz"):
                source_dist = release
                break
        
        if not source_dist:
            print(f"Error: No source distribution found for version {latest_version}")
            sys.exit(1)
        
        return {
            "version": latest_version,
            "url": source_dist["url"],
            "filename": source_dist["filename"],
            "sha256": source_dist["digests"]["sha256"]
        }
    
    except requests.RequestException as e:
        print(f"Error fetching PyPI data: {e}")
        sys.exit(1)
    except KeyError as e:
        print(f"Error parsing PyPI response: {e}")
        sys.exit(1)

def get_current_formula_version():
    """Extract the current version from the Homebrew formula."""
    try:
        with open(FORMULA_PATH, "r") as f:
            content = f.read()
        
        # Extract version from URL
        url_match = re.search(r'url\s+"([^"]+)"', content)
        if not url_match:
            print("Error: Could not find URL in formula")
            sys.exit(1)
        
        url = url_match.group(1)
        
        # Extract version from filename in URL
        version_match = re.search(r'corgea_cli-([^/]+)\.tar\.gz', url)
        if not version_match:
            print("Error: Could not extract version from URL")
            sys.exit(1)
        
        return version_match.group(1)
    
    except FileNotFoundError:
        print(f"Error: Formula file {FORMULA_PATH} not found")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading formula: {e}")
        sys.exit(1)

def update_formula(pypi_info):
    """Update the Homebrew formula with new version information."""
    try:
        with open(FORMULA_PATH, "r") as f:
            content = f.read()
        
        # Update URL
        new_url = pypi_info["url"]
        content = re.sub(
            r'url\s+"[^"]+"',
            f'url "{new_url}"',
            content
        )
        
        # Update SHA256
        new_sha256 = pypi_info["sha256"]
        content = re.sub(
            r'sha256\s+"[^"]+"',
            f'sha256 "{new_sha256}"',
            content
        )
        
        # Write updated content
        with open(FORMULA_PATH, "w") as f:
            f.write(content)
        
        print(f"Formula updated successfully to version {pypi_info['version']}")
        return True
    
    except Exception as e:
        print(f"Error updating formula: {e}")
        return False

def update_readme_version(new_version):
    """Update the version in README.md."""
    readme_path = "README.md"
    try:
        with open(readme_path, "r") as f:
            content = f.read()
        
        # Update version in README
        content = re.sub(
            r'- \*\*Version\*\*: [0-9]+\.[0-9]+\.[0-9]+',
            f'- **Version**: {new_version}',
            content
        )
        
        with open(readme_path, "w") as f:
            f.write(content)
        
        print(f"README.md updated with version {new_version}")
    
    except Exception as e:
        print(f"Warning: Could not update README.md: {e}")

def set_github_output(name, value):
    """Set GitHub Actions output variable."""
    github_output = os.environ.get('GITHUB_OUTPUT')
    if github_output:
        with open(github_output, 'a') as f:
            f.write(f"{name}={value}\n")
    else:
        print(f"::set-output name={name}::{value}")

def main():
    """Main function to check and update the formula."""
    print("Checking for new corgea-cli version...")
    
    # Get current and latest versions
    current_version = get_current_formula_version()
    pypi_info = get_pypi_info()
    latest_version = pypi_info["version"]
    
    print(f"Current version: {current_version}")
    print(f"Latest version: {latest_version}")
    
    # Set GitHub Actions outputs
    set_github_output("current_version", current_version)
    set_github_output("new_version", latest_version)
    
    # Check if update is needed
    if current_version == latest_version:
        print("No update needed - already at latest version")
        set_github_output("update_needed", "false")
        return
    
    print(f"Update needed: {current_version} → {latest_version}")
    set_github_output("update_needed", "true")
    
    # Update the formula
    if update_formula(pypi_info):
        update_readme_version(latest_version)
        print("Formula and README updated successfully")
    else:
        print("Failed to update formula")
        sys.exit(1)

if __name__ == "__main__":
    main()
