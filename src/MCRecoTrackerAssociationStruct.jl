mutable struct MCRecoTrackerAssociationStruct{SimTrackerHitT,TrackerHitT}
	weight::Float32
	rec::Union{Nothing, TrackerHitT }
	sim::Union{Nothing, SimTrackerHitT }
end
