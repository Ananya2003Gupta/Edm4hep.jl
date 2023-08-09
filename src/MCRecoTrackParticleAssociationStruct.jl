mutable struct MCRecoTrackParticleAssociationStruct{TrackT,MCParticleT}
	weight::Float32
	rec::Union{Nothing, TrackT }
	sim::Union{Nothing, MCParticleT }
end
