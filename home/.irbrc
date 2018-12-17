#!/usr/bin/ruby

require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Require awesome_print in our environment
begin
  require 'awesome_print'
rescue LoadError
  puts "No awesome_print :("
end

# Simple prompt mode
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Configure awesome print if available
if defined?(AwesomePrint)
  require 'awesome_print/ext/active_support'
  require 'awesome_print/ext/active_record'

  AwesomePrint.irb!

  AwesomePrint.defaults = {
    plain: false,
    index: false,
    ruby19_syntax: true,
    color: {
      hash:       :pale,
      class:      :white,
      bigdecimal: :yellow,
      integer:    :yellow,
      fixnum:     :yellow,
      symbol:     :yellow,
    },
    indent: -2
  }
end

# If we are in Rails
if ENV['RAILS_ENV'] || defined?(Rails)
  # Customize the IRB prompt
  app_name = Rails.application.class.parent_name.downcase
  app_env  = Rails.env[0...3]

  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    PROMPT_I: "#{app_name}> ",
    PROMPT_S: "#{app_name}* ",
    PROMPT_C: "#{app_name}? ",
    RETURN: "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS
end
