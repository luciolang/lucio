require 'spec_helper'
require 'lucio'

describe Lucio do
  it "should return head and tail" do
    h, t = Lucio.behead [1, 2, 3, 4, 5]
    h.should == 1
    t.should == [2, 3, 4, 5]
  end

  it "should return empty tail" do
    h, t = Lucio.behead [1]
    h.should == 1
    t.should == []
  end

  it "should handle empty collections" do
    h, t = Lucio.behead []
    h.should == nil
    t.should == [] 
  end
  
  
end

