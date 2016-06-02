require 'rake'
require 'fileutils'

desc 'Hook our dotfiles into system-standard positions'
task :install => [:submodule_init, :submodules] do
  files = Dir.glob('{.zshrc,.zsh,.vimrc,.vim,.gvimrc,.screenrc,.tmux.conf,.tmux,.bashrc,.gemrc,.inputrc,.pryrc,.tigrc,.ackrc,.bundler,.emacs.d,.peco,.tmux-powerlinerc}')
  install_files(files)

  success_msg('installed')
end

task :submodule_init do
  run %{ git submodule update --init --recursive }
end

desc "Init and update submodules."
task :submodules do
  puts "======================================================"
  puts "Downloading dotfiles submodules...please wait"
  puts "======================================================"

  run %{
    git submodule update --recursive
    git clean -df
  }
  puts
end

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_files(files)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/#{file}" "$HOME/#{file}.backup" }
    end

    run %{ ln -nfs "#{source}" "#{target}" }

    puts "=========================================================="
    puts
  end
end

def success_msg(action)
  puts banner
  puts "dotfiles has been #{action}. Please restart your terminal and vim."
end

def banner
  <<-'EOS'.gsub(/^    /, '')
         _       _    __ _ _
      __| | ___ | |_ / _(_) | ___  ___
     / _` |/ _ \| __| |_| | |/ _ \/ __|
    | (_| | (_) | |_|  _| | |  __/\__ \
     \__,_|\___/ \__|_| |_|_|\___||___/

  EOS
end
