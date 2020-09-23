---
title: "Word Break II"
date: 2020-07-30T01:00:52+01:00
author: Kareem
tags:
  - "Dynammic Programming"
  - "Backtracking"
  - "Memoization"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 30

## Problem Statement

Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.

**Note:**

The same word in the dictionary may be reused multiple times in the segmentation.
You may assume the dictionary does not contain duplicate words.

**Example 1:**
```
Input:
s = "catsanddog"
wordDict = ["cat", "cats", "and", "sand", "dog"]
Output:
[
  "cats and dog",
  "cat sand dog"
]
```
**Example 2:**

```
Input:
s = "pineapplepenapple"
wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
Output:
[
  "pine apple pen apple",
  "pineapple pen apple",
  "pine applepen apple"
]
```
Explanation: Note that you are allowed to reuse a dictionary word.

**Example 3:**
```
Input:
s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]
Output:
[]
```


## Inputs, Outputs, Constraints & Exceptions
- **I**: - string {s},
  - string[] {wordDict}
- **O**: string[]
- **C**: - optimise
  - s.length in range [1, 1000]
  - wordDict length in range [0, 1000]
- **E**: - wordDict is empty
  - entire string s is a valid word in wordDict
  - sentence cannot be formed from wordDict


## Code (without memoization)

```js
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {string[]}
 */
function wordBreak(s, wordDict) {
  const result = []
  for(let w of wordDict){
    if(s.substring(0, w.length) === w){
      if(w.length === s.length){
        result.push(w)
      } else {
        const temp = wordBreak(s.substring(w.length), wordDict)
        for(let t of temp){
          result.push(w + ' ' + t)
        }
      }
    }
  }
  return result
};
```

## Code (with memoization)
```js
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {string[]}
 */
function wordBreak(s, wordDict) {
  const memo = new Map()
  
  const recurse = (s, wordDict) => {
    if(memo.has(s)) {
      return memo.get(s)
    }

    const result = []
    for(let w of wordDict){
      if(s.substring(0, w.length) === w){
        if(w.length === s.length){
          result.push(w)
        } else {
          const temp = recurse(s.substring(w.length), wordDict)
          for(let t of temp){
            result.push(w + ' ' + t)
          }
        }
      }
    }

    memo.set(s, result)
    return result
  }
  
  return recurse(s, wordDict)
};
```