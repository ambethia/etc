require 'rake'

FILE_MAP =
  {}.tap do |map|
    files =
      Dir.glob('home/**/*', File::FNM_DOTMATCH).reject { |f| /DS_Store/ =~ f }
    files.each do |file|
      real_file = "~/#{file.gsub(%r{home/}, '')}"
      if File.directory?(file)
        `mkdir -p #{real_file}`
      else
        map[file] = real_file
      end
    end
  end

desc 'Links the dot files into home directory'
task :link do
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

desc 'Automatically commit changes to existing files, notifiy if new files need to be manually added.'
task :update do
  status = `git status`
  case status
  when /Untracked files/
    notify 'Untracked files present'
  when /working directory clean/
    # Do nothing.
  else
    notify 'Committing changes'
    system 'git add -u && git commit -m "Automatic update."'
    pull = `git pull -X ours`
    if pull =~ /Automatic merge failed/
      notify 'Merge conflict'
    else
      push = `git push origin`
      notify 'Failed to push' if push =~ /rejected/
    end
  end
end

namespace :setup do
  desc 'Install Homebrew'
  task :brew do |t|
    brewed = system 'which brew'
    if brewed
      system 'brew update'
      system 'brew bundle install' unless system 'brew bundle check'
    else
      system 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      t.reenable
      t.invoke
    end
  end

  desc 'Set a number of OS X preferences'
  task :defaults do
    system './misc/defaults.sh'
  end

  desc 'Install ETC updater task'
  task :etc do
    location = '~/Library/LaunchAgents'
    plist = 'com.ambethia.update_dotfiles.plist'
    for_file "#{location}/#{plist}" do |target|
      system "mkdir -p #{location}"
      link_file "misc/#{plist}", target
      system "launchctl load -w #{target}"
    end
  end
end

task default: [:link] do
  Rake.application.in_namespace(:setup) { |ns| ns.tasks.each(&:invoke) }
end

def for_file(path)
  file = File.expand_path(path)
  yield(file) unless File.exist? file
end

def replace_file(source, target)
  system "rm -rf #{File.expand_path(target)}"
  link_file(source, target)
end

def link_file(source, target)
  puts "linking #{target}"
  system "ln -s \"$PWD/#{source}\" \"#{File.expand_path(target)}\""
end

def notify(msg)
  system "/opt/homebrew/bin/terminal-notifier -message \"#{msg}\" -title \"~/.etc\" -activate com.apple.Terminal -group dotfiles"
  # system "osascript -e 'tell app \"System Events\" to display dialog \"#{msg} (PS: install terminal-notifier, dummy)\"'"
end
