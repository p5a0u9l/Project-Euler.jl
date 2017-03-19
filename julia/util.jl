"""
my utility functions for project euler solutions
"""

module util
using PyCall

io = open(".results.md", "w")

function problem_iterator()
    @pyimport glob
    @printf(io, "| Problem | Iterations | Mean (ms) | Std (ms) |\n")
    @printf(io, "| ------- | ---------- | --------- | -------- |\n")
    [_profile(file) for file in glob.glob("julia/problem*jl")]
    close(io)
end

function _profile(file)
    @printf(io, "| %s | ", file)
    problem = include(file)
    func = eval(problem.solve)
    try
        eval(func)
        @printf("%s works, now profiling...\n", file)
    catch
        @printf("%s failed...\n", file)
        @printf(io, "x | x | x |\n")
        return
    end
    profile(func, 50);
end

function profile(func, N)
    results = zeros(N)
    rd = open("/dev/null", "w")
    redirect_stdout(rd)
    for i = 1:N
        results[i] = @elapsed func()
    end

    @printf(io, "%d | %.5f | %.5f |\n", N, mean(results)*1000, std(results)*1000)
    redirect_stdout(STDOUT)
end

end
