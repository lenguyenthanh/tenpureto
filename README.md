# tenpureto [![CI](https://github.com/tenpureto/tenpureto/workflows/CI/badge.svg)](https://github.com/tenpureto/tenpureto/actions?query=workflow%3ACI+branch%3Amaster) [![codecov](https://codecov.io/gh/tenpureto/tenpureto/branch/master/graph/badge.svg)](https://codecov.io/gh/tenpureto/tenpureto)

## Introduction

`tenpureto` is a tool that allows to easily bootstrap software projects from a
template. Almost every programming language ecosystem provides some
bootstrapping solution. What makes `tenpureto` different is simplicity with a
reasonable amount of flexibility:

* Templates can be split into independent features that you can selectively
  include.
* Projects created from a template can be updated to include upstream changes.
* Contributing to a template is as easy as contributing to any other project.

## Documentation

Project documentation including installation instructions, usage examples and information about authoring new templates is available at [tenpureto.org](https://tenpureto.org/).

## Installation

### macOS

You can install `tenpureto` with [Homebrew](https://brew.sh):

```sh
$ brew tap rtimush/tap # you need it only once
$ brew install tenpureto
```

You can also download a binary from the [releases](https://github.com/tenpureto/tenpureto/releases/latest) page.

### Linux

You can download a statically built binary from the [releases](https://github.com/tenpureto/tenpureto/releases/latest) page.

If you use [Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux), you can also install `tenpureto` from the `rtimush/tap` tap in the same way as described in the [macOS](#macos) section.

### Build from sources

You need to get [Haskell Stack](https://haskellstack.org) first. Get `tenpureto` sources and run

```sh
# will install tenpureto binary to ~/.local/bin
$ stack install
```
or
```sh
# will run tenpureto without installing
$ stack run -- <tenpureto options here>
```

You may need to install `libtinfo-dev` (DEB) or `libtinfo-devel` (RPM) package before running `stack`.

## Usage

To create a new project run the following command:

```sh
$ tenpureto create --template <repository> <directory>
```
where

* `<repository>` — Git URL of a template repository (for GitHub you can just
    use `organization/repo`).
* `<directory>` — where to create a project.

If you have a local clone of a Git repository with `--mirror`, you can pass its
absolute path instead of a Git URL as the `<repository>` argument.

You will be asked to choose a subset of template features you want to include,
and to provide some variable values, and then the project will be created.

If you want to incorporate changes that were made in a template into a project
that you previously created, run

```sh
$ tenpureto update <directory>
```
