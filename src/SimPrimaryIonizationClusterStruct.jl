
include("Vector3dStruct.jl")
mutable struct SimPrimaryIonizationClusterStruct{MCParticleT}
	cellID::UInt64
	time::Float32
	position::Vector3dStruct
	type::Int16
	MCParticle::Union{Nothing, MCParticleT }
	electronCellID::Vector{ UInt64 }
	electronTime::Vector{ Float32 }
	electronPosition::Vector{ Vector3dStruct }
	pulseTime::Vector{ Float32 }
	pulseAmplitude::Vector{ Float32 }
end
