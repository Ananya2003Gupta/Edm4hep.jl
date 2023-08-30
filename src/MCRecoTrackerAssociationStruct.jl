mutable struct MCRecoTrackerAssociationStruct{TrackerHitT,SimTrackerHitT}
	weight::Float32
	rec::Union{Nothing, TrackerHitT }
	sim::Union{Nothing, SimTrackerHitT }
end
