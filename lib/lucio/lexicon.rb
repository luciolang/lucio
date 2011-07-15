require 'lucio/operators'

module Lucio
  class Lexicon
    def initialize
      fill_operator_list
    end

    def get(operator)
      ret = @operator_list[operator]
    end

    private
    def fill_operator_list
      @operator_list = {}
      @operator_list['+']     = Operator::Sum.new
      @operator_list['*']     = Operator::Multiplication.new
      @operator_list['/']     = Operator::Division.new
      @operator_list['-']     = Operator::Subtraction.new
      @operator_list['eql?']  = Operator::Equality.new
      @operator_list['if']    = Operator::Conditional.new
      @operator_list['let']   = Operator::Attribution.new
    end
  end
end
