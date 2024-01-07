---
title: "MPI implementation of KinDA Simulations"
layout: single
tags:
  - hpc
  - mpi
  - slurm
  - oracle
---
I'm currently working on an MPI implementation of the simulator KiNDA. This program is used to break up a series
of reactions into their core steps. These "condensed" reactions are then simulated in multistrand.

Because of the required number of simulation trials to reach an accurate estimate of rate parameters,
we used python's multiprocessing. However, with access to a larger cluster now, I want to implement the
process launcher using mpiforpy. 

This would then be launched via slurm on a cluster I created in the Oracle cloud. This is ongoing during
my master's thesis.