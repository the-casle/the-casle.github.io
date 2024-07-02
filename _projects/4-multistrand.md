---
title: "Multistrand"
permalink: /multistrand/
layout: single
header:
  overlay_color: "#000"
  overlay_filter: "0.4"
  overlay_blur: "15px"
  overlay_image: /assets/images/multistrand-reaction.png
  alt: "Placeholder"
  actions:
    - label: "GitHub"
      url: "https://github.com/DNA-and-Natural-Algorithms-Group/multistrand"
      new_tab: true
  #teaser: /assets/images/asteroid.png
excerpt: "Nucleic Acids Kinetic Simulator"
author_profile: true
---

Multistrand is a sophisticated nucleic acid kinetics simulator used to study biological circuits at the sequence-level. The tool emphasizes the often-overlooked kinetics of DNA, highlighting not only its chemical reactivity but also its physical properties, which are vital in understanding DNA behaviors and interactions.

In a collaborative effort with Boyan Bernov, we undertook the task of modernizing this tool. Previously outdated, Multistrand presented a unique opportunity for me to engage with a substantial piece of legacy code. Our primary goal was to transition the project from Python 2 to Python 3, ensuring its continued utility in contemporary research environments. We placed a heavy emphasis on software engineering principles, particularly testing with pytest to ensure robustness and reliability.

This project marked my first attempt at working with Python C extensions, which required manual memory management between the two languages. This aspect was particularly challenging, necessitating extensive use of tools like Valgrind's memcheck and Python's debug build for GDB.

We also focused on enhancing performance. Through timing analyses, we identified and targeted bottlenecks, achieving significant speedups by prioritizing data reuse and optimizing existing structures.

One of the most significant challenges was determining the location of bugs in such a complex project. Pytest proved invaluable in this regard, enabling us to methodically address issues. Furthermore, we improved the project's parallelization capabilities, allowing users to run the test suite more efficiently and reducing overall execution time.

Through this project, I've bolstered my debugging skills, deepened my understanding of Python C extensions, and contributed to a tool that plays a critical role in nucleic acids research.

