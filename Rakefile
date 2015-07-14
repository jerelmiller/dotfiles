require 'rake'

desc 'Install dotfiles to home directory'
task :install do
  add_dotfiles
  add_binstubs

  puts "Making .tmp directory"
  system %Q(mkdir -p "$HOME/.tmp")
end

def add_dotfiles
  Dir['*'].each do |file|
    next if %w(Rakefile bin).include? file

    if exists? file
      print "overwrite ~/.#{file}? [ynq] "

      case $stdin.gets.chomp
      when 'y' then replace_file(file)
      when 'q' then exit
      else puts "skipping ~/.#{file}"
      end
    else
      link_file(file)
    end
  end
end

def add_binstubs
  Dir['bin/*'].each do |file|
    filename = File.basename file
    print "add script for #{filename} in /usr/local/bin? [ynq] "

    case $stdin.gets.chomp
    when 'y' then %Q(ln -s "$PWD/bin/#{filename}" "/usr/local/bin/#{filename}")
    when 'q' then exit
    else puts "skipping #{filename}"
    end
  end
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
