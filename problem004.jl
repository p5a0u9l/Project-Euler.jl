#!/usr/local/bin/julia

function p004(N)
    maxCircular = 0
    maxDiv = 1
    for d = 2:N-1
        c = 0; match = 0
        bigstr = replace(string(BigInt(1)/d), ".", "")
        bigstr = replace(bigstr, "e-01", "")[2:end-2]
        K = length(bigstr) # 77 
        for i = 1:div(K, 2)
            a = bigstr[1:i]
            r = bigstr[1+i:1+i+length(a)-1]
            if a == r 
                if match == 1
                    j = round(Int, i/2)
                    if a[1:j] == a[j+1:end]; break; end
                end
                c = i
                if c > maxCircular;
                    maxCircular = c;
                    maxDiv = d
                end
                match = 1
            end
        end
    end
    println("The denominator which generates the longest recurring ")
    println("cycle is $maxDiv, with length $maxCircular")
end

Base.MPFR.set_bigfloat_precision(2^13)
@time p004(1000)

