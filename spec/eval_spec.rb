require 'spec_helper'
require 'lucio'

describe Lucio do
  context 'eval' do
    it 'should return a value' do
      Lucio.eval('()').should == nil
      Lucio.eval('( )').should == nil
      Lucio.eval('(  )').should == nil
      Lucio.eval('(1)').should == 1
      Lucio.eval('(+ 1 2)')
      Lucio.eval('(* 2 (+ 3 4))')
    end
  end
end
