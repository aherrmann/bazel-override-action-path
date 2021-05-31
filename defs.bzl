def _demo_impl(ctx):
    out_run = ctx.actions.declare_file(ctx.label.name + ".run")
    ctx.actions.run(
        arguments = [out_run.path],
        executable = ctx.executable._runner,
        env = {
            "PATH": "/custom",
        },
        outputs = [out_run],
    )
    out_run_shell = ctx.actions.declare_file(ctx.label.name + ".run_shell")
    ctx.actions.run_shell(
        command = 'echo "PATH: $PATH" > {}'.format(out_run_shell.path),
        env = {
            "PATH": "/custom",
        },
        outputs = [out_run_shell],
    )
    return [DefaultInfo(
        files = depset(direct = [out_run, out_run_shell]),
    )]

demo = rule(
    _demo_impl,
    attrs = {
        "_runner": attr.label(
            cfg = "host",
            default = "//:runner",
            executable = True,
        ),
    },
)
