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


end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree.root.data
p tree.root.left.data
p tree.root.right.data