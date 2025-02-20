---
title: "Random Point in Non-Overlapping Rectangles"
date: 2020-08-22T01:00:52+01:00
author: Kareem
tags:
  - Binary Search
  - Random
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 22

## Problem Statement

Given a list of non-overlapping axis-aligned rectangles rects, write a function pick which randomly and uniformily picks an integer point in the space covered by the rectangles.

**Note:**

- An integer point is a point that has integer coordinates. 
A point on the perimeter of a rectangle is included in the space covered by the rectangles.
- ith rectangle = rects[i] = [x1,y1,x2,y2], where [x1, y1] are the integer coordinates of the bottom-left corner, and [x2, y2] are the integer coordinates of the top-right corner.
- length and width of each rectangle does not exceed 2000.
- 1 <= rects.length <= 100
- pick returns a point as an array of integer coordinates [p_x, p_y]
- pick is called at most 10000 times.

**Example 1:**
```
Input: 
["Solution","pick","pick","pick"]
[[[[1,1,5,5]]],[],[],[]]
Output: 
[null,[4,1],[4,1],[3,3]]
```
**Example 2:**
```
Input: 
["Solution","pick","pick","pick","pick","pick"]
[[[[-2,-2,-1,-1],[1,0,3,0]]],[],[],[],[],[]]
Output: 
[null,[-1,-2],[2,0],[-2,-1],[3,0],[-2,-2]]
```

**Explanation of Input Syntax:**

The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array of rectangles rects. pick has no arguments. Arguments are always wrapped with a list, even if there aren't any.


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[][]
- **O**: number[]
- **C**: none/optimise
- **E**: - area of one of the rects is 0
  - area of all rects is 0

## Code
```python
class Solution:

  def __init__(self, rects: List[List[int]]):
    self.rects = rects
    self.weights = []
    self.sum = 0
        
    for x1, y1, x2, y2 in rects:
      area = (x2 - x1 + 1) * (y2 - y1 + 1)
      self.weights.append(area)
      self.sum += area
          
    self.weights = [x / self.sum for x in self.weights]
        

  def pick(self) -> List[int]:
    rect = random.choices(population = self.rects, weights = self.weights, k = 1)[0]
    x1, y1, x2, y2 = rect
    return [random.randint(x1,x2), random.randint(y1,y2)]
```