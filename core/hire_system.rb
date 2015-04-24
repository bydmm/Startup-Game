class HireSystem
  attr_accessor :coders, :available_coders

  def initialize(game)
    @coders = []
    @game = game
    @available_coders = []
    load_coders
  end

  def hire
    puts '你可以招募三名程序员，请谨慎选择:'
    puts ''
    available_coders.each do |coder|
      break if @coders.count >= 3
      puts '-----'
      puts "程序员: #{coder.name}"
      puts '输入y加入团队, 或者按回车跳过:'
      user_input = STDIN.gets.delete!("\n")
      if user_input == 'y'
        @coders.push coder
        puts "#{coder.name}加入了你的团队。"
      end
    end
    if @coders.count < 1
      puts '---------error-------------'
      puts '你至少需要一名程序员加入你的团队!'
      puts '---------error-------------'
      puts ''
      hire
      return
    end
    puts ""
    puts "#{@coders.map(&:name).join(', ')}带着创富的梦想加入你。"
    puts "按回车进入下一步..."
    STDIN.gets
  end

  private

  def load_coders
    Dir['./coders/*.rb'].each do |file|
      require file
      class_name = file.split('/').last.split('.').first.camelize
      @available_coders.push Object.const_get(class_name).new
    end
  end
end