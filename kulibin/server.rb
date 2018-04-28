#!/bin/env ruby

# Servers
class Server
  TYPE = 'base'.freeze
  attr_accessor :cpu, :name, :ram, :ssd, :type, :spawned_by

  def initialize
    @type = self.class::TYPE
  end

  def self.new_server
    new
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
    # deploy! - который устанавливает name сервера в значение равное "#{ip}-#{type}"
  end

  def ping
    cpu.even?
    # возвращает true, если cpu сервера четное число, иначе - false
  end
end
