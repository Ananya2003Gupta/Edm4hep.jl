include("Vector3fStruct.jl")
mutable struct CalorimeterHitStruct
	cellID::UInt64
	energy::Float32
	energyError::Float32
	time::Float32
	position::Vector3fStruct
	type::Int32
end
