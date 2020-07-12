---
title: "Reverse Bits"
date: 2020-07-12T01:00:52+01:00
author: Kareem
tags:
  - "Bit Manipulation"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 12

## Problem Statement

Reverse bits of a given 32 bits unsigned integer.

**Example 1:**

Input: `00000010100101000001111010011100`
Output: `00111001011110000010100101000000`
Explanation: The input binary string `00000010100101000001111010011100` represents the unsigned integer 43261596, so return 964176192 which its binary representation is `00111001011110000010100101000000`.

**Example 2:**

Input: `11111111111111111111111111111101`
Output: `10111111111111111111111111111111`
Explanation: The input binary string `11111111111111111111111111111101` represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is `10111111111111111111111111111111`.
 

**Note:**

Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above the input represents the signed integer -3 and the output represents the signed integer -1073741825.

**Follow up:**

If this function is called many times, how would you optimize it?


## Inputs, Outputs, Constraints & Exceptions
- **I**: number
- **O**: number
- **C**: input >= 0
- **E**: 0, all 1s


## Code

```js
/**
 * @param {number} n - a positive integer
 * @return {number} - a positive integer
 */
function reverseBits(n) {
  let rev = 0;
  for(let i = 0; i < 32; i++){
    let bit = n & 1;
    rev = (rev << 1) | bit;
    n = n >> 1
  }
  return rev
};
```

**_Time complexity_**: O(1) \
**_Space complexity_**: O(1)