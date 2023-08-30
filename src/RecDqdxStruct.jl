using StaticArrays
include("QuantityStruct.jl")

include("HitLevelDataStruct.jl")
include("HypothesisStruct.jl")
mutable struct RecDqdxStruct{TrackT}
	dQdx::QuantityStruct
	particleType::Int16
	type::Int16
	hypotheses::MVector{5, HypothesisStruct}
	track::Union{Nothing, TrackT }
	hitData::Vector{ HitLevelDataStruct }
end
