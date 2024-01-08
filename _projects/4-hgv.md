---
title: "Hyper Sonic Glide Vehicle"
layout: single
permalink: /hgv/
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
excerpt: "CUDA implementation of Hyper Sonic Glide Vehicle simulations"
author_profile: true
order: 4
---

In this project, we transformed a serialized version of a hypersonic glide vehicle trajectory simulation, originally written in Fortran, into C code. This conversion was driven by our familiarity with C and our goal to leverage its capabilities for our objectives.

We then implemented the simulation in CUDA using the C code as our reference serial program. The motivation behind employing CUDA was the anticipation of future integrations of control surfaces into the program. These integrations will necessitate increased time steps per simulation, where GPU implementations can transform simulation times from days to mere minutes.

Our focus was on optimizing memory coalescing and data reuse, employing NVIDIA's Nsight tools for detailed project profiling. These efforts were crucial in achieving a 13x speedup in our simulations. We anticipate that with longer simulations, the benefits of GPU acceleration will be even more pronounced, as the initial startup and one-time data transfer become relatively negligible.

This project provided a wealth of learning opportunities. I developed a deeper understanding of loop mitosis techniques and the critical nature of data management when working with GPUs. Additionally, I learned the importance of maximizing GPU occupancy and fine-tuning kernel launches to achieve optimal speed and performance.