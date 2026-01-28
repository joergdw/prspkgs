# About this repository #
This repository contains a personal collection of Nix-packages for free and open-source software.

You can install any of the packages here on your computer if you have installed the package-manager Nix. Nix is available on macOS as well as on Linux-Systems. To see which packages are contained here, please execute:
```shell
nix flake show 'github:joergdw/prspkgs'
```

You can use as well the Nix-subcommand `search` to do a dedicated package search that will show you as well the package-descriptions.

To install a package, simply do:
```shell
# Alternatively this works as long as you have configured a .netrc, see:
# <https://nix.dev/manual/nix/latest/command-ref/conf-file.html?highlight=netrc#conf-netrc-file>
nix profile add 'github:joergdw/prspkgs#<package-name>'
```
Example:
```shell
nix profile add 'github:joergdw/prspkgs#cloud-mta-build-tool'
```

This repository is in the format of a Nix-flake [[Dokumentation](<https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-flake.html> "Official Nix-documentation")].
