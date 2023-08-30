mutable struct RecIonizationClusterStruct{TrackerPulseT}
	cellID::UInt64
	significance::Float32
	type::Int16
	trackerPulse::Vector{ TrackerPulseT }
end

