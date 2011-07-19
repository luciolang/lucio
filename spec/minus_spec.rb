require 'spec_helper'

describe Lucio do
  context 'minus' do
    before :each do
      @lucio = Lucio.new
    end

    it 'without parameters should return zero' do
      @lucio.eval('(- )').should == 0
    end

    it 'with one value should return that value' do
      @lucio.eval('(- 3)').should == -3
    end

    it 'with two values should return the subtraction' do
      @lucio.eval('(- 3 5)').should == -2
      @lucio.eval('(- 5 3)').should == 2
    end

    it 'with nested lists should eval the list before return the sum' do
      @lucio.eval('(- 5 (- 3 2))').should == 4
    end

  end
end
