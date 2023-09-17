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
export EventHeaderCollection
export MCParticle
export MCParticleCollection
export SimTrackerHit
export SimTrackerHitCollection
export CaloHitContribution
export CaloHitContributionCollection
export SimCalorimeterHit
export SimCalorimeterHitCollection
export RawCalorimeterHit
export RawCalorimeterHitCollection
export CalorimeterHit
export CalorimeterHitCollection
export ParticleID
export ParticleIDCollection
export Cluster
export ClusterCollection
export TrackerHit
export TrackerHitCollection
export TrackerHitPlane
export TrackerHitPlaneCollection
export RawTimeSeries
export RawTimeSeriesCollection
export Track
export TrackCollection
export Vertex
export VertexCollection
export ReconstructedParticle
export ReconstructedParticleCollection
export MCRecoParticleAssociation
export MCRecoParticleAssociationCollection
export MCRecoCaloAssociation
export MCRecoCaloAssociationCollection
export MCRecoTrackerAssociation
export MCRecoTrackerAssociationCollection
export MCRecoTrackerHitPlaneAssociation
export MCRecoTrackerHitPlaneAssociationCollection
export MCRecoCaloParticleAssociation
export MCRecoCaloParticleAssociationCollection
export MCRecoClusterParticleAssociation
export MCRecoClusterParticleAssociationCollection
export MCRecoTrackParticleAssociation
export MCRecoTrackParticleAssociationCollection
export RecoParticleVertexAssociation
export RecoParticleVertexAssociationCollection
export SimPrimaryIonizationCluster
export SimPrimaryIonizationClusterCollection
export TrackerPulse
export TrackerPulseCollection
export RecIonizationCluster
export RecIonizationClusterCollection
export TimeSeries
export TimeSeriesCollection
export RecDqdx
export RecDqdxCollection

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

function Vector3f(
	x::Real = Float32(0),
	y::Real = Float32(0),
	z::Real = Float32(0),
)
	return Vector3fStruct(
	Float32(x),
	Float32(y),
	Float32(z),
	)
end

function Vector3d(
	x::Real = Float64(0),
	y::Real = Float64(0),
	z::Real = Float64(0),
)
	return Vector3dStruct(
	Float64(x),
	Float64(y),
	Float64(z),
	)
end

function Vector2i(
	a::Integer = Int32(0),
	b::Integer = Int32(0),
)
	return Vector2iStruct(
	Int32(a),
	Int32(b),
	)
end

function Vector2f(
	a::Real = Float32(0),
	b::Real = Float32(0),
)
	return Vector2fStruct(
	Float32(a),
	Float32(b),
	)
end

function TrackState(
	location::Integer = Int32(0),
	D0::Real = Float32(0),
	phi::Real = Float32(0),
	omega::Real = Float32(0),
	Z0::Real = Float32(0),
	tanLambda::Real = Float32(0),
	time::Real = Float32(0),
	referencePoint::Vector3fStruct = Vector3f(),
	covMatrix::MVector{21, Float32} = MVector{21, Float32}(undef),
)
	return TrackStateStruct(
	Int32(location),
	Float32(D0),
	Float32(phi),
	Float32(omega),
	Float32(Z0),
	Float32(tanLambda),
	Float32(time),
	referencePoint,
	covMatrix,
	)
end

function ObjectID(
	index::Integer = Int32(0),
	collectionID::Integer = Int32(0),
)
	return ObjectIDStruct(
	Int32(index),
	Int32(collectionID),
	)
end

function Quantity(
	type::Integer = Int16(0),
	value::Real = Float32(0),
	error::Real = Float32(0),
)
	return QuantityStruct(
	Int16(type),
	Float32(value),
	Float32(error),
	)
end

function Hypothesis(
	chi2::Real = Float32(0),
	expected::Real = Float32(0),
	sigma::Real = Float32(0),
)
	return HypothesisStruct(
	Float32(chi2),
	Float32(expected),
	Float32(sigma),
	)
end

function HitLevelData(
	cellID::Integer = UInt64(0),
	N::Integer = UInt32(0),
	eDep::Real = Float32(0),
	pathLength::Real = Float32(0),
)
	return HitLevelDataStruct(
	UInt64(cellID),
	UInt32(N),
	Float32(eDep),
	Float32(pathLength),
	)
end


function EventHeader(
	eventNumber::Integer = Int32(0),
	runNumber::Integer = Int32(0),
	timeStamp::Integer = UInt64(0),
	weight::Real = Float32(0),
)
	return EventHeaderStruct(
	Int32(eventNumber),
	Int32(runNumber),
	UInt64(timeStamp),
	Float32(weight),
	)
end

EventHeaderCollection = Vector{ EventHeaderStruct }

function MCParticle(
	PDG::Integer = Int32(0),
	generatorStatus::Integer = Int32(0),
	simulatorStatus::Integer = Int32(0),
	charge::Real = Float32(0),
	time::Real = Float32(0),
	mass::Real = Float64(0),
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
	Int32(PDG),
	Int32(generatorStatus),
	Int32(simulatorStatus),
	Float32(charge),
	Float32(time),
	Float64(mass),
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
	cellID::Integer = UInt64(0),
	EDep::Real = Float32(0),
	time::Real = Float32(0),
	pathLength::Real = Float32(0),
	quality::Integer = Int32(0),
	position::Vector3dStruct = Vector3d(),
	momentum::Vector3fStruct = Vector3f(),
	MCParticle::Union{Nothing, MCParticleStruct } = nothing,
)
	return SimTrackerHitStruct{MCParticleStruct}(
	UInt64(cellID),
	Float32(EDep),
	Float32(time),
	Float32(pathLength),
	Int32(quality),
	position,
	momentum,
	MCParticle,
	)
end

SimTrackerHitCollection = Vector{ SimTrackerHitStruct{MCParticleStruct} }

function CaloHitContribution(
	PDG::Integer = Int32(0),
	energy::Real = Float32(0),
	time::Real = Float32(0),
	stepPosition::Vector3fStruct = Vector3f(),
	particle::Union{Nothing, MCParticleStruct } = nothing,
)
	return CaloHitContributionStruct{MCParticleStruct}(
	Int32(PDG),
	Float32(energy),
	Float32(time),
	stepPosition,
	particle,
	)
end

CaloHitContributionCollection = Vector{ CaloHitContributionStruct{MCParticleStruct} }

function SimCalorimeterHit(
	cellID::Integer = UInt64(0),
	energy::Real = Float32(0),
	position::Vector3fStruct = Vector3f(),
	contributions::Vector{ CaloHitContributionStruct } = Vector{ CaloHitContributionStruct }(),
)
	return SimCalorimeterHitStruct{CaloHitContributionStruct}(
	UInt64(cellID),
	Float32(energy),
	position,
	contributions,
	)
end

SimCalorimeterHitCollection = Vector{ SimCalorimeterHitStruct{CaloHitContributionStruct} }

function RawCalorimeterHit(
	cellID::Integer = UInt64(0),
	amplitude::Integer = Int32(0),
	timeStamp::Integer = Int32(0),
)
	return RawCalorimeterHitStruct(
	UInt64(cellID),
	Int32(amplitude),
	Int32(timeStamp),
	)
end

RawCalorimeterHitCollection = Vector{ RawCalorimeterHitStruct }

function CalorimeterHit(
	cellID::Integer = UInt64(0),
	energy::Real = Float32(0),
	energyError::Real = Float32(0),
	time::Real = Float32(0),
	position::Vector3fStruct = Vector3f(),
	type::Integer = Int32(0),
)
	return CalorimeterHitStruct(
	UInt64(cellID),
	Float32(energy),
	Float32(energyError),
	Float32(time),
	position,
	Int32(type),
	)
end

CalorimeterHitCollection = Vector{ CalorimeterHitStruct }

function ParticleID(
	type::Integer = Int32(0),
	PDG::Integer = Int32(0),
	algorithmType::Integer = Int32(0),
	likelihood::Real = Float32(0),
	parameters::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return ParticleIDStruct(
	Int32(type),
	Int32(PDG),
	Int32(algorithmType),
	Float32(likelihood),
	parameters,
	)
end

ParticleIDCollection = Vector{ ParticleIDStruct }

function Cluster(
	type::Integer = Int32(0),
	energy::Real = Float32(0),
	energyError::Real = Float32(0),
	position::Vector3fStruct = Vector3f(),
	positionError::MVector{6, Float32} = MVector{6, Float32}(undef),
	iTheta::Real = Float32(0),
	phi::Real = Float32(0),
	directionError::Vector3fStruct = Vector3f(),
	clusters::Vector{ ClusterStruct } = Vector{ ClusterStruct }(),
	hits::Vector{ CalorimeterHitStruct } = Vector{ CalorimeterHitStruct }(),
	particleIDs::Vector{ ParticleIDStruct } = Vector{ ParticleIDStruct }(),
	shapeParameters::Vector{ Float32 } = Vector{ Float32 }([]),
	subdetectorEnergies::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return ClusterStruct{CalorimeterHitStruct,ClusterStruct,ParticleIDStruct}(
	Int32(type),
	Float32(energy),
	Float32(energyError),
	position,
	positionError,
	Float32(iTheta),
	Float32(phi),
	directionError,
	clusters,
	hits,
	particleIDs,
	shapeParameters,
	subdetectorEnergies,
	)
end

ClusterCollection = Vector{ ClusterStruct{CalorimeterHitStruct,ClusterStruct,ParticleIDStruct} }

function TrackerHit(
	cellID::Integer = UInt64(0),
	type::Integer = Int32(0),
	quality::Integer = Int32(0),
	time::Real = Float32(0),
	eDep::Real = Float32(0),
	eDepError::Real = Float32(0),
	position::Vector3dStruct = Vector3d(),
	covMatrix::MVector{6, Float32} = MVector{6, Float32}(undef),
	rawHits::Vector{ ObjectIDStruct } = Vector{ ObjectIDStruct }([]),
)
	return TrackerHitStruct(
	UInt64(cellID),
	Int32(type),
	Int32(quality),
	Float32(time),
	Float32(eDep),
	Float32(eDepError),
	position,
	covMatrix,
	rawHits,
	)
end

TrackerHitCollection = Vector{ TrackerHitStruct }

function TrackerHitPlane(
	cellID::Integer = UInt64(0),
	type::Integer = Int32(0),
	quality::Integer = Int32(0),
	time::Real = Float32(0),
	eDep::Real = Float32(0),
	eDepError::Real = Float32(0),
	u::Vector2fStruct = Vector2f(),
	v::Vector2fStruct = Vector2f(),
	du::Real = Float32(0),
	dv::Real = Float32(0),
	position::Vector3dStruct = Vector3d(),
	covMatrix::MVector{6, Float32} = MVector{6, Float32}(undef),
	rawHits::Vector{ ObjectIDStruct } = Vector{ ObjectIDStruct }([]),
)
	return TrackerHitPlaneStruct(
	UInt64(cellID),
	Int32(type),
	Int32(quality),
	Float32(time),
	Float32(eDep),
	Float32(eDepError),
	u,
	v,
	Float32(du),
	Float32(dv),
	position,
	covMatrix,
	rawHits,
	)
end

TrackerHitPlaneCollection = Vector{ TrackerHitPlaneStruct }

function RawTimeSeries(
	cellID::Integer = UInt64(0),
	quality::Integer = Int32(0),
	time::Real = Float32(0),
	charge::Real = Float32(0),
	interval::Real = Float32(0),
	adcCounts::Vector{ Int32 } = Vector{ Int32 }([]),
)
	return RawTimeSeriesStruct(
	UInt64(cellID),
	Int32(quality),
	Float32(time),
	Float32(charge),
	Float32(interval),
	adcCounts,
	)
end

RawTimeSeriesCollection = Vector{ RawTimeSeriesStruct }

function Track(
	type::Integer = Int32(0),
	chi2::Real = Float32(0),
	ndf::Integer = Int32(0),
	dEdx::Real = Float32(0),
	dEdxError::Real = Float32(0),
	radiusOfInnermostHit::Real = Float32(0),
	trackerHits::Vector{ TrackerHitStruct } = Vector{ TrackerHitStruct }(),
	tracks::Vector{ TrackStruct } = Vector{ TrackStruct }(),
	subdetectorHitNumbers::Vector{ Int32 } = Vector{ Int32 }([]),
	trackStates::Vector{ TrackStateStruct } = Vector{ TrackStateStruct }([]),
	dxQuantities::Vector{ QuantityStruct } = Vector{ QuantityStruct }([]),
)
	return TrackStruct{TrackStruct,TrackerHitStruct}(
	Int32(type),
	Float32(chi2),
	Int32(ndf),
	Float32(dEdx),
	Float32(dEdxError),
	Float32(radiusOfInnermostHit),
	trackerHits,
	tracks,
	subdetectorHitNumbers,
	trackStates,
	dxQuantities,
	)
end

TrackCollection = Vector{ TrackStruct{TrackStruct,TrackerHitStruct} }

function Vertex(
	primary::Integer = Int32(0),
	chi2::Real = Float32(0),
	probability::Real = Float32(0),
	position::Vector3fStruct = Vector3f(),
	covMatrix::MVector{6, Float32} = MVector{6, Float32}(undef),
	algorithmType::Integer = Int32(0),
	associatedParticle::Union{Nothing, ReconstructedParticleStruct } = nothing,
	parameters::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return VertexStruct{ReconstructedParticleStruct}(
	Int32(primary),
	Float32(chi2),
	Float32(probability),
	position,
	covMatrix,
	Int32(algorithmType),
	associatedParticle,
	parameters,
	)
end

VertexCollection = Vector{ VertexStruct{ReconstructedParticleStruct} }

function ReconstructedParticle(
	type::Integer = Int32(0),
	energy::Real = Float32(0),
	momentum::Vector3fStruct = Vector3f(),
	referencePoint::Vector3fStruct = Vector3f(),
	charge::Real = Float32(0),
	mass::Real = Float32(0),
	goodnessOfPID::Real = Float32(0),
	covMatrix::MVector{10, Float32} = MVector{10, Float32}(undef),
	clusters::Vector{ ClusterStruct } = Vector{ ClusterStruct }(),
	tracks::Vector{ TrackStruct } = Vector{ TrackStruct }(),
	particles::Vector{ ReconstructedParticleStruct } = Vector{ ReconstructedParticleStruct }(),
	particleIDs::Vector{ ParticleIDStruct } = Vector{ ParticleIDStruct }(),
	startVertex::Union{Nothing, VertexStruct } = nothing,
	particleIDUsed::Union{Nothing, ParticleIDStruct } = nothing,
)
	return ReconstructedParticleStruct{ClusterStruct,ParticleIDStruct,ReconstructedParticleStruct,TrackStruct,VertexStruct}(
	Int32(type),
	Float32(energy),
	momentum,
	referencePoint,
	Float32(charge),
	Float32(mass),
	Float32(goodnessOfPID),
	covMatrix,
	clusters,
	tracks,
	particles,
	particleIDs,
	startVertex,
	particleIDUsed,
	)
end

ReconstructedParticleCollection = Vector{ ReconstructedParticleStruct{ClusterStruct,ParticleIDStruct,ReconstructedParticleStruct,TrackStruct,VertexStruct} }

function MCRecoParticleAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, ReconstructedParticleStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoParticleAssociationStruct{MCParticleStruct,ReconstructedParticleStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoParticleAssociationCollection = Vector{ MCRecoParticleAssociationStruct{MCParticleStruct,ReconstructedParticleStruct} }

function MCRecoCaloAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, CalorimeterHitStruct } = nothing,
	sim::Union{Nothing, SimCalorimeterHitStruct } = nothing,
)
	return MCRecoCaloAssociationStruct{CalorimeterHitStruct,SimCalorimeterHitStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoCaloAssociationCollection = Vector{ MCRecoCaloAssociationStruct{CalorimeterHitStruct,SimCalorimeterHitStruct} }

function MCRecoTrackerAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, TrackerHitStruct } = nothing,
	sim::Union{Nothing, SimTrackerHitStruct } = nothing,
)
	return MCRecoTrackerAssociationStruct{SimTrackerHitStruct,TrackerHitStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoTrackerAssociationCollection = Vector{ MCRecoTrackerAssociationStruct{SimTrackerHitStruct,TrackerHitStruct} }

function MCRecoTrackerHitPlaneAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, TrackerHitPlaneStruct } = nothing,
	sim::Union{Nothing, SimTrackerHitStruct } = nothing,
)
	return MCRecoTrackerHitPlaneAssociationStruct{SimTrackerHitStruct,TrackerHitPlaneStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoTrackerHitPlaneAssociationCollection = Vector{ MCRecoTrackerHitPlaneAssociationStruct{SimTrackerHitStruct,TrackerHitPlaneStruct} }

function MCRecoCaloParticleAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, CalorimeterHitStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoCaloParticleAssociationStruct{CalorimeterHitStruct,MCParticleStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoCaloParticleAssociationCollection = Vector{ MCRecoCaloParticleAssociationStruct{CalorimeterHitStruct,MCParticleStruct} }

function MCRecoClusterParticleAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, ClusterStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoClusterParticleAssociationStruct{ClusterStruct,MCParticleStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoClusterParticleAssociationCollection = Vector{ MCRecoClusterParticleAssociationStruct{ClusterStruct,MCParticleStruct} }

function MCRecoTrackParticleAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, TrackStruct } = nothing,
	sim::Union{Nothing, MCParticleStruct } = nothing,
)
	return MCRecoTrackParticleAssociationStruct{MCParticleStruct,TrackStruct}(
	Float32(weight),
	rec,
	sim,
	)
end

MCRecoTrackParticleAssociationCollection = Vector{ MCRecoTrackParticleAssociationStruct{MCParticleStruct,TrackStruct} }

function RecoParticleVertexAssociation(
	weight::Real = Float32(0),
	rec::Union{Nothing, ReconstructedParticleStruct } = nothing,
	vertex::Union{Nothing, VertexStruct } = nothing,
)
	return RecoParticleVertexAssociationStruct{ReconstructedParticleStruct,VertexStruct}(
	Float32(weight),
	rec,
	vertex,
	)
end

RecoParticleVertexAssociationCollection = Vector{ RecoParticleVertexAssociationStruct{ReconstructedParticleStruct,VertexStruct} }

function SimPrimaryIonizationCluster(
	cellID::Integer = UInt64(0),
	time::Real = Float32(0),
	position::Vector3dStruct = Vector3d(),
	type::Integer = Int16(0),
	MCParticle::Union{Nothing, MCParticleStruct } = nothing,
	electronCellID::Vector{ UInt64 } = Vector{ UInt64 }([]),
	electronTime::Vector{ Float32 } = Vector{ Float32 }([]),
	electronPosition::Vector{ Vector3dStruct } = Vector{ Vector3dStruct }([]),
	pulseTime::Vector{ Float32 } = Vector{ Float32 }([]),
	pulseAmplitude::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return SimPrimaryIonizationClusterStruct{MCParticleStruct}(
	UInt64(cellID),
	Float32(time),
	position,
	Int16(type),
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
	cellID::Integer = UInt64(0),
	time::Real = Float32(0),
	charge::Real = Float32(0),
	quality::Integer = Int16(0),
	covMatrix::MVector{3, Float32} = MVector{3, Float32}(undef),
	timeSeries::Union{Nothing, TimeSeriesStruct } = nothing,
)
	return TrackerPulseStruct{TimeSeriesStruct}(
	UInt64(cellID),
	Float32(time),
	Float32(charge),
	Int16(quality),
	covMatrix,
	timeSeries,
	)
end

TrackerPulseCollection = Vector{ TrackerPulseStruct{TimeSeriesStruct} }

function RecIonizationCluster(
	cellID::Integer = UInt64(0),
	significance::Real = Float32(0),
	type::Integer = Int16(0),
	trackerPulse::Vector{ TrackerPulseStruct } = Vector{ TrackerPulseStruct }(),
)
	return RecIonizationClusterStruct{TrackerPulseStruct}(
	UInt64(cellID),
	Float32(significance),
	Int16(type),
	trackerPulse,
	)
end

RecIonizationClusterCollection = Vector{ RecIonizationClusterStruct{TrackerPulseStruct} }

function TimeSeries(
	cellID::Integer = UInt64(0),
	time::Real = Float32(0),
	interval::Real = Float32(0),
	amplitude::Vector{ Float32 } = Vector{ Float32 }([]),
)
	return TimeSeriesStruct(
	UInt64(cellID),
	Float32(time),
	Float32(interval),
	amplitude,
	)
end

TimeSeriesCollection = Vector{ TimeSeriesStruct }

function RecDqdx(
	dQdx::QuantityStruct = Quantity(),
	particleType::Integer = Int16(0),
	type::Integer = Int16(0),
	hypotheses::MVector{5, HypothesisStruct} = MVector{5, HypothesisStruct}(undef),
	track::Union{Nothing, TrackStruct } = nothing,
	hitData::Vector{ HitLevelDataStruct } = Vector{ HitLevelDataStruct }([]),
)
	return RecDqdxStruct{TrackStruct}(
	dQdx,
	Int16(particleType),
	Int16(type),
	hypotheses,
	track,
	hitData,
	)
end

RecDqdxCollection = Vector{ RecDqdxStruct{TrackStruct} }

end