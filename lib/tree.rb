require_relative './node'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return nil if array.empty?

    # base case array is empty
    mid = (array.length - 1) / 2
    # root is the middle node
    root = Node.new(array[mid])
    # left tree is index 0 to index mid - 1
    root.left = build_tree(array[0...mid])
    # right tree is index mid + 1 to last index
    root.right = build_tree(array[(mid + 1)..-1])
    root
  end

  # call the recursive insert method
  def insert(value)
    @root = insert_nodes(@root, value)
  end

  # insert node and replace remaining nodes recursively
  def insert_nodes(root, value)
    return nil if value.nil?

    # if the node is empty, insert node with new node
    if root.nil?
      root = Node.new(value)
    # if value is larger, check right node
    elsif value > root.data
      root.right = insert_nodes(root.right, value)
    # if value is smaller, check left node
    elsif value < root.data
      root.left = insert_nodes(root.left, value)
    end
    root
  end

  def delete(value)
    # call the recursive delete method
    @root = delete_nodes(@root, value)
  end

  # delete nodes and replace the remaining nodes recursively
  def delete_nodes(root, value)
    return nil if root.nil?

    # if the value is larger than current node, check right
    if value > root.data
      root.right = delete_nodes(root.right, value)
    # if value is smaller, check left
    elsif value < root.data
      root.left = delete_nodes(root.left, value)
    # when the value is equal, the node is found
    else
      # replace with left or right node if only one child
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      # the child node with smallest value replace the deleted node
      root.data = smallest_value(root.right)
      root.right = delete_nodes(root.right, root.data)
    end
    root
  end

  # return the smallest value of a node, check if left node is nil
  def smallest_value(root = @root)
    smallest = root.data
    until root.left.nil?
      smallest = root.left.key
      root = root.left
    end
    smallest
  end

  # return the node containing the value
  def find(value)
    current_node = @root
    until current_node.nil?
      return current_node if current_node.data == value

      current_node = value > current_node.data ? current_node.right : current_node.left
    end
    current_node
  end

  # level order traversal using iterator
  def level_order
    array = []
    queue = []
    queue << @root
    until queue.empty?
      queue.push(queue.first.left) unless queue.first.left.nil?
      queue.push(queue.first.right) unless queue.first.right.nil?
      array << queue.shift.data
    end
    array
  end

  # level order traversal using recursion
  def level_order_rec
    height = height(@root)
    array = []
    1.upto(height) { |i| array << print_given_level(@root, i) }
    array.flatten.reject(&:nil?)
  end

  # print the nodes at the same level, starts from 1
  def print_given_level(root, level)
    return if root.nil?

    array = []

    if level == 1
      array << root.data
    elsif level > 1
      array << print_given_level(root.left, level - 1)
      array << print_given_level(root.right, level - 1)
    end
  end

  # return the height of the tree if given @root
  def height(node = @root)
    return 0 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    left_height > right_height ? left_height + 1 : right_height + 1
  end

  def depth(node = @root)
    return 0 if node == @root || node.nil?

    left_depth = depth(node.left)
    right_depth = depth(node.right)
    left_depth > right_depth ? left_depth + 1 : right_depth + 1
  end

  def preorder(root = @root)
    # root > left > right
    return if root.nil?

    array = [root.data] << preorder(root.left) << preorder(root.right)
    array.flatten.reject(&:nil?)
  end

  def inorder(root = @root)
    # left > root > right
    return if root.nil?

    array = [inorder(root.left)] << [root.data] << inorder(root.right)
    array.flatten.reject(&:nil?)
  end

  def postorder(root = @root)
    # left > right > root
    return if root.nil?

    array = [postorder(root.left)] << postorder(root.right) << [root.data]
    array.flatten.reject(&:nil?)
  end

  def balanced?(root = @root)
    # difference between heights not more than 1
    return true if root.nil?

    return true if ((height(root.left) - height(root.right)).abs <= 1) && balanced?(root.left) && balanced?(root.right)

    false
  end

  def rebalance
    return inorder if balanced?

    array = inorder
    @root = build_tree(array)
  end
end

tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
# p tree.root.data
# p tree.root.left.left
# p tree.root.right.data
# p tree.level_order
# p tree.level_order_rec
# p tree.print_given_level(tree.root, 4)
p tree.preorder
p tree.inorder
p tree.postorder

p tree.height
p tree.depth
p tree.depth(tree.root.right.right)
p tree.balanced?
tree.insert(20)
tree.insert(22)
p tree.preorder
p tree.balanced?
tree.rebalance
p tree.preorder
p tree.balanced?