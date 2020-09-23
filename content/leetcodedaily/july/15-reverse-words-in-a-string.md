---
title: "Reverse Words in a String"
date: 2020-07-15T01:00:52+01:00
author: Kareem
tags:
  - "String"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 15

## Problem Statement

Given an input string, reverse the string word by word.

**Example 1:**

Input: "the sky is blue"\
Output: "blue is sky the"

**Example 2:**

Input: "  hello world!  "\
Output: "world! hello"\
Explanation: Your reversed string should not contain leading or trailing spaces.

**Example 3:**

Input: "a good   example"\
Output: "example good a"\
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 

**Note:**\
A word is defined as a sequence of non-space characters.
Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
You need to reduce multiple spaces between two words to a single space in the reversed string.
 

**Follow up:**\
For C programmers, try to solve it in-place in O(1) extra space.

## Inputs, Outputs, Constraints & Exceptions
- **I**: string {s}
- **O**: string {rev}
- **C**: none, optimise (can't use built in string functions)
- **E**: empty string, string of spaces, palindrome

## Code (simple version)

```js
/**
 * @param {string} s
 * @return {string}
 */
function reverseWords(s) {
  return s.trim().split(/\s+/).reverse().join(' ')
};
```

## Code (less straightforward)

```js
/**
 * @param {string} s
 * @return {string}
 */
function reverseWords(s) {
  
  let words = []
  let curr = ''
  
  for(let i = 0; i < s.length + 1; i++){
    
    if(s[i] === ' ' || i === s.length){
      if(curr.length) {
        words.push(curr);
        curr = '';
      }
      continue;
    }

    curr += s[i]
  }
  
  let rev = ''
  for(i = words.length - 1; i >= 0; i--){
    rev = rev + words[i] + ' '
  }

  return rev.slice(0, -1)
};
```

**_Time complexity_**: O(N^2)\
**_Space complexity_**: O(N)