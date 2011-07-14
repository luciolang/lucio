require 'spec_helper'
require 'lucio'

describe "All the fun" do
  it "should have all the fun" do
    Lucio.literal("'(lisp programmers have all defun)").should == '(lisp programmers have all defun)'
  end

  it "should work too =P" do
    Lucio.literal("'(a b c)").should == '(a b c)'
  end

  it "should work with numbers" do
    Lucio.literal("'(1 2 3)").should == '(1 2 3)'
  end

  it "should work with mixed values too" do
    Lucio.literal("'(a b c 1 2 3)").should == '(a b c 1 2 3)'
  end

end
