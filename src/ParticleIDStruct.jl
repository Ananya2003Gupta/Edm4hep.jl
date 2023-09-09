
mutable struct ParticleIDStruct
	type::Int32
	PDG::Int32
	algorithmType::Int32
	likelihood::Float32
	parameters::Vector{ Float32 }
end
