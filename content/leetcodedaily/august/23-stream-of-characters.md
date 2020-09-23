---
title: "Stream of Characters"
date: 2020-08-23T01:00:52+01:00
author: Kareem
tags:
  - Class Design
  - Trie
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 23

## Problem Statement

Implement the StreamChecker class as follows:

- `StreamChecker(words)`: Constructor, init the data structure with the given words.
- `query(letter)`: returns true if and only if for some `k >= 1`, the last `k` characters queried (in order from oldest to newest, including this letter just queried) spell one of the words in the given list.

**Example:**
```
StreamChecker streamChecker = new StreamChecker(["cd","f","kl"]); // init the dictionary.
streamChecker.query('a');          // return false
streamChecker.query('b');          // return false
streamChecker.query('c');          // return false
streamChecker.query('d');          // return true, because 'cd' is in the wordlist
streamChecker.query('e');          // return false
streamChecker.query('f');          // return true, because 'f' is in the wordlist
streamChecker.query('g');          // return false
streamChecker.query('h');          // return false
streamChecker.query('i');          // return false
streamChecker.query('j');          // return false
streamChecker.query('k');          // return false
streamChecker.query('l');          // return true, because 'kl' is in the wordlist
```

**Note:**

- 1 <= words.length <= 2000
- 1 <= words[i].length <= 2000
- Words will only consist of lowercase English letters.
- Queries will only consist of lowercase English letters.
- The number of queries is at most 40000.

## Code (using a trie)

```js
class StreamChecker {
  /**
   * @param {string[]} words
   */
  constructor(words){
    this.trie = {}
    for(let word of words){
      this.addToTrie(word)
    }
    this.prev = []
  }
  
  addToTrie(word){
    let curr = this.trie
    for(let l of word){
      if(!curr[l]) {
        curr[l] = {}
      }
      curr = curr[l] 
    }
    curr.isWord = true
  }
  /** 
   * @param {character} letter
   * @return {boolean}
   */ 
  query(letter) {
    let isWord = false, words = []
    
    for(let word of this.prev){
      if(word[letter]) {
        words.push(word[letter])
        if(word[letter].isWord) isWord = true
      }
    }
    
    if(this.trie[letter]) {
      words.push(this.trie[letter])
      if(this.trie[letter].isWord) isWord = true
    }

    this.prev = words
    
    return isWord
  };
}
```
