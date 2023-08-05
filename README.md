# build-utils

Uses [rtx](https://github.com/jdxcode/rtx) to install required build tools.

## Example Gitlab CI config

```yaml
default:
  image: luckydye/build-utils:latest
  cache:
    key:
      files:
        - .rtx.toml
    paths:
      - /root/.cache/rtx
  before_script:
    - rtx install
    - task setup
```
