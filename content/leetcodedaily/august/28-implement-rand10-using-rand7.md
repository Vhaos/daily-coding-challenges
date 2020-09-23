---
title: "Implement Rand10 Using Rand"
date: 2020-08-28T01:00:52+01:00
author: Kareem
tags:
  - Class Design
  - Random
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 28

## Problem Statement

Given the API `rand7()` that generates a uniform random integer in the range `[1, 7]`, write a function `rand10()` that generates a uniform random integer in the range `[1, 10]`. You can only call the API `rand7()`, and you shouldn't call any other API. Please do not use a language's built-in random API.

Each test case will have one _internal_ argument `n`, the number of times that your implemented function `rand10()` will be called while testing. Note that this is not an argument passed to `rand10()`.

**Follow up:**

- What is the [expected value](https://en.wikipedia.org/wiki/Expected_value) for the number of calls to rand7() function?
- Could you minimize the number of calls to rand7()?
 

**Example 1:**
```
Input: n = 1
Output: [2]
```
**Example 2:**
```
Input: n = 2
Output: [2,8]
```
**Example 3:**
```
Input: n = 3
Output: [3,8,10]
```

**Constraints:**

- $1 <= n <= 10^{5}$

## Code (sourced online)
I still don't fully understand the logic behind this particular solution. Next steps: 
- review this solution
- online link to original solution is missing
  
```js
/**
 * The rand7() API is already defined for you.
 * var rand7 = function() {}
 * @return {number} a random integer in the range 1 to 7
 */
function rand10() {
    return (rand7() + rand7() + rand7() + rand7() + rand7()) % 10 + 1;  
};
```

**_Time complexity_**:  O(1)\
**_Space complexity_**: O(1)