---
title: "Anomaly Detection"
layout: single
header:
  overlay_color: "#000"
  overlay_filter: "0.6"
  overlay_blur: "10px"
  overlay_image: /assets/images/tensorflow.png
  alt: "Placeholder"
  #teaser: /assets/images/asteroid.png
excerpt: "Anomaly Detection on edge devices utilizing tensorflow machine learning models"
tags:
  - featured
  - machine-learning
  - Ecolab

author_profile: true
---
Cannot link github since properietary of Ecolab. 
Worked with TensorFlow machine learning models for anomaly detection. Implemented on the edge. 

Needed to be memory efficient. Created an auto-encoder that took 1D convolution neural network using FFT with 
rolling windowing as input.

The STM would then flash a light when anomalies were detected. Completely on the edge so no interent connection
was required when live.

Communicated accelerometer data via SPI to the STM32. 

{% include figure image_path="/assets/images/anomaly-setup.JPG" alt="this is a placeholder image" caption="The design." %}


Varied n-th percentile of error distribution to determine what worked best for the system training data as threshold for reconstruction error in order
to identify anomalies. 

{% include video id="1E3eyIoXIKWs4LIJWtd0HVBItE_fRH6jv" provider="google-drive" %}


Vary the percentile used as threshold affects the precision and recall of the system. This is important
because for anomaly detection, it is often more important for the monitoring system to have false postiives
than to false negatives.


98% accuracy for anomalies, 
with a high F-1 score to verify it wasn't simply guessing the non anomlay class (precision and recall).

Future directions for the system would be a multi modal system that utilized a more general model for
anomaly identfication, and a following model for classification of the specific kind of problem.

Why is this important? Typically there are signs in a system that problems are deteriorating before 
the system fails. It is often important to flag these issues as they can save money on costly repairs
or extended downtimes. In general, the earlier a fault can be detected, the better. While traditional 
monitors such as frequency or energy analysis of a single can determine an issue, as stated the earlier
the better. That's why machine learning is important for 

STM32 stuff
edge computing
crazy stuff