#!/usr/local/bin/julia
using SymPy
m, n, k = symbols("m, n, k", real=true, integer=true, positive=true)
# From the problem statement, 
Pm = 3//2*m^2 - 1//2*m
Pσ = subs(Pm, m, n) + subs(Pm, m, n + k)
Pδ = subs(Pm, m, n + k) - subs(Pm, m, n )

# where Pσ denotes pentagonal sums with adjancency k and Pδ denotes pentagonal differences with
# adjacency k. 
# For a given k, find m, n s.t. Pm = Pσ and Pm = Pδ. Solve Pm = Pδ for n, giving an expression
# in m only. 
#= f(n) = round(Int, n.*(3*n - 1)/2) =#
Pσi, Pδi, Pmδ = symbols("Pσi, Pδi, Pmδ") 
for i = 1:1000
    Pσi = subs(Pσ, k, i) 
    Pδi = subs(Pδ, k, i) 
    n_term_m = solve(Eq(Pm, Pδi), n)[1]
    Pδi = simplify(subs(Pδi, n, n_term_m))
    Pσi = simplify(subs(Pσi, n, n_term_m)) 
    #= @show(Pσi) =#
    #= @show(Pδi) =#
    #= @show(n_term_m) =#
    try
        M = solve(Eq(Pm, Pσi), m)[1]
        N = subs(Pσi, m, M) 
        N2 = subs(Pδi, m, M) 
        println("m: $M, n, $N, k: $i")
        println("Test: $(N == N2)\n")
    catch
        println("Fail, k: $i")
        continue
    end
    #= if N > 0 =#
    #=     println("Hit! m: $M, n, $N, k: $k") =#
    #= else =#
    #=     println("Fail, k: $i") =#
    #= end =#
end

