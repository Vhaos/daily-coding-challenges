---
title: "Goat Latin"
date: 2020-08-19T01:00:52+01:00
author: Kareem
tags:
  - String
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 19

## Problem Statement

A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.

We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

The rules of Goat Latin are as follows:

If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
For example, the word 'apple' becomes 'applema'.
 
If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
For example, the word "goat" becomes "oatgma".
 
Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
Return the final sentence representing the conversion from S to Goat Latin. 

**Example 1:**
```
Input: "I speak Goat Latin"
Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
```
**Example 2:**
```
Input: "The quick brown fox jumped over the lazy dog"
Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
```
**Notes:**\
S contains only uppercase, lowercase and spaces. Exactly one space between each word.\
1 <= S.length <= 150.

## Inputs, Outputs, Constraints & Exceptions
- **I**: string {S}
- **O**: string
- **C**: - input is basic ASCII 
  - 1 <= S.length <= 150.
- **E**: S.length is 1


## Code (first attempt)
```js
const toGoatLatin = (S) => {
  const vowels = new Set(['a','e','i','o','u'])
  const words = S.split(' ')
  
  for(let i = 0; i < words.length; i++){
    let splitW = words[i].split('')
    
    if(vowels.has(splitW[0].toLowerCase())){
      splitW.push('ma')
    } else {
      splitW.push(splitW.shift(),'ma')
    }
    
    words[i] = splitW.concat(new Array(i+1).fill('a')).join('')
  }
  
  return words.join(' ')
};
```
## Code (same as above but more cleanly written)
```js
function toGoatLatin(S) {
  const vowels = new Set(['a','e','i','o','u'])
  const words = S.split(' ')
  return words.map((word,i) => {
    if(vowels.has(word[0].toLowerCase())){
      return word + 'ma' + 'a'.repeat(i + 1)
    } else {
      return word.slice(1) + word[0] + 'ma' + 'a'.repeat(i + 1)
    }
  }).join(' ')
}
```
**_Time complexity_**: O($N + K^{2}$) where\
\- N is the number of characters in the input\
\- K is the number of words in the input\
**_Space complexity_**: O($N + K^{2}$) 