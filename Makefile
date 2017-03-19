.PHONY: commit results

commit:
	@echo "building README..."
	python summarize.py


results: 
	@echo "building results..."
	julia -E 'include("julia/util.jl"); util.problem_iterator()'
