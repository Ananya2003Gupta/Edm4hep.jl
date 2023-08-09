mutable struct MCRecoClusterParticleAssociationStruct{MCParticleT,ClusterT}
	weight::Float32
	rec::Union{Nothing, ClusterT }
	sim::Union{Nothing, MCParticleT }
end
