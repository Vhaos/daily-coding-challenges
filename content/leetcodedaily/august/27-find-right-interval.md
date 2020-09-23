---
title: "Find Right Interval"
date: 2020-08-27T01:00:52+01:00
author: Kareem
tags:
  - Binary Search
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 27

## Problem Statement

You are given an array of `intervals`, where `intervals[i] = [starti, endi]` and each `starti` is unique.

The right interval for an interval `i` is an interval `j` such that `startj >= endi` and `startj` is minimized.

Return an array of _right interval_ indices for each interval `i`. If no _right interval_ exists for interval `i`, then put `-1` at index `i`.

**Example 1:**
```
Input: intervals = [[1,2]]
Output: [-1]
Explanation: There is only one interval in the collection, so it outputs -1.
```

**Example 2:**
```
Input: intervals = [[3,4],[2,3],[1,2]]
Output: [-1,0,1]
Explanation: There is no right interval for [3,4].
The right interval for [2,3] is [3,4] since start0 = 3 is the smallest start that is >= end1 = 3.
The right interval for [1,2] is [2,3] since start1 = 2 is the smallest start that is >= end2 = 2.
```

**Example 3:**
```
Input: intervals = [[1,4],[2,3],[3,4]]
Output: [-1,2,-1]
Explanation: There is no right interval for [1,4] and [3,4].
The right interval for [2,3] is [3,4] since start2 = 3 is the smallest start that is >= end1 = 3.
```

**Constraints:**

- 1 <= intervals.length <= 2 * $10^{4}$
- intervals[i].length == 2
- $-10^{6}$ <= $start_i$ <= $end_i$ <= $10^{6}$
- The start point of each interval is unique.

## Inputs, Outputs, Constraints & Exceptions
- **I**: number[][]
- **O**: number[]
- **C**: none other than the above
- **E**: intervals.length === 1


## Code

```js
/**
 * @param {number[][]} intervals
 * @return {number[]}
 */
function findRightInterval(intervals) {
  const hm = new Map()
  for(let i = 0; i < intervals.length; i++){
    hm.set(intervals[i][0], i)
  }

  intervals.sort((a, b) => a[0] - b[0])
  
  const binarySearch = (val) => {
    let index = -1
    let l = 0, r = intervals.length - 1
  
    while(l <= r){  
      let mid = Math.floor((l + r) / 2)
      let j = intervals[mid]
      if(j[0] >= val[1] && j[0] !== val[0]){
        index = hm.get(j[0])
        r = mid - 1 
      } else {
        l = mid + 1
      }
    }
    return index
  }
  
  let res = []
  for(let i = 0; i < intervals.length; i++){
    let interval = intervals[i], index = hm.get(intervals[i][0])
    res[index] = binarySearch(interval)
  }
  
  return res
};
```

**_Time complexity_**: O(NlogN)\
**_Space complexity_**: O(N)