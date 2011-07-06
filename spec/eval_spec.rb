require 'spec_helper'
require 'lucio'

describe Lucio do
  context 'eval' do
    it 'fails' do
      # Lucio.eval('()').should == nil
      Lucio.eval('( )')
      Lucio.eval('(+ 1 2)')
      Lucio.eval('(* 2 (+ 3 4))')
    end
  end
end
