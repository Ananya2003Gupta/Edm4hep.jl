
mutable struct MCRecoCaloAssociationStruct{CalorimeterHitT,SimCalorimeterHitT}
	weight::Float32
	rec::Union{Nothing, CalorimeterHitT }
	sim::Union{Nothing, SimCalorimeterHitT }
end
