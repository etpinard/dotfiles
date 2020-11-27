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
    # https://timholy.github.io/Revise.jl/stable/config/#Julia-1.5-and-higher-1
    try
        @info "Turning on Revise"
        @eval using Revise
        if VERSION < v"1.5.0"
            @async Revise.wait_steal_repl_backend()
        end
        # print the Revise version
        # N.B. if Revise is part of the activated environment
        #      the julia session will use that version
        @eval using Pkg
        Pkg.status("Revise")
    catch e
        @warn "Error initializing Revise" exception=(e, catch_backtrace())
    end
end
