class GrandPaFour < Coder
  def initialize
    @name = '四爷'
    @salary = 15_000
  end

  def work(remain_difficulty)
    if rand(10) > 4
      killed = rand(1...4)
      forward = killed * rand(150...200)
      puts "#{name}随手打死了#{killed}个玩家，项目成功推进#{forward}"
      remain_difficulty - forward
    else
      forward = rand(1...200)
      puts "#{name}制止了草狗侠玩舰娘，项目成功推进#{forward}"
      remain_difficulty - forward
    end
  end
end