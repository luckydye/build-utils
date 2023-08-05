# build-utils

Uses [rtx](https://github.com/jdxcode/rtx) to install required build tools.

## Example Gitlab CI config

```yaml
image: luckydye/buildapp

variables:
  RTX_DATA_DIR: $CI_PROJECT_DIR/.rtx

cache:
  - key:
      files:
        - .rtx.toml
    paths:
      - .rtx

before_script:
  - export PATH=$RTX_DATA_DIR/shims:$PATH
  - task setup
```
