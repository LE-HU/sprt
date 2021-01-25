# ruby 2.7.2

class LogParser
  def initialize(file)
    @log_data = File.read(file)
  end

  def list_all_views
    @log_data.split("\n").each_with_object(Hash.new(0)) do |line, hash|
      path, ip = line.split(' ')
      hash[path] += 1
    end
  end

  def list_unique_views
    views = @log_data.split("\n").each_with_object({}) do |line, hash|
      path, ip = line.split(' ')
      hash[path] ||= []
      hash[path] << ip unless hash[path].include? ip
    end
    views.each { |k, v| views[k] = v.size }
  end
end

x = LogParser.new(ARGV[0])
pp x.list_all_views
pp x.list_unique_views
