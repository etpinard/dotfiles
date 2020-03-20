# to not load startup file:
#
# $ julia --startup-file=no

atreplinit() do repl
    # taken from
    # https://discourse.julialang.org/t/my-startup-jl-for-revise-juno/22170
    try
        @eval using Pkg
        if isfile("Project.toml")
            # auto-activate project in current directory
            @info "Activating project in $(pwd())"
            Pkg.activate(".")
        end
    catch e
        @warn(e.msg)
    end

    # taken from
    # https://github.com/timholy/Revise.jl/blob/373d4e570fe8a22f914e1a3d8693cec5d3b1d947/docs/src/config.md#using-revise-by-default
    try
        @info "Turning on Revise"
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch e
        @warn(e.msg)
    end
end
