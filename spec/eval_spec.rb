require 'spec_helper'
require 'lucio'

describe Lucio do
  context 'eval' do
    it 'should return a value' do
      Lucio.eval('()').should == nil
      Lucio.eval('( )').should == nil
      Lucio.eval('(  )').should == nil
      Lucio.eval('(1)').should == 1
      Lucio.eval('(+ 1 2)').should == 3
      Lucio.eval('(+ 1 2 3 4 5 6)').should == 21
      # Lucio.eval('(* 2 (+ 3 4))')
    end
  end
end
