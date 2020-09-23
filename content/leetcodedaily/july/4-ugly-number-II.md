---
title: "Ugly Number II"
date: 2020-07-04T01:00:52+01:00
author: Kareem
tags:
  - "Math"
  - "Dynammic Programming"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 4

## Problem Statement

Write a program to find the n-th ugly number.

Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. 

**Example:**

Input: n = 10
Output: 12
Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
Note:  

1 is typically treated as an ugly number.
n does not exceed 1690.


## Inputs, Outputs, Constraints & Exceptions
- **I**: number
- **O**: number
- **C**: none/optimise
- **E**: n is 1 


## Code

```js
const nthUglyNumber = (N) => {
  if (N < 1){
    return -1; //error
  }

  const ugly = [1];
  let [nm2, nm3, nm5] = [2, 3, 5];
  let [i2, i3, i5] = [0, 0, 0]
  
  for(let i = 1; i < N; i++){
    const min = Math.min(nm2, nm3, nm5)
    ugly[i] = min
    if(min === nm2){
      i2++;
      nm2 = ugly[i2] * 2
    }
    if(min === nm3){
      i3++;
      nm3 = ugly[i3] * 3
    }
    if(min === nm5){
      i5++;
      nm5 = ugly[i5] * 5
    }
  }
  
  return ugly[N-1]
}
```

**_Time complexity_**: O(N)\
**_Space complexity_**: O(N)