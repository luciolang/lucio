class Lucio
  def initialize(lexicon = Lexicon.new)
    @lexicon = lexicon
    @lexicon.add_function :+    , lambda{|items| items.reduce(0, :+)}
    @lexicon.add_function :*    , lambda{|items| items.reduce(1, :*)}
    @lexicon.add_function :true , lambda{ true }
    @lexicon.add_function :false, lambda{ false }
    @lexicon.add_function :eql? , lambda{|items| items.map{|item| item == items[0]}.reduce{|memo, item| memo && item}}
    @lexicon.add_macro    :let  , lambda{|lexicon, items| lexicon.add_function(items[0].to_sym, lambda{(items[1].kind_of? Array) ? evaluate_tree(items[1]) : items[1]})}
  end

  def eval(source_code)
    tree = Sparse.new.parse(source_code)
    ret = nil
    tree.each {|list| ret = evaluate_tree list}
    ret
  end

  private
  def evaluate_tree(tree)
    unless tree.empty?
      operator, list = Lucio.behead tree
      instruction = @lexicon.get operator

      if instruction
        if instruction[:type] == :function
          list.map! {|item| (item.kind_of? Array) ? item = evaluate_tree(item) : item}
          list.map! {|item| (item.kind_of? Symbol) ? item = @lexicon.get(item)[:code].call : item}

          instruction[:code].call list

        else
          instruction[:code].call @lexicon, list

        end

      else
        raise UnboundSymbolException.new "Unbound symbol #{operator.to_s}"

      end

    end
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end
end

class UnboundSymbolException < Exception
end
