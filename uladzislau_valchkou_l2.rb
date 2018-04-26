#!/bin/env ruby

# TASK2_1

def task_2_1(n)
  values = []
  if n.zero?
    values << 0
  else
    a = 0
    b = 1
    n.times do
      c = a
      a = b
      b = c + a
      values << a
    end
  end
  p values
end

task_2_1( 0 )

require 'yaml'

file_content = YAML.load_file('example.yaml')
def task_2_2(input)
  my_array = []
  my_hash = {}
  input.each do |group, hash|
    group_hash = {}
    group_hash['db'] = hash['database']
    group_hash['user'] = hash['username'] if hash.key?('username')
    group_hash['password'] = hash['password'] if hash.key?('password')
    pool = hash['pool'] || 1
    timeout = hash['timeout'] || 1000
    group_hash['magic_number'] = pool * timeout
    my_hash[group] = group_hash
  end
  my_array << my_hash
  p my_array
end

task_2_2(file_content)

massive = [7, 3, 3, [4, 5, 1], 1, 9, [2, 8, 1]]

def task_2_3(array)
  a = array.flatten.uniq.sort { |x, y| y <=> x }
  p a
end

task_2_3(massive)

def task_2_4(string)
string.downcase == string.downcase.reverse
end

task_2_4('1')
