---
title: "Word Search"
date: 2020-07-21T01:00:52+01:00
author: Kareem
tags:
  - "Backtracking"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 21

## Problem Statement

Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

**Example:**
```
board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
```

Given word = "ABCCED", return true.\
Given word = "SEE", return true.\
Given word = "ABCB", return false.

**Constraints:**

board and word consists only of lowercase and uppercase English letters.\
1 <= board.length <= 200\
1 <= board[i].length <= 200\
1 <= word.length <= 10^3


## Inputs, Outputs, Constraints & Exceptions
- **I**: string[][]
- **O**: boolean
- **C**: no other constraints (other than the above)
- **E**: - first letter of words not in board
  - word does not exist
  - board and board[i] lengths are 1
  - word length of 1

## Code (initial incorrect attempt)

```js
// loop iterate through the board and find letter at the beginning of our word
// for each of the adjacent elements, we perform a recursive call
// -> word, board, index of word we are checking, index of board place we just checked

// recursive call:
// we check if the index of the words we are checking === word.length, if so return true
// else we increment the index and do 3 more  recursive calls for other adjacent cells

// at the end of calling function we return false

/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */
function exist(board, word) {
  for(let i = 0; i < board.length; i++){
    for(let j = 0; j < board[i]; j++){
  
      const letterIsIdentical = board[i][j] === word[0]
      if(letterIsIdentical && isFullWordInBoard([boardRow, boardCol], [null,null], 1, board, word)){
        return true
      }
    }
  }
  return false
}

function findAdjacentElements(currPos, lastPos, board){
  let [row, col] = currPos
  let elements = [
    [row + 1, col],
    [row - 1, col],
    [row, col+1],
    [row, col-1]
  ]
  
  return elements.filter(curr => {
    return curr !== null && curr.toString() !== lastPos.toString()
  })
}

function isFullWordInBoard(currPos, lastPos, wordIndex, board, word) {
  if(wordIndex === word.length){
    return true
  }

  let adj = findAdjacentElements(currPos, lastPos, board) //number[][]
  
  for(let i = 0; i < adj.length; i++){
    let row = adj[i][0]
    let col = adj[i][1]

    const letterIsIdentical = word[wordIndex] === board[row][col]
    const fullWordInBoard = isFullWordInBoard([row, col], currPos, wordIndex+1, board, word)
    
    if( letterIsIdentical && fullWordInBoard) { 
      return true;
    }
  }
  
  return false
}
```

> The code above oesn't work. Too convoluted and not sufficiently thought out. I need more practice with Dynammic Programming and Backtracking

## Code 2 (optimal)

```js
function exist(board, word) {
  if(board.length === 0 || word.length === 0) return false;

  const height = board.length;
  const width = board[0].length;
  const directions = [[0, 1], [0, -1], [1, 0], [-1, 0]];

  const dfs = (x, y, k) => {
    if(word[k] !== board[x][y]) return false;
    if(k === word.length - 1) return true;

    board[x][y] = '#';
    for(const [dx, dy] of directions){
      const r = x + dx
      const c = y + dy
      if(r >= 0 && r < height && c >= 0 && c < width){
        if(dfs(r, c, k+1)) return true;
      }
    }
    board[x][y] = word[k];
    return false;
  }

  for(let i = 0; i < height; i++){
    for(let j = 0; j < width; j++){
      if(dfs(i, j, 0)) return true;
    } 
  }

  return false;
}
```

**_Time complexity_**: O(N * $4^{L}$)\
\- where N is the total number of elements in the board\
\- and L is the length of the word

this is because in the worst case scenario, for each element we make a choice of 4 possible directions to explore (which we may do for the full length of the word)

**_Space complexity_**: O(N + L)

I can understand why its O(L), though not sure why it's O(N + L) [according to Hongbo-Miao](https://leetcode.com/problems/word-search/discuss/133078/Clean-JavaScript-solution)