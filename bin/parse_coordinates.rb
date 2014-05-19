#!/usr/bin/env ruby

PROJECT_ROOT = File.expand_path('../..', __FILE__)
Dir.glob(File.join(PROJECT_ROOT, 'lib', '*.rb')).each do |file|
  require file
end

case ARGV.size
when 0
  coords = []
  Dir.glob(File.join(PROJECT_ROOT, 'data', '*.txt')).each do |file|
    coords << AsciiMap.parse(File.read(file))
  end
  prev, nxt = nil, nil
  coords.each do |coord|
    prev = nxt
    nxt = coord
    if prev
      puts AsciiMap.interpret_step(prev, nxt)
    else
      puts "started"
    end
  end
else
  raise "Invalid arguments"
end