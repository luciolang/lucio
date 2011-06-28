require 'lucio/lexicon'
require 'lucio/runner'
require 'polyglot'
require 'treetop'
require 'lucio_syntax'

module Lucio
  def self.parse(str)
    return LucioParser.new.parse str
  end

  def self.run(list)
    return Runner.run list
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end
end

