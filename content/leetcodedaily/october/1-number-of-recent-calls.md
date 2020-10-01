---
title: "Number of Recent Calls"
date: 2020-10-01T01:00:52+01:00
author: Kareem
tags:
  - Class Design
  - Queue
---

<!-- LeetCode month and day here -->
# LeetCode October - Day 1

## Problem Statement


You have a `RecentCounter` class which counts the number of recent requests within a certain time frame.

Implement the `RecentCounter` class:

- `RecentCounter()` Initializes the counter with zero recent requests.
- `int ping(int t)` Adds a new request at time `t`, where `t` represents some time in milliseconds, and returns the number of requests that has happened in the past `3000` milliseconds (including the new request). Specifically, return the number of requests that have happened in the inclusive range `[t - 3000, t]`.

It is **guaranteed** that every call to `ping` uses a strictly larger value of `t` than the previous call.

**Example 1:**
```
Input
["RecentCounter", "ping", "ping", "ping", "ping"]
[[], [1], [100], [3001], [3002]]
Output
[null, 1, 2, 3, 3]
```
**Explanation**
```
RecentCounter recentCounter = new RecentCounter();
recentCounter.ping(1);     // requests = [1], range is [-2999,1], return 1
recentCounter.ping(100);   // requests = [1, 100], range is [-2900,100], return 2
recentCounter.ping(3001);  // requests = [1, 100, 3001], range is [1,3001], return 3
recentCounter.ping(3002);  // requests = [1, 100, 3001, 3002], range is [2,3002], return 3
```

**Constraints**:

- 1 <= t <= $10^9$
- Each test case will call ping with strictly increasing values of t.
- At most $10^4$ calls will be made to ping.

## Code

```js
/** 
 * Your RecentCounter object will be instantiated and called as such:
 * var obj = new RecentCounter()
 * var param_1 = obj.ping(t)
 */
class RecentCounter {
  constructor(){
    this.recent = [];
  }
  /** 
   * @param {number} t
   * @return {number}
   */
  ping(t) {
    const recent = this.recent
    const lowerBound = t - 3000
    
    recent.push(t)
    while(recent[0] < lowerBound) {
      recent.shift()
    }
    
    return recent.length
  }
};
```

**_Time complexity_**: O(1)\
\- `ping()` will at most iterate through 3000 elements when calls, hence constant time complexity (O(3000) => O(1)\
**_Space complexity_**: O(1)\
\- at most 3000 elements are stored in the `recent` array