include("Vector3fStruct.jl")
mutable struct CaloHitContributionStruct{MCParticleT}
	PDG::Int32
	energy::Float32
	time::Float32
	stepPosition::Vector3fStruct
	particle::Union{Nothing, MCParticleT }
end
