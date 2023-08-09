mutable struct MCRecoCaloParticleAssociationStruct{MCParticleT,CalorimeterHitT}
	weight::Float32
	rec::Union{Nothing, CalorimeterHitT }
	sim::Union{Nothing, MCParticleT }
end
