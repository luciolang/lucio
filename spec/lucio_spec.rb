require 'lucio'

describe Lucio::Parser do
  it "empty file" do
    stack = Lucio::Parser.parse("")
    stack.size.should == 0
  end

  it "empty code  with brackets" do
    stack = Lucio::Parser.parse("()")
    stack.size.should == 0
  end

  it "single value without brackets" do
    stack = Lucio::Parser.parse("2")
    stack.size.should == 1
  end

  it "single value with brackets" do
    stack = Lucio::Parser.parse("(2)")
    stack.size.should == 1
  end

  it "simple addition without brackets" do
    stack = Lucio::Parser.parse("+ 1 2")
    stack.size.should == 3
  end

  it "simple addition with brackets" do
    stack = Lucio::Parser.parse("(+ 1 2)")
    stack.size.should == 3
  end

  it "an equation with two signals" do
    stack = Lucio::Parser.parse("(* (+ 1 2) 3)")
    stack.size.should == 5
  end

  it "an equation with three signals" do
    stack = Lucio::Parser.parse("/ (* (+ 1 2)(+ 3 4)) 2")
    stack.size.should == 9
  end
end

describe Lucio::Runner do
  
end
