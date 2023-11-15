mutable struct TrackStruct{TrackT,TrackerHitT}
	type::Int32
	chi2::Float32
	ndf::Int32
	dEdx::Float32
	dEdxError::Float32
	radiusOfInnermostHit::Float32
	trackerHits::Vector{ TrackerHitT }
	tracks::Vector{ TrackT }
	subdetectorHitNumbers::Vector{ Int32 }
	trackStates::Vector{ TrackStateStruct }
	dxQuantities::Vector{ QuantityStruct }
end
