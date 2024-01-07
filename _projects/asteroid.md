---
title: "Asteroid"
layout: single
header:
  overlay_color: "#000"
  overlay_filter: "0.6"
  overlay_blur: "10px"
  overlay_image: /assets/images/asteroid.png
  alt: "Placeholder"
  actions:
    - label: "GitHub"
      url: "https://github.com/midnightchip/Asteroid"
      new_tab: true
    - label: "Dynastic Development"
      url: "https://repo.dynastic.co/com.midnightchips.asteroid/"
      new_tab: true
  #teaser: /assets/images/asteroid.png
excerpt: "iOS jailbreak tweak implementing weather UI System-Wide"
tags:
  - featured

author_profile: true
---
**Concurrent Users:** 110,000

Asteroid allows displaying live animations of the weather on the Home Screen, 
Lock Screen and Weather App. The project utilizes private frameworks.

Multiple moving parts ranging from the weathermodel we designed to the gesture interface
for advanced customization. Frontend UI and UX considerations as well as multiple backend components
interacting with Apple's own system.

Used objective-c because this is the primary langauge of Apple's underlying system. 
Logos was used for tweak injection

What your application does,
Why you used the technologies you used,
Some of the challenges you faced and features you hope to implement in the future.

Since most of the tweak injection occured on Apple's private classes, we had to use the Ghidra tool
to dump headers. The lack of documentation made the entire project more difficult than standard
app development, but this was not our first iOS tweak and we were both comfortable working with
many of the classes in Apple's Springboard.

{% include figure image_path="/assets/images/white.png" alt="this is a placeholder image" 
caption="Above shows one possible setup for the lockscreen." %}

Why did we do this? Initially we wanted to replicate the look of the newly released wakeup
screen that apple introduced in iOS 12. However, we thought there were many missing features for 
this implementation. The largest being the live weather icon. Many of the stock iOS icons report 
live information (insert calender or clock). The weather app is a logical stock app that should
report its information live. In the form of an updating temperature and glyph.

Looking back now, you can see that while Apple typically implements jailbreak tweaks,
this was something that was never implemented.

