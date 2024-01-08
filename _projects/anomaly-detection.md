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
excerpt: "Implementing TensorFlow for efficient anomaly detection on edge devices."
author_profile: true
---

In this project I utilized TensorFlow, a machine learning tool, for detection of anomalies in the vibrational data of devices indicating potential failure points. The challenge was deploying this detection model on edge devices constrained by limited memory and processing capabilities.

I developed an auto-encoder using a 1D convolutional neural network (CNN). The model processed incoming data through a rolling window approach and applied the Fast Fourier Transform (FFT). This technique was both memory-efficient and well-suited for implementation directly on edge devices.

{% include figure image_path="/assets/images/anomaly-setup.JPG" alt="Anomaly" caption="The STM32 development board connected to an accelerometer for vibration detection." %}

Additionally, I customized the TensorFlow library for Cortex M7 processors, which had no official release at the time. This task involved enhancing my skills with gcc and clang compilers and gaining experience with cross-compiling.

Once operational, the system functions independently of an internet connection. This independence is a crucial feature in today's overwhelming shift towards IoT, allowing for quicker response times and creating air-gapped systems that enhance security and reliability.

{% include figure image_path="/assets/images/iot.JPG" alt="Anomaly" caption='"Poster" in the office.' %}

A critical component of the system's success was the transmission of accelerometer data via SPI to the STM32 microcontroller. 

By adjusting the n-th percentile of error distribution, I fine-tuned the system to effectively discern anomalies based on the training data. The system achieved 98% accuracy and a high F-1 score in anomaly detection, underscoring the project's effectiveness in not just identifying unusual patterns but ensuring the reliability of predictions. This balance between precision and recall is particularly vital in anomaly detection, where missing an anomaly can have more severe implications than a false positive.

Looking ahead, my goal is to develop the system into a multimodal platform that not only detects anomalies but also classifies them, thereby enhancing its robustness and versatility. The ultimate aim is to detect signs of deterioration at an early stage, reducing costly repairs and minimizing equipment downtime.

Why is this significant? In industries where equipment failure can lead to significant losses, early fault detection is crucial. Machine learning provides a sophisticated means to detect these early signs. By deploying these models on edge devices, we enable continuous, real-time monitoring capable of adapting to various operational conditions, paving the way for smarter, safer industry practices.