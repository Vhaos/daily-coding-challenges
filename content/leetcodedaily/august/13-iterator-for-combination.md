---
title: "Iterator for Combination"
date: 2020-08-13T01:00:52+01:00
author: Kareem
tags:
  - Class Design
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 13

## Problem Statement

Design an Iterator class, which has:

- A constructor that takes a string characters of sorted distinct lowercase English letters and a number combinationLength as arguments.
- A function next() that returns the next combination of length combinationLength in lexicographical order.
- A function hasNext() that returns True if and only if there exists a next combination.

**Example:**
```java
// creates the iterator.
CombinationIterator iterator = new CombinationIterator("abc", 2);

iterator.next(); // returns "ab"
iterator.hasNext(); // returns true
iterator.next(); // returns "ac"
iterator.hasNext(); // returns true
iterator.next(); // returns "bc"
iterator.hasNext(); // returns false
```
**Constraints:**

1 <= combinationLength <= characters.length <= 15\
There will be at most 10^4 function calls per test.\
It's guaranteed that all calls of the function next are valid.

## Code

```js
class CombinationIterator {
  constructor(chars, combinationLength){
    this.combinationLength = combinationLength
    
    const partialCombinationsList = []
    this.recurse(0, [], chars, partialCombinationsList )
    
    this.curr = 0;
    this.combinations = partialCombinationsList.filter(x => {
      x.length === combinationLength
    })
  }

  next(){
    return this.combinations[this.curr++]
  }

  hasNext(){
    return this.curr < this.combinations.length
  }

  recurse(index, partial, chars, combinations){
    if(partial.length >= this.combinationLength){
      combinations.push([...partial].join(''))
      return;
    }

    for(let i = index; i < chars.length; i++){
      partial.push(chars[i])
      this.recurse(i + 1, partial, chars, combinations)
      partial.pop()
    }
  }
}
```
