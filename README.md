# Edm4hep.jl: A Prototypic Edm4hep Julia Package
[![Build Status](https://github.com/Ananya2003Gupta/Edm4hep.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Ananya2003Gupta/Edm4hep.jl/actions/workflows/CI.yml?query=branch%3Amain)

**Package:** Edm4hep.jl

**Version:** 1.0.0-DEV

**License:** MIT

## **Description:**

This package provides a prototypic implementation of the EDM4hep data model in Julia. 
EDM4hep is a generic event data model designed for future HEP collider experiments. 

This Julia package offers in-memory representation of the datamodel's components and datatypes, including:

* **Components:** Represented by mutable structs with constructor definitions.
* **Datatypes:** Represented by mutable structs with constructor and collection definitions.

This package is currently under development and does not yet have I/O functionality. It focuses on providing a foundation for building future versions with full EDM4hep support in Julia.

## **Features:**

* In-memory representation of EDM4hep components and datatypes.
* Mutable structs for efficient data manipulation.
* Constructor definitions for creating data objects.
* Collection definitions for managing groups of objects.

## **Dependencies:**

**StaticArrays:** A Julia package for statically sized arrays.

## **Installation:**

1. Clone this repository: `git clone https://github.com/Ananya2003Gupta/Edm4hep.jl.git`
2. Run `julia` and within the REPL, type `using Pkg; Pkg.add("Edm4hep.jl")`.

## **Usage Examples:**

```julia
using Edm4hep

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

```

## **Motivation:**

This package aims to bridge the gap between EDM4hep and the Julia ecosystem, facilitating the development of tools and applications for HEP data analysis using Julia's powerful features and expressiveness.

## **Future Plans:**

The future development of this package includes:

* Implementing I/O functionality for reading and writing EDM4hep data.
* Providing additional utilities and tools for working with EDM4hep data in Julia.

## **Links:**

* EDM4hep: [key4hep/EDM4hep](https://github.com/key4hep/EDM4hep)
* PODIO: [AIDASoft/podio](https://github.com/AIDASoft/podio)
* EDM4hep datamodel: [edm4hep.yaml](https://github.com/key4hep/EDM4hep/blob/main/edm4hep.yaml)

## **Branches:**

* `main`: Contains the current design with individual files for mutable struct definition of components and datatypes.
* `v002`: Contains an alternative design with a single file for all component and datatype mutable struct definitions.

Please note that both branches are experimental and may undergo further changes in the future.

## Generating Julia Files from PODIO

This package provides a prototypic implementation of the EDM4hep data model in Julia. The initial code generation was performed using the PODIO library:

```
python podio_class_generator.py --lang julia <path/to/>edm4hep.yaml edm4hep_julia edm4hep ROOT
```

This command generates all Julia files into the `edm4hep_julia/edm4hep` directory. These generated files served as the foundation for the current package structure.

**Please note:** While the basic functionalities are implemented, the generated code may undergo further modifications and improvements in future versions.

## Open Issues and Feedback

We encourage you to contribute to the development of this package by providing valuable feedback and reporting any issues you encounter. You can open issues on the project's GitHub repository to:

* Report bugs or unexpected behavior.
* Suggest improvements or additional features.
* Share your use cases and experience with the package.

Your contributions will help us improve the functionality and usability of this package for the community.
