require_relative 'lib/node'
require_relative 'lib/tree'
require 'pry-byebug'

# tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree = Tree.new([1, 2, 3, 4, 5, 6, 7])
tree.pretty_print

tree.insert_rec(10)
tree.pretty_print
