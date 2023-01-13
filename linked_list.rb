# Node class which contains a value and can be connected to a next node
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    self.value = value
  end
end

# List of nodes with methods for the it
class LinkedList 
  attr_accessor :head, :tail

  def initialize(value)
    head = Node.new(value)
    self.head = head
    self.tail = head
  end

  def size
    size = 0
    each do
      size += 1
    end
    size
  end

  def append(value)
    appended = Node.new(value)
    tail.next_node = appended
    self.tail = appended 
  end

  def at(index)
    each do |node, node_index|
      return node if index == node_index
    end
  end

  def pop
    one_before_last = at(size - 1)  
    one_before_last.next_node = nil
    self.tail = one_before_last
  end

  def contains?(value)
    each do |node|
      return true if node.value == value
    end
    false
  end

  def find(value)
    each do |node, index|
      return index if node.value == value
    end
    nil
  end

  def to_s
    string = ""
    each do |node|
      string << "(#{node.value}) -> "
    end
    string << "nil"
  end

  def insert_at(value, index)
    last_node = at(index - 1)
    if last_node
      node = Node.new(value)
      node.next_node = last_node.next_node
      last_node.next_node = node
    else
      warn("No index found, appending to tail.")
      append(value)
    end
  end

  def remove_at(index)
    node = at(index)
    raise(ArgumentError, "Node not found") unless node

    last_node = at(index - 1)
    last_node.next_node = node.next_node
    node.next_node = nil
  end

  def each
    index = 1
    node = head

    while node
      yield(node, index)
      index += 1
      node = node.next_node
    end
  end
end

linked_list = LinkedList.new("damn")

linked_list.append("daniel")
linked_list.append("cool")
linked_list.append("how")
linked_list.append("interesting")
puts linked_list
linked_list.insert_at("spogbob", 10)
puts linked_list
linked_list.remove_at(10)
puts linked_list
