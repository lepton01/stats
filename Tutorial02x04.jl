#22-02-2023

using Statistics, StatsBase, HypothesisTests

cal = Float64.([144, 151, 157, 170, 152, 145, 175, 149, 99, 113, 140, 102, 135, 149, 149, 68, 136, 144, 72, 97])
describe(cal)
σ = std(cal; corrected = false)
sigma = sqrt(sum((cal .- mean(cal)).^2)/length(cal))
c1 = sigma == σ
c2 = sem(cal)
;