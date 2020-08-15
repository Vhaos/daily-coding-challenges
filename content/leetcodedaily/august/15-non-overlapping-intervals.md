---
title: "Non-Overlapping Intervals"
date: 2020-08-15T01:00:52+01:00
author: Kareem
tags:
  - Array
  - Greedy
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 15

## Problem Statement

Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

**Example 1:**
```
Input: [[1,2],[2,3],[3,4],[1,3]]
Output: 1
```
Explanation: [1,3] can be removed and the rest of intervals are non-overlapping.

**Example 2:**
```
Input: [[1,2],[1,2],[1,2]]
Output: 2
```
Explanation: You need to remove two [1,2] to make the rest of intervals non-overlapping.

**Example 3:**
```
Input: [[1,2],[2,3]]
Output: 0
```
Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
 
**Note:**

You may assume the interval's end point is always bigger than its start point.
Intervals like [1,2] and [2,3] have borders "touching" but they don't overlap each other.


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[][]
- **O**: number
- **C**: `/* todo */`
- **E**: - intervals are already non-overlapping
  - intervals.length <= 1


## Code (sorting the input first, then greedy approach)
```js
/**
 * @param {number[][]} intervals
 * @return {number}
 */
function eraseOverlapIntervals(intervals) {
  if(intervals == null || intervals.length < 2){
    return 0
  }

  intervals.sort((a, b) => a[1] - b[1]);
  let remove = 0;
  let prev = intervals[0]

  for(let i = 1; i < intervals.length; i++){
    const [prevS, prevE] = prev;
    const [currS, currE] = intervals[i];
    if(prevE <= currS) prev = intervals[i];
    else remove++
  }
  
  return remove
}
```

**_Time complexity_**: O(NlogN)\
\- where N is the size of the input array {intervals}\
**_Space complexity_**: O(1)