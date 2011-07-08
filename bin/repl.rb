#!/usr/bin/env ruby
$LOAD_PATH << (File.expand_path(File.dirname(__FILE__)) + '/../lib')

require 'rubygems'
require 'Shellwords'
require 'lucio'

QUIT = '.q'

module Lucio
  class Repl
    def self.run
exit = false

puts <<lisp
# lucio interactive console
-------------------------
# type a lucio expression and press ENTER
# type .q and press ENTER to exit

lisp
while !exit
  print 'lucio: '
  command = (gets).chomp
  parts = Shellwords.split(command)
  exit = (parts[0] == QUIT)
  unless exit
    begin
      print '=> '
      p Lucio.eval(command)
      puts ''
    rescue Exception => msg
      puts "Error: #{msg}"
    end
  end
end

puts '# bye!'
    end
  end
end
