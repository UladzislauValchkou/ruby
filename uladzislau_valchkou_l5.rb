#!/usr/bin/env ruby
# top level comment
class Script
  def self.run(&block)
    @result = yield(block)
  end
end
# top level comment
class SuperScript < Script
  def self.write(way, text)
    f = File.open(way, 'a')
    f.puts(text)
    f.close
  end

  def self.run(name, stdout_log = nil, stderr_log = nil, &block)
    super(&block)
  rescue StandardError => err
    err_log = "ERROR: #{Time.now} #{name} #{err.message}}"
    stderr_log ? write(stderr_log, err_log) : (p err_log)
  else
    out_log = "#{Time.now} #{name} #{@result}"
    stdout_log ? write(stdout_log, out_log) : (p out_log)
  end
end

SuperScript.run('mtn', './my.log', './ERR.log') do
  a = 1
  a += 5
  a
end

SuperScript.run('mtn', './my.log', './ERR.log') do
  1 / 0
end
