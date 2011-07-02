require 'spec_helper'
require 'lucio'

describe Lucio do

	context "list" do
	  it "integer" do
  	  Lucio.parse('(2)').should be
	  end

	  it "integers" do
  	  Lucio.parse('(2)(3)').should be
	  end

	  it "decimal" do
  	  Lucio.parse('(3.14)').should be
	  end

	  it "valid string" do
  	  Lucio.parse('("this is a text")').should be
	  end

	  it "invalid string" do
  	  Lucio.parse('(this is a text)').should_not be
	  end

    it "boolean" do
      Lucio.parse('(true)').should be
  	  Lucio.parse('(true)').should be
  	  Lucio.parse('(true)(false)').should be

      Lucio.parse('true').should_not be
  	  Lucio.parse('false').should_not be
	  end

    it 'null'  do
      Lucio.parse('(null)').should be

      Lucio.parse('null').should_not be
      Lucio.parse('nullus').should_not be
    end

    it 'space' do
      Lucio.parse('()').should be
      Lucio.parse('( )').should be
      Lucio.parse('(  )').should be
    end

    it 'simple expression' do
      Lucio.parse('(+ 1 2)').should be
    end

    it 'long expression' do
      Lucio.parse('(+ 1 2 3 4)').should be
    end

    it 'composed expression' do
      Lucio.parse('(+ 1 (* 2 3))').should be
    end

    it 'composed long expression' do
      Lucio.parse('(+ 1 2 3 (* 4 5 6))').should be
    end

    it 'and now we return to begin' do
      Lucio.parse('(* (+ 1 2) 3)').should be

      Lucio.parse('(/ (* (+ 1 2)(+ 3 4)) 2)').should be
    end

    it 'special caracters should work to improve the expressiveness' do
      Lucio.parse('(eql? (* (+ 1 2) 3) 9)').should be
      Lucio.parse('(eql?? (* (+ 1 2) 3) 9)').should_not be

      Lucio.parse('(foo-bar (1 1 2 3 4 4))').should be
      Lucio.parse('(foo-bar-meh (1 1 2 3 4 4))').should be

      Lucio.parse('(foo--bar (1 1 2 3 4 4))').should_not be
      Lucio.parse('(foo----- (1 1 2 3 4 4))').should_not be
      Lucio.parse('(foo--bar-meh (1 1 2 3 4 4))').should_not be
    end

    it 'multiline' do
      code = <<lisp
(/
  (*
    (+ 1 2)
    (+ 3 4)
  )
2)
lisp

      Lucio.parse(code, true).should be
    end

  end

end

