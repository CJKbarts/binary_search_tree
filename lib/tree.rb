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
    elsif root_node.left.nil?
      root_node.left = node
    else
      insert_main(node, root_node.left)
    end
  end

  def delete(value, root_node = root)
    return root_node if root_node.nil?

    if value > root_node.value
      root_node.right = delete(value, root_node.right)
    elsif value < root_node.value
      root_node.left = delete(value, root_node.left)
    elsif root_node.right.nil?
      return root_node.left
    elsif root_node.left.nil?
      return root_node.right
    else
      root_node.value = next_largest_value(root_node)
      root_node.right = delete(root_node.value, root_node.right)
    end

    root_node
  end

  def find(value, root_node = root)
    if value > root_node.value
      find(value, root_node.right)
    elsif value < root_node.value
      find(value, root_node.left)
    else
      root_node
    end
  end

  def level_order
    queue = [root]
    queue.each do |node|
      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
      yield(node) if block_given?
    end

    queue unless block_given?
  end

  def level_order_rec(queue = [root], index = 0, &block)
    node = queue[index]
    block.call(node) if block_given?
    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?
    level_order_rec(queue, index + 1, &block) if (index + 1) < queue.length
    queue unless block_given?
  end

  def inorder(node = root, nodes = [], &block)
    return if node.nil?

    inorder(node.left, nodes, &block)
    if block_given?
      yield(node)
    else
      nodes.push(node)
    end
    inorder(node.right, nodes, &block)

    nodes unless block_given?
  end

  def preorder(node = root, nodes = [], &block)
    return if node.nil?

    if block_given?
      yield(node)
    else
      nodes.push(node)
    end
    preorder(node.left, nodes, &block)
    preorder(node.right, nodes, &block)

    nodes unless block_given?
  end

  def postorder(node = root, nodes = [], &block)
    return if node.nil?

    postorder(node.left, nodes, &block)
    postorder(node.right, nodes, &block)

    if block_given?
      yield(node)
    else
      nodes.push(node)
    end
  end

  def height(node = root)
    return 0 if node.nil?

    1 + [height(node.left), height(node.right)].max
  end

  def depth(value, root_node = root)
    return 0 if root_node.nil?

    if value == root_node.value
      1
    else
      next_node = value > root_node.value ? root_node.right : root_node.left
      1 + depth(value, next_node)
    end
  end

  def balanced?(node = root)
    return true if node.nil?
    return true if node.right.nil? && node.left.nil?

    (height(node.right) - height(node.left)).abs <= 1 &&
      balanced?(node.right) && balanced?(node.left)
  end

  def rebalance
    array = inorder.map(&:value)
    @root = build_tree(array, 0, array.length - 1)
  end

  private

  def next_largest_value(root_node)
    current_node = root_node.right
    current_node = root_node.left until current_node.left.nil?
    current_node.value
  end
end
