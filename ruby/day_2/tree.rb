class Tree
  attr_accessor :children, :node_name

  def initialize(node_name, children)
    @node_name = node_name
    @children = children.map {|k,v| Tree.new(k,v)}
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

=begin
ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])
=end

treeHash = {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}
ruby_tree = Tree.new('Family Tree', treeHash)

puts 'visiting node'
ruby_tree.visit {|node| puts node.node_name}
puts

puts 'visiting entire tree'
ruby_tree.visit_all {|node| puts node.node_name}

