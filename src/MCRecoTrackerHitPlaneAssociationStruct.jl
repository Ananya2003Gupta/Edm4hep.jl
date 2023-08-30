mutable struct MCRecoTrackerHitPlaneAssociationStruct{SimTrackerHitT,TrackerHitPlaneT}
	weight::Float32
	rec::Union{Nothing, TrackerHitPlaneT }
	sim::Union{Nothing, SimTrackerHitT }
end