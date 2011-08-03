require 'spec_helper'

describe Lucio do
  context 'macros' do
    before :each do
      @lucio = Lucio.new
    end

    it 'simple if implementation' do
      macro = '
(defmacro my-if
  ([test? truey falsey]
    `(if test? truey falsey)))'

      code_true = '
(my-if (eql? 1 1)
  (true)
  (false))'

      code_false = '
(my-if (eql? 1 2)
  (true)
  (false))'

      @lucio.eval(macro + code_true).should be_true

      @lucio.eval(macro + code_false).should be_false
    end

    it 'simple if implementation with variable = true' do
      code = <<-LISP
(defmacro my-if
  ([test? truey falsey]
    `(if test? truey falsey)))

(define x true)

(my-if (x)
  (true)
  (false))

LISP
        @lucio.eval(code).should be_true
      end

    it 'simple if implementation with variable = false' do
      code = <<-LISP
(defmacro my-if
  ([test? then truey else falsey end]
    `(display test?)(if test? truey falsey)))

(define x false)

(my-if (x) then
  ((display "noooooooooo")
  (true))
else
  ((display "yes!")
  (false))
end)

LISP

        @lucio.eval(code).should be_false

      end

  end

end
