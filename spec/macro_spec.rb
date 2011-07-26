require 'spec_helper'

describe Lucio do
  context 'macros' do
    before :each do
      @lucio = Lucio.new
    end

    it 'simple if implementation' do
      macro = '
(defmacro my-if
  ([test? truey falsey]
    `(if test? truey falsey)))'

      code_true = '
(my-if (eql? 1 1)
  (true)
  (false))'

      code_false = '
(my-if (eql? 1 2)
  (true)
  (false))'
      
      @lucio.eval(macro + code_true)
      # @lucio.eval(macro + code_true).should be_true

      # p @lucio.eval(macro + code_false)
      # @lucio.eval(macro + code_false).should be_false
    end
  end
end
