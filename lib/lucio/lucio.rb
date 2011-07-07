require 'polyglot'
require 'treetop'
require 'lucio_syntax'

module Lucio
  def self.parse(str, debug = false)
    parser = LucioParser.new
    result = parser.parse str

    puts "\n#{parser.failure_reason}" unless result || !debug

    result
  end

  def self.eval(str)
    parse(str).eval
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end
end
