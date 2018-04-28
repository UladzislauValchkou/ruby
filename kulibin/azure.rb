#!/bin/env ruby
# - так же данный файл реализует модуль AzurePlugin у которого есть единственный метод #azure_spawn_server! который устанавливает переданному серверу значение spawned_by == TYPE из класса Azure
require_relative './server.rb'
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end

class Azure < Server

  TYPE = 'azure'.freeze

  def get_azure_ip!
    @ip = 'azure-1.1.1.1'
    # sets ip in 'azure-1.1.1.1'
  end

  def deploy!
    super
    @deployed_by = TYPE
    # scaling Server.deploy and sets deployed_by == type
  end
end
