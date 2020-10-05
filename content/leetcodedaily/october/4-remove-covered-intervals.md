---
title: "Remove Covered Intervals"
date: 2020-10-04T01:00:52+01:00
author: Kareem
tags:
  - Greedy
  - Sort
---

<!-- LeetCode month and day here -->
# LeetCode October - Day 4

## Problem Statement

Given a list of **`intervals`**, remove all intervals that are covered by another interval in the list.

Interval **`[a,b)`** is covered by interval **`[c,d)`** if and only if **`c <= a`** and **`b <= d`.**

After doing so, return the number of remaining intervals. 

**Example 1:**
```
Input: intervals = [[1,4],[3,6],[2,8]]
Output: 2
```
**Explanation**:\
Interval [3,6] is covered by [2,8], therefore it is removed.

**Example 2**:
```
Input: intervals = [[1,4],[2,3]]
Output: 1
```
**Example 3**:
```
Input: intervals = [[0,10],[5,12]]
Output: 2
```
**Example 4**:
```
Input: intervals = [[3,10],[4,10],[5,11]]
Output: 2
```
**Example 5**:
```
Input: intervals = [[1,2],[1,4],[3,4]]
Output: 1
```

**Constraints**:
- 1 <= intervals.length <= 1000
- intervals[i].length == 2
- 0 <= intervals[i][0] < intervals[i][1] <= 10^5
- All the intervals are **unique**.

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[][] {intervals}
- **O**: number
- **C**: no other constraints other than the above
- **E**: - intervals.length is 1
  - intervals all with single interval 

## Code

```js
/**
 * @param {number[][]} intervals
 * @return {number}
 */
function removeCoveredIntervals(intervals) {
  if(intervals.length === 1){
    return 0;
  }
  
  intervals.sort((a, b) => a[0] - b[0])
  
  let result = 0
  let curr = [-1, -1]
  
  for(let [low, high] of intervals){
    if(low > curr[0] && high > curr[1]){
      curr[0] = low
      result++
    }
    curr[1] = Math.max(high, curr[1])
  }
  
  return result;
};
```

**_Time complexity_**: O(NlogN)\
**_Space complexity_**: O(1)