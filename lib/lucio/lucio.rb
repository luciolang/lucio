class Array
  def to_sym
    to_s.to_sym
  end
end

class Object
  def is_array?
    kind_of? Array
  end

  def is_hash?
    kind_of? Hash
  end

  def is_symbol?
    kind_of? Symbol
  end

end

class Lucio
  def initialize(lexicon = Lexicon.new)
    @lexicon = lexicon
    @lexicon.add_function :+      , lambda{|lexicon, items| items.reduce(0, :+)}
    @lexicon.add_function :*      , lambda{|lexicon, items| items.reduce(1, :*)}
    @lexicon.add_function :-      , lambda{|lexicon, items| case when items.size == 0; 0; else; head, tail = Lucio.behead(items); tail.empty? ? (head * -1) : tail.inject(head) {|subtraction, item| subtraction -= item}; end}
    @lexicon.add_function :/      , lambda{|lexicon, items| case when items.size == 0; raise 'expects at least 1 arguments, given 0'; when items.size == 1; 1.0 / items[0]; else items.reduce{|result, item| result = result / item.to_f}; end}
    @lexicon.add_function :true   , lambda{|lexicon, items| true }
    @lexicon.add_function :false  , lambda{|lexicon, items| false }
    @lexicon.add_function :eql?   , lambda{|lexicon, items| items.map{|item| item == items[0]}.reduce{|memo, item| memo && item}}
    @lexicon.add_function :lt     , lambda{|lexicon, items| items[0] < items[1]}
    @lexicon.add_function :display, lambda{|lexicon, items| puts ">>>>>>>>>#{items.first}<<<<<<<<<<<<" unless items.empty?}

    @lexicon.add_macro    :define , lambda{|lexicon, items| define lexicon, items }
    @lexicon.add_macro    :if     , lambda{|lexicon, items| Evaluator.evaluate_tree(items[0], lexicon) ? Evaluator.evaluate_tree(items[1], lexicon) : Evaluator.evaluate_tree(items[2], lexicon) }
    @lexicon.add_macro    :fun    , lambda{|lexicon, items| lexicon.add_function items.to_sym, Function.new(items, lexicon) }
  end

  def eval(source_code)
    tree = Sparse.new.parse(source_code)
    ret = nil
    tree.each {|list| ret = Evaluator.evaluate_tree(list, @lexicon)}
    ret
  end

  def self.behead(list)
    [list.first, list.drop(1)]
  end
      
  private
  def define(lexicon, items)
    lmb = lambda do |lexicon, it|
      if items[1].is_array?
        Evaluator.evaluate_tree(items[1], @lexicon)
      else
        items[1]
      end
    end

    lexicon.add_function(items[0].to_sym, lmb)
  end
end

class UnboundSymbolException < Exception
end
