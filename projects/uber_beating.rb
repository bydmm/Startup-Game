class UberBeating < Project
  def initialize
    @name = '嘀嘀打人'
    @estimate_project_difficulty = 10_000
    @remain_difficulty = @estimate_project_difficulty
    @explode_point = {
      name: '滴滴救命',
      description: "通过大数据和云计算, 根据用户的地理信息, \n"\
                   "以及手表提供的心跳速率, 检测出用户是否遭遇到危险, \n" \
                   "然后立刻通过手表大声发出语音提示: \n" \
                   '大哥等你一句话，你说砍谁就砍谁!',
      estimate_difficulty: 20_000
    }
  end
end