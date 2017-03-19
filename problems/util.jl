"""
my utility functions for project euler solutions
"""

module util
using PyCall

"""
adapted from https://rosettacode.org/wiki/Factors_of_an_integer#Julia
"""
function divisorsum(n)
    """
    computes the (proper) divisors of a number, ``n``, and return the sum
    """
    f = [one(n)]
    for (p, k) in factor(n)
        f = reduce(vcat, f, [f*p^j for j in 1:k])
    end
    return sum(f[1:end - 1])
end

function profile(func, N)
    results = zeros(N)
    for i = 1:N
        results[i] = @elapsed func()
    end


    @printf(
            "elapsed time %d runs => %.1f ms ± %.1f ms\n",
            N, mean(results)*1000, std(results)*1000)

    @printf("result: %d\n", func())

    @printf("@time macro: "); @time func();
end

function _profile(file)
    @printf("\n------------------------------------------------------------\n")
    @printf("\nprofiling %s...\n", file)
    problem = include(file)
    func = eval(problem.solve)
    profile(func, 50);
end

function problem_iterator()
    """
    julia -E 'include("util.jl"); util.problem_iterator()' > problem_iterator.txt
    """
    @pyimport glob
    [_profile(file) for file in glob.glob("problem*jl")]
end

end
