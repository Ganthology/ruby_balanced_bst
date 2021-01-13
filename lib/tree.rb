require_relative './node'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    array = array.uniq.sort
    # base case array is empty
    mid = array.length / 2
    root = Node.new(array[mid])
    return root if mid.zero?

    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid..array.length])
    root
  end

  def insert(value)
    @root = insert_nodes(@root, value)
  end

  def insert_nodes(root, value)
    return nil if value.nil?

    if root.nil?
      root = Node.new(value)
    elsif value > root
      root.right = insert_nodes(root.right, value)
    elsif value < root
      root.left = insert_nodes(root.left, value)
    end
    root
  end

  def delete(value)
    @root = delete_nodes(@root, value)
  end

  def delete_nodes(root, value)
    return nil if root.nil?

    if value > root
      root.right = delete_nodes(root.right, value)
    else
      root.left = delete_nodes(root.left, value)
    end
    root
  end
end

tree = Tree.new([1, 2, 3])
p tree.root.data
p tree.root.left.left
p tree.root.right.data
