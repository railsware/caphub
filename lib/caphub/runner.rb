require 'optparse'
require 'fileutils'

module Caphub
  class Runner
    class << self
      def run
        runner = new(ARGV)
        runner.parse_options!
        runner.run!
      end
    end

    def initialize(args)
      @args = args.dup
      @options = { cap: 3 }
    end

    attr_reader :options

    def parse_options!
      OptionParser.new do |opts|
        opts.banner = "Usage: #{File.basename($0)} [path]"
        opts.on("-c", "--cap", "Capistrano version 2 or 3") { |v| options[:cap] = v }
        opts.on_tail("-h", "--help", "Show this message") { puts opts; exit }
        opts.on_tail('-v', '--version', "Show version")   { puts Caphub::VERSION; exit }

        begin
          opts.parse!(ARGV)
        rescue OptionParser::ParseError => e
          warn e.message
          puts opts
          exit 1
        end
      end

      abort "Please specify the directory for capistrano hub" if @args.empty?
      abort "'#{@args.first}' exists." if File.exists?(@args.first)

      @options[:target] = @args.first
    end

    def skeleton_dir
      File.expand_path("../../../skeletons/cap#{options[:cap]}", __FILE__)
    end

    def run!
      target = options[:target]

      puts "Creating directory #{target}"
      FileUtils.mkdir(target)

      puts "Creating capistrano skeleton in #{target}"
      FileUtils.cp_r("#{skeleton_dir}/.", target)

      puts "Initializating git repository in #{target}"
      Dir.chdir(target) { `git init`;  `git add .` }
    end
  end
end
