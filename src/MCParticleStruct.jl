include("Vector2iStruct.jl")
include("Vector3dStruct.jl")
include("Vector3fStruct.jl")

mutable struct MCParticleStruct{MCParticleT}
	PDG::Int32
	generatorStatus::Int32
	simulatorStatus::Int32
	charge::Float32
	time::Float32
	mass::Float64
	vertex::Vector3dStruct
	endpoint::Vector3dStruct
	momentum::Vector3fStruct
	momentumAtEndpoint::Vector3fStruct
	spin::Vector3fStruct
	colorFlow::Vector2iStruct
	parents::Vector{ MCParticleT }
	daughters::Vector{ MCParticleT }
end
