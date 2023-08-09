mutable struct MCRecoCaloAssociationStruct{SimCalorimeterHitT,CalorimeterHitT}
	weight::Float32
	rec::Union{Nothing, CalorimeterHitT }
	sim::Union{Nothing, SimCalorimeterHitT }
end
