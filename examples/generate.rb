#! /usr/bin/env ruby
require 'rtripcode'

ARGV.each {|arg|
  puts "#{arg}: #{arg.tripcode}"
}
