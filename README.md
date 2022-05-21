# Jekyll Deploy Test GitHub Action

[![Automated Validation](https://github.com/PaulRosenthal/Jekyll-Deploy-Test-Action/actions/workflows/automated-validation.yml/badge.svg?branch=main)](https://github.com/PaulRosenthal/Jekyll-Deploy-Test-Action/actions/workflows/automated-validation.yml)

This GitHub action validates whether a Jekyll website contains the necessary configuration to successfully build. It is intended to be used in a continuous integration (CI) pipeline or as part of a testing process.

## Inputs

### `gemfile-location`

**Optional** This variable contains the location of the gemfile. By default, this is the root of the repository.

### `site-directory`

**Optional** This variable contains the location of the Jekyll website. By default, this is the root of the repository

## Output

The action outputs a value of "0" if the website builds correctly, and outputs a value of "1" if attempting to build the website fails. The action builds the website with the "--verbose" option; thus, looking at the action results can be helpful for troubleshooting failures.

## How to Use

The [.github/workflows/automated-validation.yml](.github/workflows/automated-validation.yml) file in this repository contains an example workflow that executes this action. Additionally, below are two examples for incorporating this action into an existing workflow:

### Example With Variables

```
- uses: PaulRosenthal/Jekyll-Deploy-Test-Action@main
  with:
    gemfile-location: '/sample-jekyll-website'
    site-directory: '/sample-jekyll-website'
```

### Example Without Variables

```
- uses: PaulRosenthal/Jekyll-Deploy-Test-Action@main
```

### Example With Variables and Archiving Test Build

The test build files can be archived each time a workflow is executed, and downloaded for review or further verification.

In the example below, files from the test build will be saved in a zip file titled *test_build*:
```
- uses: PaulRosenthal/Jekyll-Deploy-Test-Action@main
  with:
    gemfile-location: '/sample-jekyll-website'
    site-directory: '/sample-jekyll-website'
- uses: actions/upload-artifact@v2
  with:
    name: test_build
    path: _site
```