# mkdocs-page-builder
Github Action to build MkDocs source files as static pages, supporting multiple config files.

## Usage

The `mkdocs.yml` in the root directory will be used by default.
```yaml
jobs:
  build:
    name: Build MkDocs Pages
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Build Pages
        uses: Kjuly/mkdocs-page-builder@main
```

If you have multiple config files to handle multi-languages, you can provide `config_files`:
```yaml
uses: Kjuly/mkdocs-page-builder@main
with:
  config_files: |-
    config/en/mkdocs.yml
    config/zh-Hans/mkdocs.yml
```

---

The build page will be stored in `${{ github.workspace }}/build`.

For output usage, please refer to [MkDocs Page Publisher](mkdocs-page-publisher), which will publish to Github Pages.


  [mkdocs-page-publisher]: https://github.com/Kjuly/mkdocs-page-publisher
