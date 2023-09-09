
mutable struct RecoParticleVertexAssociationStruct{ReconstructedParticleT,VertexT}
	weight::Float32
	rec::Union{Nothing, ReconstructedParticleT }
	vertex::Union{Nothing, VertexT }
end
