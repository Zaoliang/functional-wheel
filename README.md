# functional-wheel
This is a wheel repository which can be used for os-autoinst-distri-opensuse (functional)
Arccoding to the blog at https://kalikiana.gitlab.io/post/2022-08-04-re-inventing-the-wheel

#### Usage: 
check unit tests or function of openQA tests which can be run in container environment directly on github.

#### repository structure

Thedirectories 'lib', 'tests', 'needles' are required.

'.github/workflows' is the directory. It contains configurations to control running tests or library files for unit tests. 

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
          schedule: tests/console/save_ulog,tests/console/do_nothing
      - uses: actions/upload-artifact@v2
        with:
          name: Test results
          path: .
        if: always()

~~~

'isotovideo-action' is the directory which contains action.yml, the action.yml is actually the configuration file for runs.

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

At moment the wheels rely on os-autoinst and support to run unit tests only. The library of os-autoinst-distri-opensuse cannot be used directly.

Due to the concept of wheel at this stage, we need to implemt own wheel rules to be able support to run openQA functional tests using own existing libray directly on github, by using a docker image (SLES product).


#### Notes
I see there are some potenials in wheel: test against new build by some sanity checks started directly via github workflow.



