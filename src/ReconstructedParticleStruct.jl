using StaticArrays

include("Vector3fStruct.jl")
mutable struct ReconstructedParticleStruct{ReconstructedParticleT,TrackT,ClusterT,ParticleIDT,VertexT}
	type::Int32
	energy::Float32
	momentum::Vector3fStruct
	referencePoint::Vector3fStruct
	charge::Float32
	mass::Float32
	goodnessOfPID::Float32
	covMatrix::MVector{10, Float32}
	clusters::Vector{ ClusterT }
	tracks::Vector{ TrackT }
	particles::Vector{ ReconstructedParticleT }
	particleIDs::Vector{ ParticleIDT }
	startVertex::Union{Nothing, VertexT }
	particleIDUsed::Union{Nothing, ParticleIDT }
end
