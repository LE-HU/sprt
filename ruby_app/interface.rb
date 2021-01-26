class Interface
  def self.get_opt(args)
    options = {}
    opts = OptionParser.new do |opts|
      opts.on('-f', '--file FILE' 'Log file') do |file|
        options[:file] = file
      end

      opts.on('-a', 'List all views') do
        options[:all] = true
      end

      opts.on('-u', 'List unique views') do
        options[:uniq] = true
      end
    end.parse(args)

    options
  end
end
