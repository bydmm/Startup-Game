class BlackUncleTree < Coder
  def initialize
    @name = '黑叔树'
    @salary = 20_000
  end

  def work(remain_difficulty)
    if rand(10) > 4
      forward = rand(200...400)
      puts "#{name}秒撸了一个高效红黑树，项目进度迅速前进#{forward}"
      remain_difficulty += forward
    else
      puts "#{name}秒撸了#{rand(10)}个C++模板，然而并没有什么屌用"
      remain_difficulty
    end
  end
end
