require 'lucio/statement_list'
require 'lucio/parser'
require 'lucio/lexicon'
require 'lucio/runner'

module Lucio
  def self.parse(str)
    return Parser.parse str
  end

  def self.run(list)
    return Runner.run list
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end
end
