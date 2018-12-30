begin
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
  input_history = RUBY_VERSION > "2.5" ? :input_ring : :input_array
  Pry.config.prompt = [
    proc {|target_self, nest_level, pry|
      "[#{pry.send(input_history).size}] " + sprintf("pry(%s-p%s)> ", RUBY_VERSION, RUBY_PATCHLEVEL)
    },
    proc {|target_self, nest_level, pry|
      "[#{pry.send(input_history).size}] " + sprintf("pry(%s-p%s)* ", RUBY_VERSION, RUBY_PATCHLEVEL)
    }
  ]
rescue LoadError
  puts "no awesome_print😢"
end

Pry.config.correct_indent = false
Pry.config.auto_indent = false
