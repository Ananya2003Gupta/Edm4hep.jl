mutable struct MCRecoTrackParticleAssociationStruct{MCParticleT,TrackT}
	weight::Float32
	rec::Union{Nothing, TrackT }
	sim::Union{Nothing, MCParticleT }
end
