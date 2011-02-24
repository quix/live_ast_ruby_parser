require 'ruby2ruby'

#
# Used by +to_ruby+ in LiveAST.
#
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
