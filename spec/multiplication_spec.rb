require 'spec_helper'
require 'lucio'

describe Lucio::Operator::Multiplication do
  it "an empty list should return zero" do
    Lucio.eval('(*)').should == 0
  end

  it "a list with one item should return that item" do
    Lucio.eval('(* 1)').should == 1
    Lucio.eval('(* 2)').should == 2
  end

  it "a list with more than one item should eval all items" do
    Lucio.eval('(* 2 3)').should == 6
    Lucio.eval('(* 2 3 4)').should == 24
  end

end
