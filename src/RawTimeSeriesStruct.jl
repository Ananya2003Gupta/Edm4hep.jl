
mutable struct RawTimeSeriesStruct
	cellID::UInt64
	quality::Int32
	time::Float32
	charge::Float32
	interval::Float32
	adcCounts::Vector{ Int32 }
end
