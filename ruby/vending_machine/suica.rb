# frozen_string_literal: true

class Suica
  attr_reader :deposit
  # 1.1預かり金として500円がデフォルトでチャージ
  DEFALT_PRICE = 500
  def initialize(deposit = DEFALT_PRICE)
    @deposit = deposit
  end

  def deposit=(deposit)
    @deposit = deposit
  end
  # 1.2,1.3 100円以上の任意の金額をチャージ、100円未満は例外
  def charge(yen)
    if yen >= 100
      @deposit += yen
    else
      raise '100円以上を入金してください'
    end
  end
end
