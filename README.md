# build-utils

Uses [rtx](https://github.com/jdxcode/rtx) to install required build tools and [task](https://github.com/go-task/task) as a task runner.


## Local Setup Script

`curl https://raw.githubusercontent.com/luckydye/build-utils/main/setup.sh | bash`

This script will install and setup:
- [rtx](https://github.com/jdxcode/rtx)
- [task](https://github.com/go-task/task)
- [jetp](https://www.jetporch.com/)

*Alternatively* install task and rtx with brew using `brew install rtx task`

### Supported platforms

- linux/ubuntu
- linux/alpine
- osx/arm
- osx/amd


## Example Gitlab CI config

```yaml
image: luckydye/build-utils

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
