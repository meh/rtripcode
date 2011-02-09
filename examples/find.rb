#! /usr/bin/env ruby
require 'rtripcode'
require 'getoptlong'

args = GetoptLong.new(
  ['--exact', '-e', GetoptLong::NO_ARGUMENT],
)

args.each {|option, value|
  case option
    when '--exact' then $exact = true
  end
}

ARGV.each {|arg|
  if arg.length > 10
    $stderr.puts "The tripcode is long 10 chars, faggot."
    next
  end

  puts "#{arg}:"

  ('.' .. 'zzzzzzzzzzzzzzzzz').each {|string|
    if string.tripcode.match(Regexp.new(arg, ($exact ? nil : 'i')))
      puts "    #{string}: #{string.tripcode}"
      next
    end
  }
}
