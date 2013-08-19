# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'live_ast_ruby_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "live_ast_ruby_parser"
  spec.version       = LiveASTRubyParser::VERSION
  spec.authors       = ["James M. Lawrence", ]
  spec.email         = ["quixoticsycophant@gmail.com"]
  spec.description   = %q{This is the default RubyParser-based parser used by LiveAST}
  spec.summary       = %q{This is the default RubyParser-based parser used by LiveAST}
  spec.homepage      = "http://github.com/quiz/live_ast_ruby_parser"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby_parser", "~> 3.2.2"
  spec.add_dependency "ruby2ruby", "~> 2.0.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
