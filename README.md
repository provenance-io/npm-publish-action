# npm-publish-action

This GitHub action publishes the Provenance Protobuf API to NPM

## Inputs

### `api-version`

**Required** The version number of the Provenance release.

### `npm-token`

**Required** NPM repository authentication token.


### `tag`

**Optional** The npm module tag (alpha, beta).

## Example usage

```
name: NPM Publish

on:
  push:
    tags:
      - "v[0-9]+.[0-9]+.[0-9]+"     # Push events to matching v*, i.e. v1.0, v20.15.10
      - "v[0-9]+.[0-9]+.[0-9]+-rc*" # Push events to matching v*, i.e. v1.0-rc1, v20.15.10-rc5

 jobs:
   npm_publish:
     runs-on: ubuntu-latest

     steps:
       - name: "Checkout"
         uses: actions/checkout@v3

       - name: "Publish"
         uses: "provenance-io/npm-publish-action@v1"
         with:
           api-version: ${{ GITHUB_REF##*/ }}
           npm-token: ${{ secretes.NPM_TOKEN }}

```