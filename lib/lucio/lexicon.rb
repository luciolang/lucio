require 'lucio/operators'

module Lucio
  class Lexicon
    @@operator_list = nil

    def self.get(operator)
      fill_operator_list unless @@operator_list
      @@operator_list[operator]
    end

    private
    def self.fill_operator_list
      @@operator_list = {}
      @@operator_list['+'] = Operator::Add.new
    end
  end
end
