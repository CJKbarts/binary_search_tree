require_relative 'lib/node'
require_relative 'lib/tree'

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.pretty_print
puts

print 'Enter num to insert: '
tree.insert(gets.chomp.to_i)
tree.pretty_print
puts

print 'Enter num to delete: '
tree.delete(gets.chomp.to_i)
tree.pretty_print
puts

print 'Enter a value to get its node: '
p tree.find(gets.chomp.to_i)
puts

print 'Iterative level order: '
tree.level_order { |node| print "#{node.value} " }
puts
print 'Recursive level order: '
tree.level_order_rec { |node| print "#{node.value} " }
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
