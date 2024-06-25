require_relative 'lib/node'
require_relative 'lib/tree'

def print_orders(tree)
  print 'Level order: '
  tree.level_order { |node| print "#{node.value} " }
  puts
  print 'Inorder: '
  tree.inorder { |node| print "#{node.value} " }
  puts
  print 'Preorder: '
  tree.preorder { |node| print "#{node.value} " }
  puts
  print 'Postorder: '
  tree.postorder { |node| print "#{node.value} " }
  puts
end

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print
puts
puts "Tree balanced?: #{tree.balanced?}"
print_orders(tree)

rand(1..10).times { tree.insert(rand(100..300)) }
tree.pretty_print
puts

puts "Tree balanced?: #{tree.balanced?}"

tree.rebalance
tree.pretty_print
puts "Tree balanced?: #{tree.balanced?}"
print_orders(tree)
