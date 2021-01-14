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
    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[(mid + 1)..-1])
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
    elsif value < root
      root.left = delete_nodes(root.left, value)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      root.data = smallest_value(root.right)
      root.right = delete_nodes(root.right, root.data)
    end
    root
  end

  def smallest_value(root)
    smallest = root.data
    until root.left.nil?
      smallest = root.left.key
      root = root.left
    end
    smallest
  end

  def find(value)
    current_node = @root
    until current_node.nil? 
      return current_node if current_node.data == value

      current_node = value > current_node.data ? current_node.right : current_node.left
      # if value > current_node.data
      #   current_node = current_node.right
      # else
      #   current_node = current_node.left
      # end
    end
    current_node
  end

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
end

tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9 , 10, 11])
# p tree.root.data
# p tree.root.left.left
# p tree.root.right.data
p tree.level_order
