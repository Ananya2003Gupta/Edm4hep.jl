using StaticArrays

mutable struct TrackerPulseStruct{TimeSeriesT}
	cellID::UInt64
	time::Float32
	charge::Float32
	quality::Int16
	covMatrix::MVector{3, Float32}
	timeSeries::Union{Nothing, TimeSeriesT }
end
