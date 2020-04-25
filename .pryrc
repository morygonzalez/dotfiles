begin
  require 'awesome_print'
rescue LoadError
  puts "no awesome_print😢"
end

Pry.config.correct_indent = false
Pry.config.auto_indent = false
