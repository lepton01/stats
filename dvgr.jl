using DataFrames, CSV, Plots
plotlyjs()

data = CSV.read("airports.csv", DataFrame)

function dist(ap::String)
    x::Float64 = 0
    y::Float64 = 0
    for i in eachindex(data[:, 1])
        if ap == data[i, 1]
            x = data[i, 7]
            y = data[i, 6]
            continue
        end
    end
    C::AbstractArray = zeros(Float64, lastindex(data, 1))
    C =@. √((data[:, 7] - x)^2 + (data[:, 6] - y)^2)
    o = 1000000
    p = 0
    for i in eachindex(C)
        if C[i] == 0
            C[i] = 1*10^10
        end
        if C[i] < o
            o = C[i]
            p = i
        end
    end
    println("$data[p, 1], a $o nm")
end
scatter(data[:, 7], data[:, 6])