require 'spec_helper'
require 'lucio'

describe Lucio do

  context 'empty list' do
    it 'should return nil' do
      Lucio.eval('()').should == nil
      Lucio.eval('( )').should == nil
      Lucio.eval('(  )').should == nil
    end
  end
  
  context 'sum operation' do
    it 'should return a numeric value' do
      Lucio.eval('(1)').should == 1
      Lucio.eval('(+ 1 2)').should == 3
      Lucio.eval('(+ 1 2 3 4 5 6)').should == 21
      Lucio.eval('(+ 1 (+ 2 3))').should == 6
    end
  end

  context 'more than one type of operation' do
    it 'should return a numeric value' do
      Lucio.eval('(/ (* (+ 1 2) (+3 4)) 2)').should == 10.5
      Lucio.eval('(- 10.5 (/ (* (+ 1 2) (+3 4)) 2))').should == 0
    end
  end

  context 'builtin function' do
    it 'compare two values using a function' do
      Lucio.eval('(eql? (* (+ 1 2) 3) 9)').should be_true
      Lucio.eval('(eql? (/ (* (+ 1 2) (+3 4)) 2) 10)').should be_false
      Lucio.eval(<<lisp
(eql? 
  (/ 
    (* 
      (+ 1 2) 
      (+3 4)) 
    2) 
  10)
lisp
).should be_false
    end
  end
end
