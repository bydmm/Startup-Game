class Opening < Step
  def start
    why_start
    name_project
    name_company
    puts(
      '你成立了' +
      game.company.name +
      ", 你拿出了你毕生的积蓄#{company.color_angel_fund}" \
      "作为#{company.name}的启动资金。"
    )
  end

  private

  def why_start
    puts Rainbow('『2015又是一幅好光景啊』').yellow + '，加班结束之后的你看了看四周，已是深夜。'
    puts '你握紧了拳头，心想' + Rainbow('『我不能再这么加班下去了，我要改变世界』').yellow + '，灌木丛里的野狗叫了一声，以示鼓励。'
  end

  def company
    @game.company
  end

  def project
    @game.project
  end

  def name_project
    puts '你决定一起开发一款屌炸天的应用，叫做：'
    project.name = STDIN.gets.chomp
  end

  def name_company
    puts '你决定给公司起名为：'
    company.name = STDIN.gets.chomp
  end
end
