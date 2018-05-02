#!/bin/env ruby
require_relative './aws.rb'
require_relative './azure.rb'

# kulibin
class Kulibin
  include AzurePlugin
  include AwsPlugin
  attr_accessor :version

  def initialize
    @configs = {}
    @steps = []
  end

  def self.setup
    set = Kulibin.new
    yield(set)
    set
  end

  def define_server(config)
    @configs[config] = Server.new
    yield(@configs[config])
  end

  def steps(step, &block)
    @steps << {
      name: step,
      block: block
    }
  end

  def run(config, server)
    server.cpu = @configs[config].cpu if @configs[config].cpu
    server.ssd = @configs[config].ssd if @configs[config].ssd
    server.ram = @configs[config].ram if @configs[config].ram
    @steps.each do |step|
      step[:block].call(server)
    end
  end
end
