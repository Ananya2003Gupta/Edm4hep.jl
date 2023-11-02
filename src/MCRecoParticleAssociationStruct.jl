mutable struct MCRecoParticleAssociationStruct{MCParticleT,ReconstructedParticleT}
	weight::Float32
	rec::Union{Nothing, ReconstructedParticleT }
	sim::Union{Nothing, MCParticleT }
end
