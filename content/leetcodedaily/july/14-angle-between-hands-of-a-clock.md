---
title: "Angle Between Hands of a Clock"
date: 2020-07-14T01:00:52+01:00
author: Kareem
tags:
  - "Math"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 14

## Problem Statement

Given two numbers, hour and minutes. Return the smaller angle (in degrees) formed between the hour and the minute hand.
 
Constraints:\
1 <= hour <= 12\
0 <= minutes <= 59

Answers within 10^-5 of the actual value will be accepted as correct.

Input: hour = 12, minutes = 30\
Output: 165

Input: hour = 3, minutes = 15\
Output: 7.5

Input: hour = 4, minutes = 50\
Output: 155

## Inputs, Outputs, Constraints & Exceptions
- **I**: number {h}, number {n}
- **O**: number {angle}
- **C**: optimise
- **E**: hour = 12, minutes = 0

hourAngle = 30  * h + m/60
minAngle = 6 * m

## Code

```js
function angleClock(hours, minutes){
  let hourAngle = 30 * (hours + minutes / 60);
  let minAngle = 6 * minutes;
  let angle = Math.abs(hourAngle - minAngle);
  if(angle > 180) angle = 360 - angle;
  return angle;
}
```

**_Time complexity_**: O(1) \
**_Space complexity_**: O(1)