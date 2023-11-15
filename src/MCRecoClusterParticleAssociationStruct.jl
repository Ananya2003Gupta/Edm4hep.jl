mutable struct MCRecoClusterParticleAssociationStruct{ClusterT,MCParticleT}
	weight::Float32
	rec::Union{Nothing, ClusterT }
	sim::Union{Nothing, MCParticleT }
end
