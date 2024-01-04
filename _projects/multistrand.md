---
title: "Multistrand"
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
tags:
  - featured

author_profile: true
---

Multistrand is a nucleic acid kinetics simulator. This 
is useful for studying nano machines and stuff and simulating at
the sequence level. Analyzing the kinetics of dna is a usually forgotten 
about aspect, but it is important to consider the details that DNA is not
just a chemical reactant but has physical properties, too.

Collaborated with Boyan Bernov to modernize the
tool. It was severly outdated. One of my first chances
to work on a large piece of legacy code. 
Migrated the project from python2
to python3. Heavy focus on software engineering principles such as 
testing using pytest. The original source code wasn't utilizing modern
c++ very well so tried to introduce some changes in that flavor.

First time working on a python c extensions project. There's a lot more
manual memory management requried at the boundary betweeen the two langauges
that are just asking to be messed up.

Spent a lot of time using valgrinds memcheck and the python debug build for 
debugging a python c extension project. Feel more confident with my debugging skills now.

Focus on performance as well and performed multiple timing analysises to 
find where the bottlenecks were. Was able to get decent speedup by focusing on data
reuse. 

Some of the biggest challenges I faced was trying to figure out what exactly was broken.
Pytest was very useful in that aspect. We also implemented improve parallelization for the 
multiprocessing specifically so that the test suite can be run by a user in 
a reasonable amount of time. 
