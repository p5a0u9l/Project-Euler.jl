
function p033()
    for n = 10:98, d = n + 1:99
        num = string(n); den = string(d);
        for i = 1:2, j = 1:2
            if in('0', num) || in('0', den); continue; end
            if num[i] == den[j]
                f = n/d
                num_ = num[(i % 2) + 1]; den_ = den[(j % 2) + 1];
                if f == parse(Int, num_)/parse(Int, den_)
                    println("$num/$den = $num_/$den_ = $f")
                end
            end
        end
    end
end

@time p033();

