---
title: "Hyper Sonic Glide Vehicle"
layout: single
header:
  overlay_color: "#000"
  overlay_filter: "0.3"
  overlay_blur: "5px"
  overlay_image: /assets/images/hgv.webp
  alt: "Placeholder"
  actions:
    - label: "GitHub"
      url: "https://github.com/the-casle/hgv-clone"
      new_tab: true
  caption: "[**NASA**](https://www.nasa.gov/reference/x-43a/)"
excerpt: "CUDA implementation"
tags:
  - featured

author_profile: true
---

In this project we used a serialized version of a hypersonic
glide vehicle trajectory simulation originally written in fortran and
converted it to c code since we were more comfortable working in c.

We then implemented the simulation in cuda to be run on the tesla series
gpus. The reason we wanted to implement the program in cuda was that control
surfaces can be intergrated into the program in the future. With this, there will
be more time steps required per simulation, and what would take days to run will
only take hours.

Focus on memory coalescing and data reuse. Using NVIDIA's nsight tools
to profile the project.

We were able to achieve 13x speedup, however we believed that there would be even more speedup
in a longer simulation as much of the timing on the gpu was the initial startup
and one time data transfer.

I learned a lot from this project. Specifically loop mitosis techniques, as well
as the importance of proper data management when working on a GPU. 
In addition, properly utilizing the full occupancy of the GPU and tailoring the 
kernel launches to reach the full occupancy is critical for speedup.