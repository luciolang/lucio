require 'spec_helper'
require 'lucio'

describe 'Var' do
  it 'should store some value' do
    code = <<lisp
((let x 3)
 (x))
lisp

    p Lucio.eval(code)
  end
end
