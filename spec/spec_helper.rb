$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cal_exporter'
require 'cal_exporter/exporter'
require 'cal_exporter/importer'
require 'coveralls'
Coveralls.wear!
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
