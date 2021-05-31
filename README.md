```
$ bazel build //:demo
Target //:demo up-to-date:
  bazel-bin/demo.run
  bazel-bin/demo.run_shell
INFO: Build completed successfully, 1 total action

$ cat bazel-bin/demo.run
PATH: /custom

$ cat bazel-bin/demo.run_shell
PATH: /custom
```
