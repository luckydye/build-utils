#!/bin/bash

# install rtx
# setup global rtx config

# install taskfile
# setup global taskfile config

CWD=$(pwd)
ARCH=$(uname -m)
PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')

echo Running setup for $PLATFORM on $ARCH.

# case $ARCH in#   arm64*)
#     echo "ARM"
#     ;;
#   amd64*)
#     echo "x64"
#     ;;
#   *)
#     echo "Architecture not implemented."
#     exit 1
#     ;;
# esa

function test() {
  if ! command -v rtx &> /dev/null
  then
    echo Error: installation was not successful!
    exit 1
  fi
  if ! command -v rtx exec task &> /dev/null
  then
    echo Error: installation was not successful!
    exit 1
  fi
}

function require_curl() {
  if ! command -v curl &> /dev/null
  then
    # try to autoinstall curl
    case $PLATFORM in

      linux*)
        if command -v apt &> /dev/null
        then
          apt update -y
          apt install curl -y
          return
        fi
        if command -v apk &> /dev/null
        then
          apk add curl
          return
        fi
        ;;

      darwin*)
        brew install curl
        return
        ;;
    esac
  else
    return
  fi

  echo Error: "curl" not found. Please install curl manually and run again.
  exit 1
}

function require_git() {
  # git is required for rtx
  if ! command -v git &> /dev/null
  then
    # try to autoinstall git
    case $PLATFORM in

      linux*)
        if command -v apt &> /dev/null
        then
          apt update -y
          apt install git -y
          return
        fi
        if command -v apk &> /dev/null
        then
          apk add git
          return
        fi
        ;;

      darwin*)
        brew install git
        return
        ;;
    esac
  else
    return
  fi

  echo Error: "git" not found. Please install git manually and run again.
  exit 1
}

function install_rtx_linux() {
  if command -v apk &> /dev/null
  then
    # for alpine container
    apk add --update --no-cache bash rtx
    return
  fi

  curl https://rtx.pub/install.sh | RTX_INSTALL_PATH=~/bin/rtx sh
  echo 'eval "$(~/bin/rtx activate bash)"' >> ~/.bashrc
  echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
  export PATH=~/bin:$PATH
}

function install_rtx_osx() {
  brew install rtx
  echo 'eval "$(rtx activate bash)"' >> ~/.zshrc
}

function setup() {
  eval "$(rtx activate bash)"
  rtx install task
  rtx use -g task

  # init global taskfile
  cd ~
  curl curl https://raw.githubusercontent.com/luckydye/build-utils/main/Taskfile.global.yml > Taskfile.yml
  cd $CWD
}

function motd() {
  Clear='\033[0m'
  BWhite='\033[1;37m'

  echo "$BWhite\nSetup complete.\n\n"

  echo "Installed:\n"
  echo " $BWhite task $Clear(https://github.com/go-task/task)"
  echo " $BWhite rtx $Clear(https://github.com/jdxcode/rtx)"
  echo "\n"

  echo "TL;DR usage:\n"
  echo " $BWhite task -l $Clear-- List all tasks of a project."
  echo ""
  echo " $BWhite rtx install $Clear-- Install tools for a project."
  echo " $BWhite rtx use <tool> $Clear-- Install and use a specific tool."

  echo "$BWhite\nOpen a new shell to begin.\n"
}

echo "\n[0/3] Installing requirements...\n"
require_curl
require_git

echo "\n[1/3] Installing rtx...\n"
case $PLATFORM in

  linux*)
    install_rtx_linux
    ;;

  darwin*)
    install_rtx_osx
    ;;

  # msys*)
  #   echo "windows"
  #   ;;

  *)
    echo Platform not implemented.
    exit 1
    ;;
esac

echo "\n[2/3] Setup enviroment...\n"
setup

echo "\n[3/3] Running tests...\n"
test

motd
exit
