---
title: "Longest Palindrome"
date: 2020-08-14T01:00:52+01:00
author: Kareem
tags:
  - String
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 14

## Problem Statement

Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.

This is case sensitive, for example "Aa" is not considered a palindrome here.

**Note:**\
Assume the length of given string will not exceed 1,010.

**Example:**
```
Input:
"abccccdd"
Output:
7
```
Explanation:\
One longest palindrome that can be built is "dccaccd", whose length is 7.


## Inputs, Outputs, Constraints & Exceptions
- **I**: string {chars}
- **O**: number
- **C**: chars in range [1, 1010]
- **E**: chars length is 1


## Code

```js
/**
 * @param {string} s
 * @return {number}
 */
function longestPalindrome(s) {
  const charMap = new Map()
  for(let c of s){
    charMap.set(c, (charMap.get(c) || 0) + 1)
  }

  let oddCount = 0;
  for(let charCount of charMap.values()){
    oddCount += charCount % 2
  }
  
  return s.length - oddCount + !!oddCount
};
```

**_Time complexity_**: O(N) \
**_Space complexity_**: O(N)