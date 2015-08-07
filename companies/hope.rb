class Hope < Company
  def initialize
    @angel_fund = 200_000
    @money = @angel_fund
    @user_friendly_weight = 1.0 # the more the better
    @dev_speed_weight = 1.0 # range(0..1) the less the quick
  end
end