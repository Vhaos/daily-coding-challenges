---
title: "Prison Cells After N Days"
date: 2020-07-03T00:52:09+01:00
author: Kareem
tags:
  - ""
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 3

## Problem Statement

There are 8 prison cells in a row, and each cell is either occupied or vacant.

Each day, whether the cell is occupied or vacant changes according to the following rules:

If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
Otherwise, it becomes vacant.
(Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)

**Example 1:**

Input: cells = [0,1,0,1,1,0,0,1], N = 7
Output: [0,0,1,1,0,0,0,0]
Explanation: 
The following table summarizes the state of the prison on each day:
```
Day 0: [0, 1, 0, 1, 1, 0, 0, 1]
Day 1: [0, 1, 1, 0, 0, 0, 0, 0]
Day 2: [0, 0, 0, 0, 1, 1, 1, 0]
Day 3: [0, 1, 1, 0, 0, 1, 0, 0]
Day 4: [0, 0, 0, 0, 0, 1, 0, 0]
Day 5: [0, 1, 1, 1, 0, 1, 0, 0]
Day 6: [0, 0, 1, 0, 1, 1, 0, 0]
Day 7: [0, 0, 1, 1, 0, 0, 0, 0]
```
**Example 2:**

Input: cells = [1,0,0,1,0,0,1,0], N = 1000000000
Output: [0,0,1,1,1,1,1,0]
 

> Note:
>
> cells.length == 8
> cells[i] is in {0, 1}
> 1 <= N <= 10^9


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[], number
- **O**: number[]
- **C**: none, optimise
- **E**: cells are all 0 or all 1

## PseudoCode

```
prisonAfterNDays(cells, N):
  define result = ...cells
  for i = 0 to N:
    define temp = []
    for j of result:
      if j is first element or last element:
        current[j] = 0
      else:
        current[j] = !XOR(result[j-1], result[j+1])
    result = temp
```

## Code

```js
/**
 * @param {number[]} cells
 * @param {number} N
 * @return {number[]}
 */
const prisonAfterNDays =(cells, N) => {
  let result = [...cells]
  for(let day = 0; day < N; day++){
    result = result.map((curr, idx, arr) => {
      if(idx === 0 || idx === 7){
        return 0
      } else {
        return Number(!(arr[idx-1]^arr[idx+1]))
      }
    })
  }
  return result
};

```

**_Time complexity_**:  O(M \* N)\
\- where M is the length of the array and N is the number of days\
**_Space complexity_**:  O(M)

## PseudoCode

```
prisonAfterNDays(cells, N):
  define cache c
  for i = 0 to N:
    nextstate = calculate the next state of cells
    if nextstate is in the cache:
      define resultState = cells
      for i = 0 to N % cache.size:
        resultState = calculate the next state of cells
      return resultState
    else:
      add nextstate to cache
   cells = nextstate
```   

## Code

```js
const prisonAfterNDays = (cells, N) => {
  // set the variables we need  
  const cache = new Map();
  let flag = false;
  
  //find the length of a cycle
  for(let i = 0; i < N; i++){
    // compute next state
    const nextState = Array(cells.length).fill(0);
    for(let j = 1; j < cells.length-1; j++){
      nextState[j] = cells[j-1] === cells[j+1] ? 1 : 0;
    }
  
    //add to cache if not in cache, otherwise break
    const nsString = JSON.stringify(nextState);
    if(!cache.has(nsString)){
      cache.set(nsString, i)
    } else { 
      flag = true;
      break;
    }
    cells = nextState
  }

  //if we reached a loop, we recompute the iteration
  if(flag){
    const N = N % cache.size;
    for(let i = 0; i < N; i++){
      const nextState = Array(cells.length).fill(0);
      for(let j = 1; j < cells.length-1; j++){
        nextState[j] = cells[j-1] === cells[j+1] ? 1 : 0;
      }
      cells = nextState
    } 
  }

  return cells
}
```

**_Time Complexity_**: O(M \* (N % looplength)) \
**_Space Complexity_**: O(N)
