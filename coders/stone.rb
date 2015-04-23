class Stone < Coder
  def initialize
    @name = '石头'
    @salary = 30_000
  end

  def work(remain_difficulty)
    forward = rand(500...800)
    puts "#{name}巨巨轻描淡写，项目成功推进#{forward}"
    remain_difficulty - forward
  end
end