#!/usr/bin/env ruby
# encoding: UTF-8

require 'pry'
require 'rainbow'
require 'thor'

require_relative './helper/helper.rb'
Dir[__dir__ + '/core/*.rb'].each { |file| require file }
Dir[__dir__ + '/events/*.rb'].each { |file| require file }
Dir[__dir__ + '/companies/*.rb'].each { |file| require file }
Dir[__dir__ + '/projects/*.rb'].each { |file| require file }

class GameCLI < Thor
  desc 'start [COMMAND]', 'Start Game'
  def start
    game = StartupGame.new
    game.opening
    game.hire_coders
    game.run
  end

  desc 'staff [COMMAND]', 'Thanks to all contributors'
  def staff
    HireSystem.staff
  end
end

GameCLI.start(ARGV)
