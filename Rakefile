require 'rake'

FILE_MAP = {}.tap do |map|
  Dir['home/**/*'].each do |file|
    real_file = '~/.' + file.gsub(/home\//, '')
    if File.directory?(file)
      %x[mkdir -p #{real_file}]
    else
      map[file] = real_file
    end
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

  # system "apm stars --install"
end

desc "Automatically commit changes to existing files, notifiy if new files need to be manually committed."
task :update do
  status = %x[git status]
  case status
  when /Untracked files/
    notify "Untracked files present"
  when /working directory clean/
    # Do nothing.
  else
    notify "Committing changes"
    %x[git add -u && git commit -m "Update\nAutomatic commit."]
    pull = %x[git pull]
    if pull =~ /Automatic merge failed/
      notify "Merge conflict"
    else
      push = %x[git push origin]
      if push =~ /rejected/
        notify "Failed to push"
      end
    end
  end
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

def notify(msg)
  unless system %[/usr/local/bin/terminal-notifier -message "#{msg}" -title "~/.etc" -activate com.apple.Terminal -group dotfiles]
    %x[osascript -e 'tell app "System Events" to display dialog "#{msg} (PS: install terminal-notifier, dummy)"']
  end
end
