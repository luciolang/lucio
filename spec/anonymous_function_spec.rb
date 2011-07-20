require 'spec_helper'

describe Lucio do
  context 'anonymous function' do
    before :each do
      @lucio = Lucio.new
    end

    it 'without parameters' do
      code = '
(let boo 
  (fn()
    (42)))
(boo)'
      @lucio.eval(code).should == 42
    end

    it 'without parameters with calculation' do
      code = '
(let foo 
  (fn()
    (* 3 5 7)))
(foo)'
      @lucio.eval(code).should == 105
    end

    it 'with one parameter' do
      code = '
(let double
  (fn(x)
    (* x 2)))
(double 13)'
      @lucio.eval(code).should == 26
    end

  end
end
