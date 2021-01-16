# Balanced Binary Search Tree (Ruby)
## Introduction
This is part of The Odin Project curriculum.

A **binary search tree** is a rooted binary tree whose internal nodes each store a key greater than all the keys in the node's left subtree and less than those in its right subtree.

A **balanced tree** is one where the difference between heights of left subtree and right subtree of every node is not more than 1.

## Assignment
1. Build a ```Node``` class, has attribute for the data it stores, left and right children.
2. Build a ```Tree``` class that accepts an array when initialized.
3. ```#build_tree``` method takes an array and turns into a balanced binary tree.
4. ```#insert``` and ```#delete``` method which accepts a value to insert/delete.
5. ```#find``` method which accepts a value and returns the node with the given value.
6. ```#level_order``` method that returns an array of values. This method traverse the tree in breadth-first-order.
7. ```#inorder```,```#preorder```,```#postorder``` methods that returns an array.
8. ```#height``` method which accepts a node and returns its height. Height is the distance from given node to leaf node.
9. ```#depth``` method which accepts a node and returns its depth. Depth is the distance from a given node to the tree's root node.
10. ```#balanced?``` method which checks if the tree is balanced.
11. ```#rebalance``` method which rebalances an unbalance tree.
12. Write a simple driver script.

## Extras
- There is a ```#level_order_rec``` method that does that same thing like ```#level_order``` but recursively
- ```#smallest_value``` method to find the smallest value in tree
- ```#pretty_print``` method to visualize the tree
