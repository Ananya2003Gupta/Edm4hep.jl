
mutable struct MCRecoCaloParticleAssociationStruct{CalorimeterHitT,MCParticleT}
	weight::Float32
	rec::Union{Nothing, CalorimeterHitT }
	sim::Union{Nothing, MCParticleT }
end
