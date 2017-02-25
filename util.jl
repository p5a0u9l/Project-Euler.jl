"""
my utility functions for project euler solutions
"""

module util

function profile(func, N)
    results = zeros(N)
    for i = 1:N
        results[i] = @elapsed func()
    end

    @printf(
            "elapsed time => %d runs\n\tavg = %.1f ms\n\tstd = %.1f ms\n",
            N, mean(results)*1000, std(results)*1000)

    @printf("\nresult: %d\n", func())

    @printf("\n@time macro: "); @time func();
end

end
