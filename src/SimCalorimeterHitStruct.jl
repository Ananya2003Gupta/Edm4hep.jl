
include("Vector3fStruct.jl")
mutable struct SimCalorimeterHitStruct{CaloHitContributionT}
	cellID::UInt64
	energy::Float32
	position::Vector3fStruct
	contributions::Vector{ CaloHitContributionT }
end