# ruby 2.7.2

class Parser
  def initialize(argv)
    @file = argv.first
  end

  def list_all_views; end

  def list_unique_views; end
end

x = Parser.new(ARGV)
# puts ARGV.first
puts x.instance_variable_get('@file')
