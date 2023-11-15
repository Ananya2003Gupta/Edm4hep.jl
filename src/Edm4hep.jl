module Edm4hep

export Vector3f
export Vector3d
export Vector2i
export Vector2f
export AbstractrackState
export ObjectID
export Quantity
export Hypothesis
export HitLevelData
export EventHeader
export MCParticle
export SimAbstractrackerHit
export CaloHitContribution
export SimCalorimeterHit
export RawCalorimeterHit
export CalorimeterHit
export ParticleID
export Cluster
export AbstractrackerHit
export AbstractrackerHitPlane
export RawAbstractimeSeries
export Abstractrack
export Vertex
export ReconstructedParticle
export MCRecoParticleAssociation
export MCRecoCaloAssociation
export MCRecoAbstractrackerAssociation
export MCRecoAbstractrackerHitPlaneAssociation
export MCRecoCaloParticleAssociation
export MCRecoClusterParticleAssociation
export MCRecoAbstractrackParticleAssociation
export RecoParticleVertexAssociation
export SimPrimaryIonizationCluster
export AbstractrackerPulse
export RecIonizationCluster
export AbstractimeSeries
export RecDqdx

using StaticArrays

abstract type EventHeaderAbstract end
abstract type MCParticleAbstract end
abstract type SimAbstractrackerHitAbstract end
abstract type CaloHitContributionAbstract end
abstract type SimCalorimeterHitAbstract end
abstract type RawCalorimeterHitAbstract end
abstract type CalorimeterHitAbstract end
abstract type ParticleIDAbstract end
abstract type ClusterAbstract end
abstract type AbstractrackerHitAbstract end
abstract type AbstractrackerHitPlaneAbstract end
abstract type RawAbstractimeSeriesAbstract end
abstract type AbstractrackAbstract end
abstract type VertexAbstract end
abstract type ReconstructedParticleAbstract end
abstract type MCRecoParticleAssociationAbstract end
abstract type MCRecoCaloAssociationAbstract end
abstract type MCRecoAbstractrackerAssociationAbstract end
abstract type MCRecoAbstractrackerHitPlaneAssociationAbstract end
abstract type MCRecoCaloParticleAssociationAbstract end
abstract type MCRecoClusterParticleAssociationAbstract end
abstract type MCRecoAbstractrackParticleAssociationAbstract end
abstract type RecoParticleVertexAssociationAbstract end
abstract type SimPrimaryIonizationClusterAbstract end
abstract type AbstractrackerPulseAbstract end
abstract type RecIonizationClusterAbstract end
abstract type AbstractimeSeriesAbstract end
abstract type RecDqdxAbstract end

mutable struct Vector3f
	x::Float32
	y::Float32
	z::Float32
end

mutable struct Vector3d
	x::Float64
	y::Float64
	z::Float64
end

mutable struct Vector2i
	a::Int32
	b::Int32
end

mutable struct Vector2f
	a::Float32
	b::Float32
end

mutable struct AbstractrackState
	location::Int32
	D0::Float32
	phi::Float32
	omega::Float32
	Z0::Float32
	tanLambda::Float32
	time::Float32
	referencePoint::Vector3f
	covMatrix::MVector{21, Float32}
end

mutable struct ObjectID
	index::Int32
	collectionID::Int32
end

mutable struct Quantity
	type::Int16
	value::Float32
	error::Float32
end

mutable struct Hypothesis
	chi2::Float32
	expected::Float32
	sigma::Float32
end

mutable struct HitLevelData
	cellID::UInt64
	N::UInt32
	eDep::Float32
	pathLength::Float32
end

mutable struct EventHeader <: EventHeaderAbstract
	eventNumber::Int32
	runNumber::Int32
	timeStamp::UInt64
	weight::Float32
end

mutable struct MCParticle <: MCParticleAbstract
	PDG::Int32
	generatorStatus::Int32
	simulatorStatus::Int32
	charge::Float32
	time::Float32
	mass::Float64
	vertex::Vector3d
	endpoint::Vector3d
	momentum::Vector3f
	momentumAtEndpoint::Vector3f
	spin::Vector3f
	colorFlow::Vector2i
	parents::Vector{ MCParticleAbstract }
	daughters::Vector{ MCParticleAbstract }
end

mutable struct SimAbstractrackerHit <: SimAbstractrackerHitAbstract
	cellID::UInt64
	EDep::Float32
	time::Float32
	pathLength::Float32
	quality::Int32
	position::Vector3d
	momentum::Vector3f
	MCParticle::Union{Nothing, MCParticleAbstract }
end

mutable struct CaloHitContribution <: CaloHitContributionAbstract
	PDG::Int32
	energy::Float32
	time::Float32
	stepPosition::Vector3f
	particle::Union{Nothing, MCParticleAbstract }
end

mutable struct SimCalorimeterHit <: SimCalorimeterHitAbstract
	cellID::UInt64
	energy::Float32
	position::Vector3f
	contributions::Vector{ CaloHitContributionAbstract }
end

mutable struct RawCalorimeterHit <: RawCalorimeterHitAbstract
	cellID::UInt64
	amplitude::Int32
	timeStamp::Int32
end

mutable struct CalorimeterHit <: CalorimeterHitAbstract
	cellID::UInt64
	energy::Float32
	energyError::Float32
	time::Float32
	position::Vector3f
	type::Int32
end

mutable struct ParticleID <: ParticleIDAbstract
	type::Int32
	PDG::Int32
	algorithmAbstractype::Int32
	likelihood::Float32
	parameters::Vector{ Float32 }
end

mutable struct Cluster <: ClusterAbstract
	type::Int32
	energy::Float32
	energyError::Float32
	position::Vector3f
	positionError::MVector{6, Float32}
	iAbstractheta::Float32
	phi::Float32
	directionError::Vector3f
	clusters::Vector{ ClusterAbstract }
	hits::Vector{ CalorimeterHitAbstract }
	particleIDs::Vector{ ParticleIDAbstract }
	shapeParameters::Vector{ Float32 }
	subdetectorEnergies::Vector{ Float32 }
end

mutable struct AbstractrackerHit <: AbstractrackerHitAbstract
	cellID::UInt64
	type::Int32
	quality::Int32
	time::Float32
	eDep::Float32
	eDepError::Float32
	position::Vector3d
	covMatrix::MVector{6, Float32}
	rawHits::Vector{ ObjectID }
end

mutable struct AbstractrackerHitPlane <: AbstractrackerHitPlaneAbstract
	cellID::UInt64
	type::Int32
	quality::Int32
	time::Float32
	eDep::Float32
	eDepError::Float32
	u::Vector2f
	v::Vector2f
	du::Float32
	dv::Float32
	position::Vector3d
	covMatrix::MVector{6, Float32}
	rawHits::Vector{ ObjectID }
end

mutable struct RawAbstractimeSeries <: RawAbstractimeSeriesAbstract
	cellID::UInt64
	quality::Int32
	time::Float32
	charge::Float32
	interval::Float32
	adcCounts::Vector{ Int32 }
end

mutable struct Abstractrack <: AbstractrackAbstract
	type::Int32
	chi2::Float32
	ndf::Int32
	dEdx::Float32
	dEdxError::Float32
	radiusOfInnermostHit::Float32
	trackerHits::Vector{ AbstractrackerHitAbstract }
	tracks::Vector{ AbstractrackAbstract }
	subdetectorHitNumbers::Vector{ Int32 }
	trackStates::Vector{ AbstractrackState }
	dxQuantities::Vector{ Quantity }
end

mutable struct Vertex <: VertexAbstract
	primary::Int32
	chi2::Float32
	probability::Float32
	position::Vector3f
	covMatrix::MVector{6, Float32}
	algorithmAbstractype::Int32
	associatedParticle::Union{Nothing, ReconstructedParticleAbstract }
	parameters::Vector{ Float32 }
end

mutable struct ReconstructedParticle <: ReconstructedParticleAbstract
	type::Int32
	energy::Float32
	momentum::Vector3f
	referencePoint::Vector3f
	charge::Float32
	mass::Float32
	goodnessOfPID::Float32
	covMatrix::MVector{10, Float32}
	clusters::Vector{ ClusterAbstract }
	tracks::Vector{ AbstractrackAbstract }
	particles::Vector{ ReconstructedParticleAbstract }
	particleIDs::Vector{ ParticleIDAbstract }
	startVertex::Union{Nothing, VertexAbstract }
	particleIDUsed::Union{Nothing, ParticleIDAbstract }
end

mutable struct MCRecoParticleAssociation <: MCRecoParticleAssociationAbstract
	weight::Float32
	rec::Union{Nothing, ReconstructedParticleAbstract }
	sim::Union{Nothing, MCParticleAbstract }
end

mutable struct MCRecoCaloAssociation <: MCRecoCaloAssociationAbstract
	weight::Float32
	rec::Union{Nothing, CalorimeterHitAbstract }
	sim::Union{Nothing, SimCalorimeterHitAbstract }
end

mutable struct MCRecoAbstractrackerAssociation <: MCRecoAbstractrackerAssociationAbstract
	weight::Float32
	rec::Union{Nothing, AbstractrackerHitAbstract }
	sim::Union{Nothing, SimAbstractrackerHitAbstract }
end

mutable struct MCRecoAbstractrackerHitPlaneAssociation <: MCRecoAbstractrackerHitPlaneAssociationAbstract
	weight::Float32
	rec::Union{Nothing, AbstractrackerHitPlaneAbstract }
	sim::Union{Nothing, SimAbstractrackerHitAbstract }
end

mutable struct MCRecoCaloParticleAssociation <: MCRecoCaloParticleAssociationAbstract
	weight::Float32
	rec::Union{Nothing, CalorimeterHitAbstract }
	sim::Union{Nothing, MCParticleAbstract }
end

mutable struct MCRecoClusterParticleAssociation <: MCRecoClusterParticleAssociationAbstract
	weight::Float32
	rec::Union{Nothing, ClusterAbstract }
	sim::Union{Nothing, MCParticleAbstract }
end

mutable struct MCRecoAbstractrackParticleAssociation <: MCRecoAbstractrackParticleAssociationAbstract
	weight::Float32
	rec::Union{Nothing, AbstractrackAbstract }
	sim::Union{Nothing, MCParticleAbstract }
end

mutable struct RecoParticleVertexAssociation <: RecoParticleVertexAssociationAbstract
	weight::Float32
	rec::Union{Nothing, ReconstructedParticleAbstract }
	vertex::Union{Nothing, VertexAbstract }
end

mutable struct SimPrimaryIonizationCluster <: SimPrimaryIonizationClusterAbstract
	cellID::UInt64
	time::Float32
	position::Vector3d
	type::Int16
	MCParticle::Union{Nothing, MCParticleAbstract }
	electronCellID::Vector{ UInt64 }
	electronAbstractime::Vector{ Float32 }
	electronPosition::Vector{ Vector3d }
	pulseAbstractime::Vector{ Float32 }
	pulseAmplitude::Vector{ Float32 }
end

mutable struct AbstractrackerPulse <: AbstractrackerPulseAbstract
	cellID::UInt64
	time::Float32
	charge::Float32
	quality::Int16
	covMatrix::MVector{3, Float32}
	timeSeries::Union{Nothing, AbstractimeSeriesAbstract }
end

mutable struct RecIonizationCluster <: RecIonizationClusterAbstract
	cellID::UInt64
	significance::Float32
	type::Int16
	trackerPulse::Vector{ AbstractrackerPulseAbstract }
end

mutable struct AbstractimeSeries <: AbstractimeSeriesAbstract
	cellID::UInt64
	time::Float32
	interval::Float32
	amplitude::Vector{ Float32 }
end

mutable struct RecDqdx <: RecDqdxAbstract
	dQdx::Quantity
	particleAbstractype::Int16
	type::Int16
	hypotheses::MVector{5, Hypothesis}
	track::Union{Nothing, AbstractrackAbstract }
	hitData::Vector{ HitLevelData }
end

end
