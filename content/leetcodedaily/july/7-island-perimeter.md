---
title: "Island Perimeter"
date: 2020-07-07T01:00:52+01:00
author: Kareem
tags:
  - "Array"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 7

## Problem Statement

You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

**Example:**

Input:
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

Output: 16

Explanation: The perimeter is the 16 yellow stripes in the image below:

![](https://assets.leetcode.com/uploads/2018/10/12/island.png)

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[][]
- **O**: number
- **C**: none/optimise
- **E**: empty array, array of 1s

## PseudoCode
```
sum = 0
for r = 0 to len(grid):
  for c = 0 to len(r):
    if grid[r][c] === 1:
      sum += 4 - top - bottom - left - right 
return sum
```

## Code

```js
/**
 * @param {number[][]} grid
 * @return {number}
 */
const islandPerimeter = (grid) => {
  let sum = 0
  for(let row = 0; row < grid.length; row++){
    for(let col = 0; col < row.length; col++){
      const top = grid[row - 1][col] ?? 0;
      const bot = grid[row + 1][col] ?? 0;
      const left = grid[row][col - 1] ?? 0;
      const right = grid[row][col + 1] ?? 0;
      sum += 4 - top - bot - left - right;
    }
  }
  return sum
};
```

**_Time complexity_**: O(N)\
\- where N is the number of nodes in the grid (i.e. area)\
**_Space complexity_**: O(1)