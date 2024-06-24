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

print 'Printing with iterative level order: '
tree.level_order { |node| print "#{node.value} " }
puts
print 'Printing with recursive level order: '
tree.level_order_rec { |node| print "#{node.value} " }
puts
