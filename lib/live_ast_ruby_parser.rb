require 'ruby_parser'
require 'sexp_processor'
require 'live_ast/base'

class LiveASTRubyParser < SexpProcessor
  VERSION = "0.6.0"

  #
  # Returns a line-to-sexp hash where sexp corresponds to the method
  # or block defined at the given line.
  #
  # This method is the only requirement of a LiveAST parser plugin.
  #
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
    # http://rubyforge.org/tracker/index.php?func=detail&aid=28940&group_id=439&atid=1778
    #
    if result[1][3].size == 1
      line = sexp.line
    end

    store_sexp(result, line)
  end

  def store_sexp(sexp, line)
    @defs[line] = @defs.has_key?(line) ? :multiple : sexp
    sexp
  end
end

LiveASTRubyParser.autoload :Unparser, 'live_ast_ruby_parser/unparser'
LiveASTRubyParser.autoload :Test, 'live_ast_ruby_parser/test'

LiveAST.parser = LiveASTRubyParser
