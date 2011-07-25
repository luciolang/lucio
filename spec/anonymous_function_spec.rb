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

    it 'should raise ArgumentError if the number of arguments is invalid' do
      code = '((fun ([] (42))) 1)'
      lambda {@lucio.eval(code) }.should raise_error ArgumentError

      code = '((fun ([x] (x))))'
      lambda {@lucio.eval(code) }.should raise_error ArgumentError

    end

    it 'bind function to a symbol' do
      code = '
(define answer (fun ([] (42))))
(answer)'
      @lucio.eval(code).should == 42
    end

    it 'bind function with parameter to a symbol' do
      code = '
(define double (fun ([x] (* x 2))))
(double 19)'
      @lucio.eval(code).should == 38
    end

    it 'using function as parameter - the ugly way' do
      code = '
; first function receives another function and two values
; second function returns the average of two values
((fun 
  ([op v1 v2]
   (op v1 v2))) 
 (fun
  ([a b]
   (/ (+ a b) 2))) 3 5)
'
      @lucio.eval(code).should == 4
    end

    it 'using function as parameter - the clear way' do
      code = '
; first function receives another function and two values
; second function returns the average of two values
(define calculate
  (fun 
   ([op v1 v2]
    (op v1 v2))))

(define average
  (fun
   ([a b]
    (/ (+ a b) 2))))

(calculate average 3 5)
'
      @lucio.eval(code).should == 4
    end

=begin
 Write tests with
 - recursion
 - currying
=end

  end
end
