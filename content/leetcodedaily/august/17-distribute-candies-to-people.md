---
title: "Distribute Candies to People"
date: 2020-08-17T01:00:52+01:00
author: Kareem
tags:
  - Greedy
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 17

## Problem Statement

We distribute some number of candies, to a row of n = num_people people in the following way:

We then give 1 candy to the first person, 2 candies to the second person, and so on until we give n candies to the last person.

Then, we go back to the start of the row, giving n + 1 candies to the first person, n + 2 candies to the second person, and so on until we give 2 * n candies to the last person.

This process repeats (with us giving one more candy each time, and moving to the start of the row after we reach the end) until we run out of candies.  The last person will receive all of our remaining candies (not necessarily one more than the previous gift).

Return an array (of length num_people and sum candies) that represents the final distribution of candies.

**Example 1:**
```
Input: candies = 7, num_people = 4
Output: [1,2,3,1]
```
Explanation:
On the first turn, ans[0] += 1, and the array is [1,0,0,0].
On the second turn, ans[1] += 2, and the array is [1,2,0,0].
On the third turn, ans[2] += 3, and the array is [1,2,3,0].
On the fourth turn, ans[3] += 1 (because there is only one candy left), and the final array is [1,2,3,1].

**Example 2:**
```
Input: candies = 10, num_people = 3
Output: [5,2,3]
```
Explanation: 
On the first turn, ans[0] += 1, and the array is [1,0,0].
On the second turn, ans[1] += 2, and the array is [1,2,0].
On the third turn, ans[2] += 3, and the array is [1,2,3].
On the fourth turn, ans[0] += 4, and the final array is [5,2,3].

**Constraints:**

1 <= candies <= 10^9
1 <= num_people <= 1000


## Inputs, Outputs, Constraints & Exceptions
- **I**: number {num_people}, number {candies}
- **O**: number[] {distribution}
- **C**: - candies in range [1, 10^9]
  - num_people in range [1, 1000]
- **E**: - num people is 1
  - candies is 1

## Code

```js
/**
 * @param {number} candies
 * @param {number} num_people
 * @return {number[]}
 */
const distributeCandies = (candies, num_people) => {
  let people = new Array(num_people).fill(0)
  let amount = 1
  while(candies > 0){
    for(let i = 0; i < people.length; i++){
      if(amount >= candies){
        people[i] += candies;
        candies = 0
        break
      }

      people[i] += amount
      candies -= amount
      amount++
    }
  }
  return people
};
```

**_Time complexity_**: O(K) \
\- where k is the number of candies\
**_Space complexity_**: O(N)