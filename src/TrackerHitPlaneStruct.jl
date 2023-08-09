include("Vector3dStruct.jl")
include("ObjectIDStruct.jl")
include("Vector2fStruct.jl")
using StaticArrays

mutable struct TrackerHitPlaneStruct
	cellID::UInt64
	type::Int32
	quality::Int32
	time::Float32
	eDep::Float32
	eDepError::Float32
	u::Vector2fStruct
	v::Vector2fStruct
	du::Float32
	dv::Float32
	position::Vector3dStruct
	covMatrix::MVector{6, Float32}
	rawHits::Vector{ ObjectIDStruct }
end
