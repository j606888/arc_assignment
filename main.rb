#!/usr/bin/env ruby

require 'json'
require './kanban'
require './cli_reader'

CLI_READER.new(ARGV).call