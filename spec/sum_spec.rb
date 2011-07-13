require 'spec_helper'
require 'lucio'

describe Lucio::Operator::Sum do
  it "an empty list should return zero" do
    Lucio.eval('(+)').should == 0
  end

  it "a list with one item should return that item" do
    Lucio.eval('(+ 1)').should == 1
    Lucio.eval('(+ 2)').should == 2
  end

  it "a list with more than one item should eval all items" do
    Lucio.eval('(+ 1 2)').should == 3
    Lucio.eval('(+ 1 2 3)').should == 6
  end

end
