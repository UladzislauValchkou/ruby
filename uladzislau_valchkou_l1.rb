#!/bin/env ruby

def task1(input)
  task_result = []
  input.each_line do |line|
    if line.downcase.include? 'error'
      task_result << line
    end
  end
  task_result
end

def task2(input)
  task_result = []
  input.each_line do |line|
    unless line.downcase.include? 'error'
      task_result << line.split('[')[1].split(']')[0] + ' FROM: ' + line.split('-')[0] + 'TO:' + line.split('POST')[1].split('"')[0]
    end
  end
  task_result
end

=begin
def task2(input)
  require 'time'
  previous_time = nil
  difference = []
  input.each_line do |line|
    if line.include? 'Calling core with action'
      line_arr = line.split(' ')[0] + ' ' + line.split(' ')[1]
      time_in_ms = DateTime.strptime(line_arr, '%Y-%m-%d %H:%M:%S.%L').to_time
      difference << (time_in_ms - previous_time).round(1) if previous_time
      previous_time = time_in_ms
    end
  end
  difference
end

def task3(input)
  summ = 0
  input.each_char { |c| summ += c.to_i }
  summ
end
=end
