require 'ruby2ruby'

module LiveASTRubyParser::Unparser
  class << self
    # Whether the unparsed code matches ruby2ruby output.
    def ruby2ruby?
      true
    end
    
    # Return a ruby source string which reflects the given AST.
    def unparse(sexp)
      Ruby2Ruby.new.process(sexp)
    end
  end
end
