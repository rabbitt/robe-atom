#!/usr/bin/env ruby

robe_lib_path = File.realpath(File.join(ARGV[0].gsub('~', ENV['HOME']), 'lib'))

unless defined? Robe
  $LOAD_PATH.unshift(robe_lib_path)
  require 'robe'
end
p Robe.start(0)

# override Robe's signal trapping
%w(INT TERM).each do |signal|
  trap(signal) { exit }
end

# wait until EOF (= parent exit)
STDIN.each_line {}
