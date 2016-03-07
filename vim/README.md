# vim Dockerfiles

This collection of dockerfiles installs the `vim` editor and bootstraps a custom configuration using `.vimrc` and the [`vim-plug`][vim plug] plugin manager.

## Tags

The image uses the following tags:

| Tag name    | Description
| --------    | -----------
| vim-base    | Base debian, installs `vim-nox`
| vim-plug    | Based on `vim-base`, installs [`vim-plug`][vim plug]
| vim-editor  | Based on `vim-plug`, uses `.vimrc` from GitHub to install plugins

[vim plug]: https://github.com/junegunn/vim-plug

The `.vimrc` used can be customized by providing an alternate `VIMRC_URL`:

```bash
docker build --build-arg VIMRC_URL https://example.com/YOUR_VIMRC vim-editor
```

## Building

A Makefile is provided to automate the building steps for each tag:

```sh
make all
```
