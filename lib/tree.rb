class Tree
  attr_reader :root

  def initialize(array)
    sorted_array = array.sort.uniq
    @root = build_tree(sorted_array, 0, sorted_array.length - 1)
  end

  def build_tree(array, first, last)
    mid = ((first + last) / 2)
    return nil if first > last

    root_node = Node.new(array[mid])
    root_node.left = build_tree(array, first, (mid - 1))
    root_node.right = build_tree(array, (mid + 1), last)

    root_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value)
    insert_main(Node.new(value))
  end

  def insert_main(node, root_node = root)
    if node > root_node
      if root_node.right.nil?
        root_node.right = node
      else
        insert_main(node, root_node.right)
      end
    else
      if root_node.left.nil?
        root_node.left = node
      else
        insert_main(node, root_node.left)
      end
    end
  end
end
