require 'spec_helper'

describe Lucio do
  context 'anonymous function' do
    before :each do
      @lucio = Lucio.new
    end

    it 'without parameters' do
      code = '
(let boo 
  (fn ()
    (42)))
(boo)'
      @lucio.eval(code).should == 42
    end

    it 'without parameters with calculation' do
      code = '
(let foo 
  (fn ()
    (* 3 5 7)))
(foo)'
      @lucio.eval(code).should == 105
    end

    it 'with one parameter' do
      code = '
(let double
  (fn (x)
    (* x 2)))
(double 13)'
      @lucio.eval(code).should == 26
    end

    it 'with two parameters and calculation' do
      code = '
(let product
  (fn (x y)
    (* x y)))
(product 3 5)'
      @lucio.eval(code).should == 15
    end

    it 'with two parameters and nested calculation' do
      code = '
(let average
  (fn (x y)
    (/ (+ x y) 2)))
(average 3 5)'
      @lucio.eval(code).should == 4
    end

    it 'with recursion' do
      code = '
(let dec
  (fn (x)
    (- x 1)))

(let factorial
  (fn (x)
    (if (lt x 2)
      (1)
      (* x (factorial (dec x))))))

(factorial 5)'
      @lucio.eval(code).should == 120
    end
=begin
    it 'with a named function as parameter' do
      code = "
(let operate
  (fn (operation x y)
    (operation x y)))

(let add
  (fn (x y)
    (+ x y)))

(operate add 2 3)"

      p @lucio.eval code
    end
=end
  end
end
