class Interface
  def self.get_opt(args)
    options = {}

    opts = OptionParser.new do |opts|
      opts.banner = 'Usage: parser.rb [options]'

      opts.on('-f', '--file FILE', 'Specify log file') do |file|
        options[:file] = file
      end

      opts.on('-a', '--all', 'List all views') do
        options[:all] = true
      end

      opts.on('-u', '--uniq', 'List unique views') do
        options[:uniq] = true
      end

      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        exit
      end
    end.parse(args)

    options
  end
end
