include("ObjectIDStruct.jl")
include("Vector3dStruct.jl")
using StaticArrays

mutable struct TrackerHitStruct
	cellID::UInt64
	type::Int32
	quality::Int32
	time::Float32
	eDep::Float32
	eDepError::Float32
	position::Vector3dStruct
	covMatrix::MVector{6, Float32}
	rawHits::Vector{ ObjectIDStruct }
end
