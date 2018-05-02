#!/bin/env ruby

# server
class Server
  TYPE = 'base'.freeze
  attr_accessor :type, :cpu, :ram, :ssd, :ip, :spawned_by, :name, :deployed_by

  def initialize
    @type = TYPE
  end

  def self.new_server
    new
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
  end

  def ping
    cpu.even?
  end
end
