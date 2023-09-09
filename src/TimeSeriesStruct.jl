
mutable struct TimeSeriesStruct
	cellID::UInt64
	time::Float32
	interval::Float32
	amplitude::Vector{ Float32 }
end
