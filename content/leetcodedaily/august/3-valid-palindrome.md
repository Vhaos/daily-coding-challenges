---
title: "Valid Palindrome"
date: 2020-08-03T01:00:52+01:00
author: Kareem
tags:
  - "String"
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 3

## Problem Statement

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

**Example 1:**
```
Input: "A man, a plan, a canal: Panama"
Output: true
```
**Example 2:**
```
Input: "race a car"
Output: false
```
**Constraints:**
s consists only of printable ASCII characters.

## Inputs, Outputs, Constraints & Exceptions
- **I**: string {s}
- **O**: boolean
- **C**: - s is basic ASCII chars
  - s.length in range [0, 10000]
- **E**: - empty string
  - string of length 1
  - string of only special characters or spaces

## Code

```js
/**
 * @param {string} s
 * @return {boolean}
 */
function isPalindrome(s) {
  if(s.length <= 1){
    return true
  }

  let i = 0, j = s.length - 1;
  while(i <= j){
    if(!/[a-zA-Z0-9]/.test(s[i])){
      i++;
      continue;
    }

    if(!/[a-zA-Z0-9]/.test(s[j])){
      j--;
      continue;
    }

    if(s[i].toLocaleLowerCase() !== s[j].toLocaleLowerCase()){
      return false
    }
    
    i++;
    j--;
  }

  return true
};
```

**_Time complexity_**: O(N)\
**_Space complexity_**: O(1)