# Creates a node class with the values you give it:
# -data
# -left
# -right
class Node
  include Comparable
  attr_accessor :left, :right, :data
  
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right  
  end

  def <=>(other)
    return unless other.is_a?(Node)

    @data <=> other.data
  end
end

# Constructs a tree of sorted nodes from an array of numbers. Also contains helpful methods.
class Tree
  attr_reader :root, :array

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array)
  end

  def build_tree(array)
    return if array.empty?

    middle = array.length / 2
    return Node.new(array.first) if array.length <= 1

    root = Node.new(array[middle])

    root.left = build_tree(array.slice(0, middle))  
    root.right = build_tree(array.slice(middle + 1, array.length))

    root
  end

  def insert(value, root = @root)
    return root if root.data == value
    
    if value > root.data
      root.right = root.right.nil? ? root.right = Node.new(value) : insert(value, root.right)
    else
      root.left = root.left.nil? ? root.left = Node.new(value) : insert(value, root.left)
    end
    root
  end

  def delete(value, root = @root)
    return root if root.nil?

    if value > root.data
      root.right = delete(value, root.right)
    elsif value < root.data
      root.left = delete(value, root.left)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil? 

      root.data = min_value(root.right)

      root.right = delete(root.data, root.right) 
    end
    root
  end

  def min_value(root)
    minv = root.data
    until root.left.nil?
      minv = root.left.data
      root = root.left
    end
    minv
  end

  def find(value, node = @root) 
    return node if node.nil? || value == node.data 

    value > node.data ? find(value, node.right) : find(value, node.left)
  end

  def level_order
    queue = []
    queue.push(@root)
    array = []

    current_node = nil
    until queue.empty?
      current_node = queue.shift
      array << current_node.data
      queue.push(current_node.left, current_node.right).compact!
      yield(current_node) if block_given?
    end
    array
  end

  def preorder(node = @root, array = [])
    return if node.nil?

    array.push(node.data)
    yield(node) if block_given?
    preorder(node.left, array)
    preorder(node.right, array)
    array
  end
  
  def inorder(node = @root, array = [])
    return if node.nil?
    
    inorder(node.left, array)
    array.push(node.data)
    yield(node) if block_given?
    inorder(node.right, array)
    array
  end

  def postorder(node = @root, array = [])
    return if node.nil?

    postorder(node.left, array)
    postorder(node.right, array)
    array.push(node.data)
    yield(node) if block_given?
    array
  end

  def height(node = @root)
    return -1 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def depth(node = @root, parent = @root, edges = 0)
    return edges if node == parent 
    return -1 if node.nil?

    edges += 1
    if node > parent
      depth(node, parent.right, edges)
    else
      depth(node, parent.left, edges)
    end
  end

  def balanced?
    left_tree = height(@root.left)
    right_tree = height(@root.right)
    return true unless left_tree - right_tree > 1

    false
  end

  def rebalance
    @array = inorder
    @root = build_tree(@array)
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts("#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}")
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = Tree.new([20, 30, 32, 34, 36, 40, 50, 60, 65, 75, 80, 85])
tree.pretty_print
tree.insert(31)
tree.insert(31.2)
tree.insert(31.5)
tree.insert(31.8)
tree.insert(33)
tree.insert(37)
tree.insert(38)
tree.pretty_print
tree.delete(40)
p(tree.find(36.3))
tree.pretty_print
p(tree.level_order)
p(tree.preorder)
p(tree.inorder)
p(tree.postorder)
p(tree.height)
p(tree.depth(tree.find(33)))
p(tree.balanced?)
tree.rebalance
p(tree.balanced?)
tree.pretty_print