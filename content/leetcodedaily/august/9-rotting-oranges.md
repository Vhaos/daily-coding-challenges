---
title: "Rotting Oranges"
date: 2020-08-09T01:00:52+01:00
author: Kareem
tags:
  - Breadth-first Search
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 9

## Problem Statement

In a given grid, each cell can have one of three values:

the value 0 representing an empty cell;\
the value 1 representing a fresh orange;\
the value 2 representing a rotten orange.\
Every minute, any fresh orange that is adjacent \(4-directionally) to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

**Example 1:**
![](https://assets.leetcode.com/uploads/2019/02/16/oranges.png)
```
Input: [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
```
Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

**Example 2:**
```
Input: [[0,2]]
Output: 0
```
Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.

**Note:**

1 <= grid.length <= 10\
1 <= grid[0].length <= 10\
grid[i][j] is only 0, 1, or 2.

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[][]
- **O**: number
- **C**: - grid.length in range [1, 10]
  - grid[0] length in range [1, 10]
  - values are either {0, 1, 2}
- **E**: - grid is 1x1
  - grid is empty
  - grid is all rotten
  - grid is all non-rotten
  - input where it is impossible for all oranges to rot

## Code

```js
/**
 * @param {number[][]} grid
 * @return {number}
 */
function orangesRotting(grid) {
  
  const q = []
  let count = 0
  let prev = grid.toString()

  for(let i = 0; i < grid.length; i++){
    for(let j = 0; j < grid[0].length; j++){
      let cell = grid[i][j]
      if(cell === 1){
        q.push([i, j]);
      }
    }
  }

  const willRot = (r, c) => {
    const adjCells = [
      [r + 1,c],
      [r - 1,c],
      [r,c + 1],
      [r,c - 1]
    ]
    
    for(let [i, j] of adjCells){
      if(grid[i]?.[j] === 2) return true;
    }
  
    return false
  }

  while(q.length){
    const qlen = q.length
    const rottingCells = []

    for(let i = 0; i < qlen; i++){
      const cell = q.shift()
      if(willRot(cell[0], cell[1])){
        rottingCells.push(cell)
      } else {
        q.push(cell)
      }
    }

    for(let c of rottingCells){
      grid[c[0]][c[1]] = 2
    }

    const curr = grid.toString()
    if(curr === prev) return -1;
    prev = curr
 
    count++
  }

  return count
};
```

**_Time complexity_**: O(n) \
\- where n is the number of cells in the grid\
**_Space complexity_**: O(n)