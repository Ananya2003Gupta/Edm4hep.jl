
include("Vector3fStruct.jl")
using StaticArrays
mutable struct ClusterStruct{CalorimeterHitT,ClusterT,ParticleIDT}
	type::Int32
	energy::Float32
	energyError::Float32
	position::Vector3fStruct
	positionError::MVector{6, Float32}
	iTheta::Float32
	phi::Float32
	directionError::Vector3fStruct
	clusters::Vector{ ClusterT }
	hits::Vector{ CalorimeterHitT }
	particleIDs::Vector{ ParticleIDT }
	shapeParameters::Vector{ Float32 }
	subdetectorEnergies::Vector{ Float32 }
end
