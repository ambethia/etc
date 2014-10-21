require 'rake'

FILE_MAP = {}.tap do |map|
  Dir['home/**/*'].each do |file|
    real_file = '~/.' + file.gsub(/home\//, '')
    if File.directory?(file)
      %x[mkdir -p #{real_file}]
    else
      map[file] = real_file
    end
    map['vim'] = '~/.vim'
    map['atom'] = '~/.atom'
  end
end

desc "Install the dot files into home directory"
task :install do
  replace_all = false
  FILE_MAP.each do |source, target|
    if File.exist?(File.expand_path(target))
      if File.identical? source, File.expand_path(target)
        # puts "identical #{target}"
      elsif replace_all
        replace_file(source, target)
      else
        print "overwrite #{target}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(source, target)
        when 'y'
          replace_file(source, target)
        when 'q'
          exit
        else
          puts "skipping #{target}"
        end
      end
    else
      link_file(source, target)
    end
  end

  system "apm stars --install"
end

task :default => :install

def replace_file(source, target)
  system %Q{rm -rf #{File.expand_path(target)}}
  link_file(source, target)
end

def link_file(source, target)
  puts "linking #{target}"
  system %Q{ln -s "$PWD/#{source}" "#{File.expand_path(target)}"}
end
