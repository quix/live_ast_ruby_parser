
require 'ruby2ruby'

module LiveAST::Parser::Unparser
  # Whether the unparsed code matches ruby2ruby output.
  def self.ruby2ruby?
    true
  end

  # Return a ruby source string which reflects the given AST.
  def self.unparse(sexp)
    Ruby2Ruby.new.process(sexp)
  end
end
