#!/usr/bin/ruby
# ruby 2.7.2

require 'optparse'
require_relative 'interface'
class Parser
  class << self
    def all_views(log)
      File.open(log) do |f|
        f.each_with_object(Hash.new(0)) do |line, hash|
          path, ip = line.split(' ')
          hash[path] += 1
        end.sort_by { |_k, v| -v }
      end
    end

    def unique_views(log)
      views = File.open(log) do |f|
        f.each_with_object({}) do |line, hash|
          path, ip = line.split(' ')
          hash[path] ||= []
          hash[path] << ip unless hash[path].include? ip
        end
      end
      views.each { |k, v| views[k] = v.size }.sort_by { |_k, v| -v }
    end

    def list_all_views(log)
      puts 'List of webpages with most page views:'
      all_views(log).each_with_index do |pair, i|
        puts "#{i + 1}. #{pair[0]} ".ljust(20, '.') + "#{pair[1]} views"
      end
    end

    def list_unique_views(log)
      puts 'List of webpages with most unique page views:'
      unique_views(log).each_with_index do |pair, i|
        puts "#{i + 1}. #{pair[0]} ".ljust(20, '.') + "#{pair[1]} unique views"
      end
    end
  end
end

options = Interface.get_opt(ARGV)

Parser.list_all_views(options[:file]) if options[:all]
Parser.list_unique_views(options[:file]) if options[:uniq]
