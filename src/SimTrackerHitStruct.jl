
include("Vector3dStruct.jl")
include("Vector3fStruct.jl")
mutable struct SimTrackerHitStruct{MCParticleT}
	cellID::UInt64
	EDep::Float32
	time::Float32
	pathLength::Float32
	quality::Int32
	position::Vector3dStruct
	momentum::Vector3fStruct
	MCParticle::Union{Nothing, MCParticleT }
end
