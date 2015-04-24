class Event
  attr_accessor :probability

  def happen?
    rand_num = rand(100)
    vs = 100 - probability * 100
    vs >= rand_num
  end
end