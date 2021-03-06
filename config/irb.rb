require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true

# Quick benchmarking
# Based on rue's irbrc => http://pastie.org/179534
def benchmark(repetitions=100, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
    b.report {repetitions.times &block}
  end
end

# Provides RI lookup for the object given.
# ri(Array) = ri("Array") = ri([1,2,3])
def ri(obj = '')
  unless obj.kind_of?(Class) or obj.kind_of?(String)
    obj = obj.class
  end
  puts `ri #{obj}`
end
