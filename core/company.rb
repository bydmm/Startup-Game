class Company
  attr_accessor :name, :money, :angel_fund

  def name
    Rainbow(@name).underline.yellow
  end

  def color_angel_fund
    @angel_fund.color_fund
  end

  def color_money
    if @money < 0
      "#{@money}, 公司负债累累，倒闭"
    else
      @money.color_fund
    end
  end
end