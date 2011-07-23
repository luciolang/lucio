require 'spec_helper'

describe Lucio do
  context 'anonymous function' do
    before :each do
      @lucio = Lucio.new
    end

    it 'syntax error' do
      code = '(fun 2)'
      lambda { @lucio.eval(code) }.should raise_error SyntaxError
    end

    it 'declaration without parameters' do
      code = '(fun ([] (42)))'
      lambda {@lucio.eval(code) }.should_not raise_error
    end

    it 'execute declaration without parameters' do
      code = '((fun ([] (+ 1 12))))'
      @lucio.eval(code).should == 13
    end

    it 'execute declaration with one parameter' do
      code = '((fun ([x] (+ x 12))) 11)'
      @lucio.eval(code).should == 23
    end

    it 'execute declaration with two different signatures' do
      code = '
(fun 
 ([] 
  (42))
 ([x] 
  (+ x 12))
 ([x y] 
  (* x y)))'
      @lucio.eval("(#{code})").should == 42
      @lucio.eval("(#{code} 23)").should == 35
      @lucio.eval("(#{code} 7 8)").should == 56
    end

=begin
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
    it 'currying' do
      code = '
(let adder
  (fn (x)
    (fn (y)
      (+ x y))))

(let add5
  (fn(x)
    (adder 5)))

(add5 10)'
      p @lucio.eval code

    end
=end
=begin
    it 'with a named function as parameter' do
      code = "
(let operate
  (fn (operation x y)
    (operation x y)))

(let add
  (fn (x y)
    (+ x y)))

(let add5
  (fn (x)
    (add x 5)))

(operate add5 2)"

      p 'result', @lucio.eval(code)
    end
=end
  end
end
