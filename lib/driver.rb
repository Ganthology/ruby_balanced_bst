require_relative('tree')
# driver script

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
# 2. Confirm that the tree is balanced by calling `#balanced?`
# 3. Print out all elements in level, pre, post, and in order
# 4. try to unbalance the tree by adding several numbers > 100
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
# 6. Balance the tree by calling `#rebalance`
# 7. Confirm that the tree is balanced by calling `#balanced?`
# 8. Print out all elements in level, pre, post, and in order

tree = Tree.new(Array.new(15) { rand(1..100) })

puts "The tree is balanced? #{tree.balanced?}"
tree.pretty_print

puts "The preorder traversal of the tree is #{tree.preorder}"
puts "The postorder traversal of the tree is #{tree.postorder}"
puts "The inorder traversal of the tree is #{tree.inorder}"

puts 'Try to unbalance the tree...'
tree.insert(rand(100..200))
tree.insert(rand(100..200))
tree.insert(rand(100..200))
puts "The tree is now balanced: #{tree.balanced?}"
tree.pretty_print

puts 'Try to rebalance the tree...'
tree.rebalance
puts "The tree is now balanced: #{tree.balanced?}"
tree.pretty_print

puts "The preorder traversal of the tree is #{tree.preorder}"
puts "The postorder traversal of the tree is #{tree.postorder}"
puts "The inorder traversal of the tree is #{tree.inorder}"
