require 'pry'
require 'rainbow'
require 'thor'
require 'minitest/autorun'
require 'money'

require_relative '../helper/helper.rb'
Dir[__dir__ + '/../core/*.rb'].each { |file| require file }
Dir[__dir__ + '/../jobs/*.rb'].each { |file| require file }
Dir[__dir__ + '/../events/*.rb'].each { |file| require file }
Dir[__dir__ + '/../companies/*.rb'].each { |file| require file }
Dir[__dir__ + '/../projects/*.rb'].each { |file| require file }

class TestCoders < Minitest::Test
  def setup
  end

  def test_work_would_work
    Dir[__dir__ + '/../coders/*.rb'].each do |file|
      require file
      class_name = file.split('/').last.split('.').first.camelize
      coder = Object.const_get(class_name).new
      10.times do
        assert_equal true,
                     [Fixnum, Float].include?(coder.work(10_000_000).class),
                     "class #{class_name}.work should return number"
      end
    end
  end
end
