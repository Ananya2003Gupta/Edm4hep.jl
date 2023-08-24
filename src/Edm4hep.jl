module Edm4hep

export Vector3f
export Vector3d
export Vector2i
export Vector2f
export TrackState
export ObjectID
export Quantity
export Hypothesis
export HitLevelData
export EventHeader
export MCParticle
export SimTrackerHit
export CaloHitContribution
export SimCalorimeterHit
export RawCalorimeterHit
export CalorimeterHit
export ParticleID
export Cluster
export TrackerHit
export TrackerHitPlane
export RawTimeSeries
export Track
export Vertex
export ReconstructedParticle
export MCRecoParticleAssociation
export MCRecoCaloAssociation
export MCRecoTrackerAssociation
export MCRecoTrackerHitPlaneAssociation
export MCRecoCaloParticleAssociation
export MCRecoClusterParticleAssociation
export MCRecoTrackParticleAssociation
export RecoParticleVertexAssociation
export SimPrimaryIonizationCluster
export TrackerPulse
export RecIonizationCluster
export TimeSeries
export RecDqdx
export MCParticleCollection

include("Vector3fStruct.jl")
include("Vector3dStruct.jl")
include("Vector2iStruct.jl")
include("Vector2fStruct.jl")
include("TrackStateStruct.jl")
include("ObjectIDStruct.jl")
include("QuantityStruct.jl")
include("HypothesisStruct.jl")
include("HitLevelDataStruct.jl")
include("EventHeaderStruct.jl")
include("MCParticleStruct.jl")
include("SimTrackerHitStruct.jl")
include("CaloHitContributionStruct.jl")
include("SimCalorimeterHitStruct.jl")
include("RawCalorimeterHitStruct.jl")
include("CalorimeterHitStruct.jl")
include("ParticleIDStruct.jl")
include("ClusterStruct.jl")
include("TrackerHitStruct.jl")
include("TrackerHitPlaneStruct.jl")
include("RawTimeSeriesStruct.jl")
include("TrackStruct.jl")
include("VertexStruct.jl")
include("ReconstructedParticleStruct.jl")
include("MCRecoParticleAssociationStruct.jl")
include("MCRecoCaloAssociationStruct.jl")
include("MCRecoTrackerAssociationStruct.jl")
include("MCRecoTrackerHitPlaneAssociationStruct.jl")
include("MCRecoCaloParticleAssociationStruct.jl")
include("MCRecoClusterParticleAssociationStruct.jl")
include("MCRecoTrackParticleAssociationStruct.jl")
include("RecoParticleVertexAssociationStruct.jl")
include("SimPrimaryIonizationClusterStruct.jl")
include("TrackerPulseStruct.jl")
include("RecIonizationClusterStruct.jl")
include("TimeSeriesStruct.jl")
include("RecDqdxStruct.jl")
using StaticArrays

function Vector3f(
	x::Float32 = Float32(0),
	y::Float32 = Float32(0),
	z::Float32 = Float32(0),
)
	return Vector3fStruct(
	x,
	y,
	z,
	)
end

function Vector3d(
	x::Float64 = Float64(0),
	y::Float64 = Float64(0),
	z::Float64 = Float64(0),
)
	return Vector3dStruct(
	x,
	y,
	z,
	)
end

function Vector2i(
	a::Int32 = Int32(0),
	b::Int32 = Int32(0),
)
	return Vector2iStruct(
	a,
	b,
	)
end

function Vector2f(
	a::Float32 = Float32(0),
	b::Float32 = Float32(0),
)
	return Vector2fStruct(
	a,
	b,
	)
end

function TrackState(
	location::Int32 = Int32(0),
	D0::Float32 = Float32(0),
	phi::Float32 = Float32(0),
	omega::Float32 = Float32(0),
	Z0::Float32 = Float32(0),
	tanLambda::Float32 = Float32(0),
	time::Float32 = Float32(0),
	referencePoint::Vector3fStruct = Vector3f(),
	covMatrix::MVector{21, Float32} = MVector{21, Float32}(undef),
)
	return TrackStateStruct(
	location,
	D0,
	phi,
	omega,
	Z0,
	tanLambda,
	time,
	referencePoint,
	covMatrix,
	)
end

function ObjectID(
	index::Int32 = Int32(0),
	collectionID::Int32 = Int32(0),
)
	return ObjectIDStruct(
	index,
	collectionID,
	)
end

function Quantity(
	type::Int16 = Int16(0),
	value::Float32 = Float32(0),
	error::Float32 = Float32(0),
)
	return QuantityStruct(
	type,
	value,
	error,
	)
end

function Hypothesis(
	chi2::Float32 = Float32(0),
	expected::Float32 = Float32(0),
	sigma::Float32 = Float32(0),
)
	return HypothesisStruct(
	chi2,
	expected,
	sigma,
	)
end

function HitLevelData(
	cellID::UInt64 = UInt64(0),
	N::UInt32 = UInt32(0),
	eDep::Float32 = Float32(0),
	pathLength::Float32 = Float32(0),
)
	return HitLevelDataStruct(
	cellID,
	N,
	eDep,
	pathLength,
	)
end

function EventHeader(
	eventNumber::Int32 = Int32(0),
	runNumber::Int32 = Int32(0),
	timeStamp::UInt64 = UInt64(0),
	weight::Float32 = Float32(0),
)
	return EventHeaderStruct(
	eventNumber,
	runNumber,
	timeStamp,
	weight,
	)
end

EventHeaderCollection = Vector{ EventHeaderStruct }

function MCParticle(
	PDG::Int32 = Int32(0),
	generatorStatus::Int32 = Int32(0),
	simulatorStatus::Int32 = Int32(0),
	charge::Float32 = Float32(0),
	time::Float32 = Float32(0),
	mass::Float64 = Float64(0),
	vertex::Vector3dStruct = Vector3d(),
	endpoint::Vector3dStruct = Vector3d(),
	momentum::Vector3fStruct = Vector3f(),
	momentumAtEndpoint::Vector3fStruct = Vector3f(),
	spin::Vector3fStruct = Vector3f(),
	colorFlow::Vector2iStruct = Vector2i(),
	parents::Vector{ MCParticleStruct } = Vector{ MCParticleStruct }(),
	daughters::Vector{ MCParticleStruct } = Vector{ MCParticleStruct }(),
)
	return MCParticleStruct{MCParticleStruct}(
	PDG,
	generatorStatus,
	simulatorStatus,
	charge,
	time,
	mass,
	vertex,
	endpoint,
	momentum,
	momentumAtEndpoint,
	spin,
	colorFlow,
	parents,
	daughters,
	)
end

MCParticleCollection = Vector{ MCParticleStruct{MCParticleStruct} }

function SimTrackerHit(
	cellID::UInt64 = UInt64(0),
	EDep::Float32 = Float32(0),
	time::Float32 = Float32(0),
	pathLength::Float32 = Float32(0),
	quality::Int32 = Int32(0),
	position::Vector3dStruct = Vector3d(),
	momentum::Vector3fStruct = Vector3f(),
	MCParticle::Union{Nothing, MCParticleStruct } = nothing,
)
	return SimTrackerHitStruct{MCParticleStruct}(
	cellID,
	EDep,
	time,
	pathLength,
	quality,
	position,
	momentum,
	MCParticle,
	)
end

SimTrackerHitCollection = Vector{ SimTrackerHitStruct{MCParticleStruct} }

function CaloHitContribution(
	PDG::Int32 = Int32(0),
	energy::Float32 = Float32(0),
	time::Float32 = Float32(0),
	stepPosition::Vector3fStruct = Vector3f(),
	particle::Union{Nothing, MCParticleStruct } = nothing,
)
	return CaloHitContributionStruct{MCParticleStruct}(
	PDG,
	energy,
	time,
	stepPosition,
	particle,
	)
end

CaloHitContributionCollection = Vector{ CaloHitContributionStruct{MCParticleStruct} }

function SimCalorimeterHit(
	cellID::UInt64 = UInt64(0),
	energy::Float32 = Float32(0),
	position::Vector3fStruct = Vector3f(),
	contributions::Vector{ CaloHitContributionStruct } = Vector{ CaloHitContributionStruct }(),
)
	return SimCalorimeterHitStruct{CaloHitContributionStruct}(
	cellID,
	energy,
	position,
	contributions,
	)
end

SimCalorimeterHitCollection = Vector{ SimCalorimeterHitStruct{CaloHitContributionStruct} }

function RawCalorimeterHit(
	cellID::UInt64 = UInt64(0),
	amplitude::Int32 = Int32(0),
	timeStamp::Int32 = Int32(0),
)
	return RawCalorimeterHitStruct(
	cellID,
	amplitude,
	timeStamp,
	)
end

RawCalorimeterHitCollection = Vector{ RawCalorimeterHitStruct }

function CalorimeterHit(
	cellID::UInt64 = UInt64(0),
	energy::Float32 = Float32(0),
	energyError::Float32 = Float32(0),
	time::Float32 = Float32(0),
	position::Vector3fStruct = Vector3f(),
	type::Int32 = Int32(0),
)
	return CalorimeterHitStruct(
	cellID,
	energy,
	energyError,
	time,
	position,
	type,
	)
end

CalorimeterHitCollection = Vector{ CalorimeterHitStruct }

function ParticleID(
	type::Int32 = Int32(0),
	PDG::Int32 = Int32(0),
	algorithmType::Int32 = Int32(0),
	likelihood::Float32 = Float32(0),
	parameters::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return ParticleIDStruct(
	type,
	PDG,
	algorithmType,
	likelihood,
	parameters,
	)
end

ParticleIDCollection = Vector{ ParticleIDStruct }

function Cluster(
	type::Int32 = Int32(0),
	energy::Float32 = Float32(0),
	energyError::Float32 = Float32(0),
	position::Vector3fStruct = Vector3f(),
	positionError::MVector{6, Float32} = MVector{6, Float32}(undef),
	iTheta::Float32 = Float32(0),
	phi::Float32 = Float32(0),
	directionError::Vector3fStruct = Vector3f(),
	clusters::Vector{ ClusterStruct } = Vector{ ClusterStruct }(),
	hits::Vector{ CalorimeterHitStruct } = Vector{ CalorimeterHitStruct }(),
	particleIDs::Vector{ ParticleIDStruct } = Vector{ ParticleIDStruct }(),
	shapeParameters::Vector{ Float32 } = Vector{ Float32 }([]),
	subdetectorEnergies::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return ClusterStruct{CalorimeterHitStruct,ParticleIDStruct,ClusterStruct}(
	type,
	energy,
	energyError,
	position,
	positionError,
	iTheta,
	phi,
	directionError,
	clusters,
	hits,
	particleIDs,
	shapeParameters,
	subdetectorEnergies,
	)
end

ClusterCollection = Vector{ ClusterStruct{CalorimeterHitStruct,ParticleIDStruct,ClusterStruct} }

function TrackerHit(
	cellID::UInt64 = UInt64(0),
	type::Int32 = Int32(0),
	quality::Int32 = Int32(0),
	time::Float32 = Float32(0),
	eDep::Float32 = Float32(0),
	eDepError::Float32 = Float32(0),
	position::Vector3dStruct = Vector3d(),
	covMatrix::MVector{6, Float32} = MVector{6, Float32}(undef),
	rawHits::Vector{ ObjectIDStruct } = Vector{ ObjectIDStruct }([]),
)
	return TrackerHitStruct(
	cellID,
	type,
	quality,
	time,
	eDep,
	eDepError,
	position,
	covMatrix,
	rawHits,
	)
end

TrackerHitCollection = Vector{ TrackerHitStruct }

function TrackerHitPlane(
	cellID::UInt64 = UInt64(0),
	type::Int32 = Int32(0),
	quality::Int32 = Int32(0),
	time::Float32 = Float32(0),
	eDep::Float32 = Float32(0),
	eDepError::Float32 = Float32(0),
	u::Vector2fStruct = Vector2f(),
	v::Vector2fStruct = Vector2f(),
	du::Float32 = Float32(0),
	dv::Float32 = Float32(0),
	position::Vector3dStruct = Vector3d(),
	covMatrix::MVector{6, Float32} = MVector{6, Float32}(undef),
	rawHits::Vector{ ObjectIDStruct } = Vector{ ObjectIDStruct }([]),
)
	return TrackerHitPlaneStruct(
	cellID,
	type,
	quality,
	time,
	eDep,
	eDepError,
	u,
	v,
	du,
	dv,
	position,
	covMatrix,
	rawHits,
	)
end

TrackerHitPlaneCollection = Vector{ TrackerHitPlaneStruct }

function RawTimeSeries(
	cellID::UInt64 = UInt64(0),
	quality::Int32 = Int32(0),
	time::Float32 = Float32(0),
	charge::Float32 = Float32(0),
	interval::Float32 = Float32(0),
	adcCounts::Vector{ Int32 } = Vector{ Int32 }([]),
)
	return RawTimeSeriesStruct(
	cellID,
	quality,
	time,
	charge,
	interval,
	adcCounts,
	)
end

RawTimeSeriesCollection = Vector{ RawTimeSeriesStruct }

function Track(
	type::Int32 = Int32(0),
	chi2::Float32 = Float32(0),
	ndf::Int32 = Int32(0),
	dEdx::Float32 = Float32(0),
	dEdxError::Float32 = Float32(0),
	radiusOfInnermostHit::Float32 = Float32(0),
	trackerHits::Vector{ TrackerHitStruct } = Vector{ TrackerHitStruct }(),
	tracks::Vector{ TrackStruct } = Vector{ TrackStruct }(),
	subdetectorHitNumbers::Vector{ Int32 } = Vector{ Int32 }([]),
	trackStates::Vector{ TrackStateStruct } = Vector{ TrackStateStruct }([]),
	dxQuantities::Vector{ QuantityStruct } = Vector{ QuantityStruct }([]),
)
	return TrackStruct{TrackStruct, TrackerHitStruct}(
	type,
	chi2,
	ndf,
	dEdx,
	dEdxError,
	radiusOfInnermostHit,
	trackerHits,
	tracks,
	subdetectorHitNumbers,
	trackStates,
	dxQuantities,
	)
end

TrackCollection = Vector{ TrackStruct{TrackStruct, TrackerHitStruct} }

function Vertex(
	primary::Int32 = Int32(0),
	chi2::Float32 = Float32(0),
	probability::Float32 = Float32(0),
	position::Vector3fStruct = Vector3f(),
	covMatrix::MVector{6, Float32} = MVector{6, Float32}(undef),
	algorithmType::Int32 = Int32(0),
	associatedParticle::Union{Nothing, ReconstructedParticleStruct } = nothing,
	parameters::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return VertexStruct{ReconstructedParticleStruct}(
	primary,
	chi2,
	probability,
	position,
	covMatrix,
	algorithmType,
	associatedParticle,
	parameters,
	)
end

VertexCollection = Vector{ VertexStruct{ReconstructedParticleStruct} }

function ReconstructedParticle(
	type::Int32 = Int32(0),
	energy::Float32 = Float32(0),
	momentum::Vector3fStruct = Vector3f(),
	referencePoint::Vector3fStruct = Vector3f(),
	charge::Float32 = Float32(0),
	mass::Float32 = Float32(0),
	goodnessOfPID::Float32 = Float32(0),
	covMatrix::MVector{10, Float32} = MVector{10, Float32}(undef),
	clusters::Vector{ ClusterStruct } = Vector{ ClusterStruct }(),
	tracks::Vector{ TrackStruct } = Vector{ TrackStruct }(),
	particles::Vector{ ReconstructedParticleStruct } = Vector{ ReconstructedParticleStruct }(),
	particleIDs::Vector{ ParticleIDStruct } = Vector{ ParticleIDStruct }(),
	startVertex::Union{Nothing, VertexStruct } = nothing,
	particleIDUsed::Union{Nothing, ParticleIDStruct } = nothing,
)
	return ReconstructedParticleStruct{VertexStruct,ParticleIDStruct,TrackStruct,ReconstructedParticleStruct,ClusterStruct}(
	type,
	energy,
	momentum,
	referencePoint,
	charge,
	mass,
	goodnessOfPID,
	covMatrix,
	clusters,
	tracks,
	particles,
	particleIDs,
	startVertex,
	particleIDUsed,
	)
end

ReconstructedParticleCollection = Vector{ ReconstructedParticleStruct{VertexStruct,ParticleIDStruct,TrackStruct,ReconstructedParticleStruct,ClusterStruct} }

function MCRecoParticleAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, ReconstructedParticleStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoParticleAssociationStruct{MCParticleStruct,ReconstructedParticleStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoParticleAssociationCollection = Vector{ MCRecoParticleAssociationStruct{MCParticleStruct,ReconstructedParticleStruct} }

function MCRecoCaloAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, CalorimeterHitStruct } = nothing,
	sim::Union{Nothing, SimCalorimeterHitStruct } = nothing,
)
	return MCRecoCaloAssociationStruct{SimCalorimeterHitStruct,CalorimeterHitStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoCaloAssociationCollection = Vector{ MCRecoCaloAssociationStruct{SimCalorimeterHitStruct,CalorimeterHitStruct} }

function MCRecoTrackerAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, TrackerHitStruct } = nothing,
	sim::Union{Nothing, SimTrackerHitStruct } = nothing,
)
	return MCRecoTrackerAssociationStruct{SimTrackerHitStruct,TrackerHitStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoTrackerAssociationCollection = Vector{ MCRecoTrackerAssociationStruct{SimTrackerHitStruct,TrackerHitStruct} }

function MCRecoTrackerHitPlaneAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, TrackerHitPlaneStruct } = nothing,
	sim::Union{Nothing, SimTrackerHitStruct } = nothing,
)
	return MCRecoTrackerHitPlaneAssociationStruct{SimTrackerHitStruct,TrackerHitPlaneStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoTrackerHitPlaneAssociationCollection = Vector{ MCRecoTrackerHitPlaneAssociationStruct{SimTrackerHitStruct,TrackerHitPlaneStruct} }

function MCRecoCaloParticleAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, CalorimeterHitStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoCaloParticleAssociationStruct{MCParticleStruct,CalorimeterHitStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoCaloParticleAssociationCollection = Vector{ MCRecoCaloParticleAssociationStruct{MCParticleStruct,CalorimeterHitStruct} }

function MCRecoClusterParticleAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, ClusterStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoClusterParticleAssociationStruct{MCParticleStruct,ClusterStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoClusterParticleAssociationCollection = Vector{ MCRecoClusterParticleAssociationStruct{MCParticleStruct,ClusterStruct} }

function MCRecoTrackParticleAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, TrackStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoTrackParticleAssociationStruct{TrackStruct,MCParticleStruct}(
	weight,
	rec,
	sim,
	)
end

MCRecoTrackParticleAssociationCollection = Vector{ MCRecoTrackParticleAssociationStruct{TrackStruct,MCParticleStruct} }

function RecoParticleVertexAssociation(
	weight::Float32 = Float32(0),
	rec::Union{Nothing, ReconstructedParticleStruct } = nothing,
	vertex::Union{Nothing, VertexStruct } = nothing,
)
	return RecoParticleVertexAssociationStruct{ReconstructedParticleStruct,VertexStruct}(
	weight,
	rec,
	vertex,
	)
end

RecoParticleVertexAssociationCollection = Vector{ RecoParticleVertexAssociationStruct{ReconstructedParticleStruct,VertexStruct} }

function SimPrimaryIonizationCluster(
	cellID::UInt64 = UInt64(0),
	time::Float32 = Float32(0),
	position::Vector3dStruct = Vector3d(),
	type::Int16 = Int16(0),
	MCParticle::Union{Nothing, MCParticleStruct } = nothing,
	electronCellID::Vector{ UInt64 } = Vector{ UInt64 }([]),
	electronTime::Vector{ Float32 } = Vector{ Float32 }([]),
	electronPosition::Vector{ Vector3dStruct } = Vector{ Vector3dStruct }([]),
	pulseTime::Vector{ Float32 } = Vector{ Float32 }([]),
	pulseAmplitude::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return SimPrimaryIonizationClusterStruct{MCParticleStruct}(
	cellID,
	time,
	position,
	type,
	MCParticle,
	electronCellID,
	electronTime,
	electronPosition,
	pulseTime,
	pulseAmplitude,
	)
end

SimPrimaryIonizationClusterCollection = Vector{ SimPrimaryIonizationClusterStruct{MCParticleStruct} }

function TrackerPulse(
	cellID::UInt64 = UInt64(0),
	time::Float32 = Float32(0),
	charge::Float32 = Float32(0),
	quality::Int16 = Int16(0),
	covMatrix::MVector{3, Float32} = MVector{3, Float32}(undef),
	timeSeries::Union{Nothing, TimeSeriesStruct } = nothing,
)
	return TrackerPulseStruct{TimeSeriesStruct}(
	cellID,
	time,
	charge,
	quality,
	covMatrix,
	timeSeries,
	)
end

TrackerPulseCollection = Vector{ TrackerPulseStruct{TimeSeriesStruct} }

function RecIonizationCluster(
	cellID::UInt64 = UInt64(0),
	significance::Float32 = Float32(0),
	type::Int16 = Int16(0),
	trackerPulse::Vector{ TrackerPulseStruct } = Vector{ TrackerPulseStruct }(),
)
	return RecIonizationClusterStruct{TrackerPulseStruct}(
	cellID,
	significance,
	type,
	trackerPulse,
	)
end

RecIonizationClusterCollection = Vector{ RecIonizationClusterStruct{TrackerPulseStruct} }

function TimeSeries(
	cellID::UInt64 = UInt64(0),
	time::Float32 = Float32(0),
	interval::Float32 = Float32(0),
	amplitude::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return TimeSeriesStruct(
	cellID,
	time,
	interval,
	amplitude,
	)
end

TimeSeriesCollection = Vector{ TimeSeriesStruct }

function RecDqdx(
	dQdx::QuantityStruct = Quantity(),
	particleType::Int16 = Int16(0),
	type::Int16 = Int16(0),
	hypotheses::MVector{5, HypothesisStruct} = MVector{5, HypothesisStruct}(undef),
	track::Union{Nothing, TrackStruct } = nothing,
	hitData::Vector{ HitLevelDataStruct } = Vector{ HitLevelDataStruct }([]),
)
	return RecDqdxStruct{TrackStruct}(
	dQdx,
	particleType,
	type,
	hypotheses,
	track,
	hitData,
	)
end

RecDqdxCollection = Vector{ RecDqdxStruct{TrackStruct} }

end