require 'rake'

desc 'Install dotfiles to home directory'
task :install do
  Dir['*'].each do |file|
    next if %w(Rakefile).include? file 

    if exists? file
      print "overwrite ~/.#{file}? [ynq]"

      case $stdin.gets.chomp
      when 'y' then replace_file(file)
      when 'q' then exit
      else puts "skipping ~/.#{file}"
      end
    else
      link_file(file)
    end
  end

  puts "Making .tmp directory"
  system %Q(mkdir -p "$HOME/.tmp")
end


def exists?(file)
  File.exists? File.join(ENV['HOME'], ".#{file}")
end

def replace_file(file)
  system %Q(rm "$HOME/.#{file}")
  link_file file
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q(ln -s "$PWD/#{file}" "$HOME/.#{file}")
end
