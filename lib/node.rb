class Node
  include Comparable
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <=>(other)
    value <=> other.value
  end
end
