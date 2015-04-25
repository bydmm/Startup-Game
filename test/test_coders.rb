require 'pry'
require 'rainbow'
require 'thor'
require 'minitest/autorun'

Dir['./../helper/*.rb'].each { |file| require file }
Dir['./../core/*.rb'].each { |file| require file }
Dir['./../events/*.rb'].each { |file| require file }
Dir['./../companies/*.rb'].each { |file| require file }
Dir['./../projects/*.rb'].each { |file| require file }

class TestCoders < Minitest::Test
  def setup
  end

  def test_work_would_work
    Dir['./../coders/*.rb'].each do |file|
      require file
      class_name = file.split('/').last.split('.').first.camelize
      coder = Object.const_get(class_name).new
      5.times do
        assert_equal true,
                     [Fixnum, Float].include?(coder.work(10_000_000).class),
                     "class #{class_name}.work should return number"
      end
    end
  end
end
