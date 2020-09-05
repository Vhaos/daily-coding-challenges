---
title: "Repeated Subsubstring Pattern"
date: 2020-09-03T01:00:52+01:00
author: Kareem
tags:
  - String
draft: true
---

<!-- LeetCode month and day here -->

# LeetCode September - Day 3

## Problem Statement

Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.

**Example 1:**

```
Input: "abab"
Output: True
Explanation: It's the substring "ab" twice.
```

**Example 2:**

```
Input: "aba"
Output: False
```

**Example 3:**

```
Input: "abcabcabcabc"
Output: True
Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
```

## Inputs, Outputs, Constraints & Exceptions

- **I**:
- **O**:
- **C**:
- **E**:

## Code

```js
/**
 * @param {string} s
 * @return {boolean}
 */
function repeatedSubstringPattern(s) {
  let sLen = s.length;
  for (let i = Math.floor(sLen / 2); i >= 0; i--) {
    if (sLen % i === 0) {
      let numRepeats = sLen / i;
      if (s.substring(0, i).repeat(numRepeats) === s) {
        return true;
      }
    }
  }
  return false;
}
```

**_Time complexity_**: O($S *\sqrt{S}$)\
\- where S is the length of the input string
**_Space complexity_**: O(1)
