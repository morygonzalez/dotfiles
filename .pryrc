begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
  Pry.config.prompt = [
    proc { |target_self, nest_level, pry|
      "[#{pry.input_array.size}] " + sprintf("pry(%s-p%s)> ", RUBY_VERSION, RUBY_PATCHLEVEL)
    },
    proc { |target_self, nest_level, pry|
      "[#{pry.input_array.size}] " + sprintf("pry(%s-p%s)* ", RUBY_VERSION, RUBY_PATCHLEVEL)
    }
  ]
rescue LoadError => err
  puts "no awesome_print :("
end
