---
title: "Analyzing Dishwashing Loads"
layout: single
excerpt: "Dishwashing blah blah"
tags:
    - ecolab
---

During my internship at Ecolab I participated in 
a hackathon. My group utiilzed azure and tensorflow to create a variety of
computer vision models.

They were trained on standard dishwashing loads
and were used to identify and classify objects in the frame.
The system was designed to take pictures of the load 
and determine the correct run time, water temperature, and
soap to be dispensed for the detected dishes. This was important
because smaller loads with different materials such as glasses
need different treatment than an entire load of plates. Since
Ecolab is focussed on environment sustainability, the motivating
factor was to minimize water usage for dishwashing loads that don't need it.

{% include figure image_path="/assets/images/dishes.JPG" alt="Image Detection" caption="Object Detection
and classification of dishwashing loads." %}


This was my first experience working with Microsoft Azure's SQL databases, and I felt that 
I learned more about the storage system after this project.

Some challenges we faced was tuning hyperpameters of our models,
as well as training times. 

We were proud of our work in the end, and we got 2nd place out of 12 different groups.