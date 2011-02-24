require 'ruby_parser'
require 'sexp_processor'

module LiveAST
  class Parser < SexpProcessor
    # Whether this is Ryan Davis' unified sexp format.
    def self.unified?
      true
    end

    # Output an AST corresponding to a ruby source string.
    def parse(source)
      @defs = {}
      process RubyParser.new.parse(source)
      @defs
    end

    def process_defn(sexp)
      result = Sexp.new
      result << sexp.shift
      result << sexp.shift
      result << process(sexp.shift)
      result << process(sexp.shift)

      store_sexp(result, sexp.line)
      s()
    end

    def process_iter(sexp)
      line = sexp[1].line

      result = Sexp.new
      result << sexp.shift
      result << process(sexp.shift)
      result << process(sexp.shift)
      result << process(sexp.shift)

      #
      # ruby_parser bug: a method without args attached to a
      # multi-line block reports the wrong line. workaround.
      #
      if result[1][3].size == 1
        line = sexp.line
      end

      store_sexp(result, line)
      s()
    end

    def store_sexp(sexp, line)
      @defs[line] = @defs.has_key?(line) ? :multiple : sexp
    end
  end
end

LiveAST::Parser.autoload :Unparser, 'live_ast_ruby_parser/unparser'
LiveAST::Parser.autoload :TestForms, 'live_ast_ruby_parser/test_forms'
