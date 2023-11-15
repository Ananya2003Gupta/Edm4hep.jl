using Edm4hep
using Test
using StaticArrays

@testset "Edm4hep.jl" begin
	@testset "One to Many Relations" begin
		# MCParticle 1
		v1 = Vector3d(1.0, 2.0, 3.0) # vertex
		e1 = Vector3d(4.0, 5.0, 6.0) # endpoint
		m1 = Vector3f(0.1, 0.2, 0.3) # momentum
		mae1 = Vector3f(0.4, 0.5, 0.6) # momentumAtEndpoint
		s1 = Vector3f(0.7, 0.8, 0.9) # spin
		cf1 = Vector2i(1, 2) # colorFlow
	    mcp1 = MCParticle(211, 1, 0, 1.0, 0.0, 0.139, v1, e1, m1, mae1, s1, cf1, Vector{MCParticle}(undef, 0), Vector{MCParticle}(undef, 0))

		# MCParticle 2
		v2 = Vector3d(-1.0, -2.0, -3.0) # vertex
		e2 = Vector3d(-4.0, -5.0, -6.0) # endpoint
		m2 = Vector3f(-0.1, -0.2, -0.3) # momentum
		mae2 = Vector3f(-0.4, -0.5, -0.6) # momentumAtEndpoint
		s2 = Vector3f(-0.7, -0.8, -0.9) # spin
		cf2 = Vector2i(-1, -2) # colorFlow
	    mcp2 = MCParticle(-13, 2, 1, -1.0, 10.0, 0.105, v2, e2, m2, mae2, s2, cf2, Vector{MCParticle}(undef, 0), Vector{MCParticle}(undef, 0))

		# MCParticle 3
		v3 = Vector3d(10.0, 20.0, 30.0) # vertex
		e3 = Vector3d(40.0, 50.0, 60.0) # endpoint
		m3 = Vector3f(1.0, 2.0, 3.0) # momentum
		mae3 = Vector3f(4.0, 5.0, 6.0) # momentumAtEndpoint
		s3 = Vector3f(7.0, 8.0, 9.0) # spin
		cf3 = Vector2i(10, 20) # colorFlow
	    mcp3 = MCParticle(130, 1, 0, 0.5, 2.5, 1.0, v3, e3, m3, mae3, s3, cf3, Vector{MCParticle}(undef, 0), Vector{MCParticle}(undef, 0))

		push!(mcp1.daughters, mcp2)
		push!(mcp1.daughters, mcp3)
		push!(mcp2.parents, mcp1)
		push!(mcp3.parents, mcp1)

		mcp1.PDG = 22
		mcp2.PDG = -130
		mcp3.PDG = 211

	    @test mcp2.parents[1].PDG == 22
	    @test mcp1.daughters[1].PDG == -130
	    @test mcp1.daughters[2].PDG == 211
	    @test mcp3.parents[1].PDG == 22
	end

	@testset "Vector Members" begin
		# ParticleID
		p1 = ParticleID(1, 211, 0, 0.95, Vector{ Float32 }([]))
		p1.parameters = Float32[11,12,13,14,15]
		p1.parameters[5] = 16

		@test p1.parameters[5] == 16
		@test p1.parameters[1] == 11
		@test p1.parameters[2] == 12
		@test p1.parameters[3] == 13
		@test p1.parameters[4] == 14
	end

	@testset "Cyclic Dependency" begin
		# Vertex
		pos1 = Vector3f(1.0, 2.0, 3.0) # position
		covmat1 = MVector{6, Float32}(1.0, 0.0, 0.0, 1.0, 0.0, 1.0) # covMatrix
		v1 = Vertex(1, 10.5, 0.95, pos1, covmat1, 0, nothing, Float32[1,2,3,4])
		
		# ReconstructedParticle
		m1 = Vector3f(1.0, 2.0, 3.0) # momentum
		rp1 = Vector3f(0.1, 0.2, 0.3) # referencePoint
		covmat2 = MVector{10, Float32}(1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.1, 0.2) # covMatrix
		rp2 = ReconstructedParticle(1, 50.0, m1, rp1, 1.0, 0.139, 0.95, covmat2, Vector{Cluster}(undef, 0), Vector{Abstractrack}(undef, 0), Vector{ReconstructedParticle}(undef, 0), Vector{ParticleID}(undef, 0), nothing, nothing)
		
		v1.associatedParticle = rp2
		rp2.startVertex = v1

		@test v1.associatedParticle === rp2
		@test rp2.startVertex === v1
	end

	@testset "One To One Relations" begin
		# MCParticle
		v1 = Vector3d(1.0, 2.0, 3.0) # vertex
		e1 = Vector3d(4.0, 5.0, 6.0) # endpoint
		m1 = Vector3f(0.1, 0.2, 0.3) # momentum
		mae1 = Vector3f(0.4, 0.5, 0.6) # momentumAtEndpoint
		s1 = Vector3f(0.7, 0.8, 0.9) # spin
		cf1 = Vector2i(1, 2) # colorFlow
	    mcp1 = MCParticle(211, 1, 0, 1.0, 0.0, 0.139, v1, e1, m1, mae1, s1, cf1, Vector{MCParticle}(undef, 0), Vector{MCParticle}(undef, 0))
		mcp1.PDG = 1210

		# MCRecoParticleAssociation
		mcrpa2 = MCRecoParticleAssociation(10.0, nothing, nothing)
		mcrpa2.sim = mcp1

		@test mcrpa2.sim.PDG == 1210

	end

end;
