"""
my library functions for project euler solutions
"""


module lib
export ispandigi

function ispandigi(p, n)
    d = digits(p);
    return length(d) == n  && length(unique(n)) == 9 && ~in(0, d)
end

end
