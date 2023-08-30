using StaticArrays
include("Vector3fStruct.jl")
mutable struct TrackStateStruct
	location::Int32
	D0::Float32
	phi::Float32
	omega::Float32
	Z0::Float32
	tanLambda::Float32
	time::Float32
	referencePoint::Vector3fStruct
	covMatrix::MVector{21, Float32}
end
