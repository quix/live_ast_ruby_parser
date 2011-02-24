require_relative 'devel/jumpstart'

Jumpstart.new "live_ast_ruby_parser" do |s|
  s.developers << ["James M. Lawrence", "quixoticsycophant@gmail.com"]
  s.github_user = "quix"
  s.version = "0.5.1"
  s.description = s.summary

  # my code compensates for a ruby_parser bug; make this equal for now
  s.dependencies << ["ruby_parser", "= 2.0.6"]

  s.dependencies << ["ruby2ruby"]
end

# testing done inside live_ast
task :test do
end

