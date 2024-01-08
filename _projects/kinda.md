---
title: "KinDA Simulations"
layout: single
header:
  overlay_color: "#000"
  overlay_filter: "0.3"
  overlay_blur: "5px"
  overlay_image: /assets/images/dna.jpg
  alt: "Placeholder"
  actions:
    - label: "GitHub"
      url: "https://github.com/DNA-and-Natural-Algorithms-Group/KinDA"
      new_tab: true
  caption: "[freepik](https://www.freepik.com/free-photos-vectors)"
excerpt: "MPI implementation for HPC of KinDA simulations"
author_profile: true
---

In my master's thesis, I am working on an MPI (Message Passing Interface) implementation of the simulator KiNDA. KiNDA is used to decompose a series of reactions into their fundamental steps, which are then individually simulated using a tool called Multistrand. This detailed breakdown allows for a more granular analysis and understanding of the reactions.

Originally, due to the extensive number of simulation trials needed for accurate rate parameter estimation, the project utilized Python's multiprocessing capabilities. However, with recent access to a larger computing cluster, I am transitioning to using mpi4py, a Python wrapper for MPI functionalities, to enhance and scale the simulation process.

The revised setup will be executed via Slurm, a job scheduling system, on a self-created cluster in the Oracle Cloud. This upgrade aims to leverage high-performance computing (HPC) resources more effectively, drastically reducing computation times and enabling larger and more complex simulations.

This transition to an MPI-based system represents a significant step in my research, promising to open up new possibilities in terms of simulation scale and precision. I'm eager to see how this will improve the efficiency and capabilities of the KinDA simulations.