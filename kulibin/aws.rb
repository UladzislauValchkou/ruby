#!/bin/env ruby

require_relative './server.rb'
# так же данный файл реализует модуль AwsPlugin у которого есть единственный метод #aws_spawn_server! который устанавливает переданному серверу значение spawned_by == TYPE из класса Aws
module AwsPlugin
  def aws_spawn_server!(server)
    server.spawned_by = Aws::TYPE
  end
end

# Aws
class Aws < Server
  TYPE = 'aws'.freeze

  def get_aws_ip!
    @ip = 'aws-2.2.2.2'
  end
  def deploy!
    super
    @deployed_by = TYPE
  end
end
