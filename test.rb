require_relative 'lib/node'
require_relative 'lib/tree'

# tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 10])
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
