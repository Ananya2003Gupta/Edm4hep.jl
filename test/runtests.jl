using Edm4hep
using Test

@testset "Edm4hep.jl" begin
	@testset "One to Many Relations" begin
	    mcp1 = MCParticle()
	    mcp1.PDG = 1210

	    mcp2 = MCParticle()
	    mcp2.PDG = 1212

	    mcp3 = MCParticle()
	    mcp3.PDG = 101
	    push!(mcp3.parents,mcp1)

	    mcp4 = MCParticle()
	    mcp4.PDG = 110
	    push!(mcp4.parents,mcp2)

	    mcp5 = MCParticle()
	    mcp5.PDG = 111
	    push!(mcp5.parents,mcp1)
	    push!(mcp5.parents,mcp2)


	    mcp1.PDG = 12
	    mcp2.PDG = 18

	    # passes if values are changed in parents

	    @test mcp3.parents[1].PDG == 12
	    @test mcp4.parents[1].PDG == 18
	    @test mcp5.parents[1].PDG == 12
	    @test mcp5.parents[2].PDG == 18
	end

	@testset "Vector Members" begin

		p1 = ParticleID()
		p1.parameters = Float32[11,12,13,14,15]
		p1.parameters[5] = 16

		@test p1.parameters[5] == 16
		@test p1.parameters[1] == 11
		@test p1.parameters[2] == 12
		@test p1.parameters[3] == 13
		@test p1.parameters[4] == 14
	end

	@testset "Cyclic Dependency" begin

		v1 = Vertex()
		rp2 = ReconstructedParticle()
		v1.associatedParticle = rp2
		rp2.startVertex = v1

		@test v1.associatedParticle === rp2
		@test rp2.startVertex === v1
	end

	@testset "One To One Relations" begin

		mcp1 = MCParticle()
		mcp1.PDG = 1210

		mcrpa2 = MCRecoParticleAssociation()
		mcrpa2.sim = mcp1

		@test mcrpa2.sim.PDG == 1210

	end

	@testset "Collections" begin
	    mcp1 = MCParticle()
	    mcp1.PDG = 2212
	    mcp2 = MCParticle()
	    mcp2.PDG = 2212
	    mcp3 = MCParticle()
	    mcp3.PDG = 1
	    push!(mcp3.parents,mcp1)
	    a = MCParticleCollection([mcp1,mcp2,mcp3])
	    mc1=a[1]
	    mc2=a[2]
	    mc3=a[3]
	    @test mc1.PDG == 2212
	    @test mc2.PDG == 2212
	    @test mc3.PDG == 1
	    @test length(mc3.parents)== 1
	    @test mc3.parents[1] == mc1
	end
end;
