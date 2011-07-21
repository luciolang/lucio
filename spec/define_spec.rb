require 'spec_helper'

describe Lucio do
  context 'define' do
    before :each do 
      @lucio = Lucio.new
    end

    it 'should define x' do
      code = '
(define x 10)
(eql? x 10)'
      @lucio.eval(code).should be_true
    end

    it 'should define x as a arithmetic operation' do
      code = '
(define x (* 10 2))
(eql? x 20)'
      @lucio.eval(code).should be_true
    end

    it 'should define x as a comparison result' do
      code = '(define result (eql? (* 10 2) 20)) (result)'
      @lucio.eval(code).should be_true
    end

  end
end
