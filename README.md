# functional-wheel
This is a wheel repository which can be used for os-autoinst-distri-opensuse (functional)
Arccoding to the blog at https://kalikiana.gitlab.io/post/2022-08-04-re-inventing-the-wheel

#### Usage: 
check unit tests or function test of openQA tests, the tests can be run in docker container directly on github.

#### repository

The repository contains directories 'lib', 'tests', 'needles'. These directories are required by openQA os-autoinst.
It contains '.github/workflows'. In this directory we have a yaml action file which controls running tests (here unit tests). 

##### .github/workflows/isotovideo.yml

~~~
# This is a workflow to get started with Actions

name: CI

# Controls when the workflow will run
on: [push, pull_request]
jobs:
  isotovideo:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: kalikiana/isotovideo-action@main
        with:
          schedule: tests/save_ulog,tests/show_dir,tests/write2log
      - uses: actions/upload-artifact@v2
        with:
          name: Test results
          path: .
        if: always()

~~~

'isotovideo-action' is the directory contained action.yml

##### isotovideo-action/action.yaml 

~~~
name: 'Isotovideo test runner'
description: 'Execute standalone openQA tests within containers'
branding:
  icon: 'check-circle'
  color: 'green'

inputs:
  schedule:
    description: The test modules to be executed
    required: false
    default: ''

runs:
  using: docker
  image: "docker://registry.opensuse.org/devel/openqa/containers-tw/isotovideo:qemu-x86"
  args:
    - QEMU_NO_KVM=1
    - CASEDIR=.
    - SCHEDULE=${{ inputs.schedule }}

~~~


#### Limitations

At moment the wheels rely on os-autoinst and it supports to run unit tests only. Therefore the library of os-autoinst-distri-opensuse cannot be used directly.


#### Ideas and Notes

Self-hosted runner can be a solution for us to run openQA tests. It requires setup of these runner machine with private respository and installation of self-hosted runner application.
See https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners

Or use a different docker image (SLES product) to run automated tests in container.

