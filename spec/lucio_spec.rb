require 'lucio'

describe Lucio::Runner do
  it "should return head and tail" do
    h, t = Lucio.behead [1, 2, 3, 4, 5]
    h.should == 1
    t.should == [2, 3, 4, 5]
  end
end

