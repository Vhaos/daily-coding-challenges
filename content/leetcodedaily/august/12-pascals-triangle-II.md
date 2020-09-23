---
title: "Pascals Triangle II"
date: 2020-08-12T01:00:52+01:00
author: Kareem
tags:
  - Math
  - Array
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 12

## Problem Statement

Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

Note that the row index starts from 0.

![](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)

In Pascal's triangle, each number is the sum of the two numbers directly above it.

**Example:**
```
Input: 3
Output: [1,3,3,1]
```
Follow up:\
Could you optimize your algorithm to use only O(k) extra space?

## Inputs, Outputs, Constraints & Exceptions
- **I**: number
- **O**: number[]
- **C**: rowIndex in range [0, 33]
- **E**: input is 0

## Code (naive first attempt)
```js
/**
 * @param {number} rowIndex
 * @return {number[]}
 */
function getRow(rowIndex) {
  if(rowIndex === 0)
    return [1];

  if(rowIndex === 1)
    return [1, 1];

  let res = [1, 1]
  for(let i = 2; i < rowIndex + 1; i++){
    let temp = new Array(res.length + 1)
    temp[0] = 1
    temp[temp.length-1] = 1
    for(let j = 1; j < temp.length - 1; j++){
      temp[j] = res[j - 1] + res[j]
    }
    res = temp
  }

  return res
};
```

**_Time complexity_**: O($N^{2}$) \
**_Space complexity_**: O($N$)

## Most optimal found solution

using a bit of math knowledge

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/8c87f03fad69decf7242517f3596a5dab8ff3df7)
```js
var getRow = function(rowIndex) {
  const row = [1];

  for (let column = 1; column <= rowIndex; ++column) {
    row.push((row[column - 1] * (rowIndex - column + 1)) / column);
  }

  return row;
};
```
**Time complexity:** O(N)\
**Space complexity:** O(N)\
\- O(1) if you exclude the space needed for the result
