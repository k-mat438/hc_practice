# frozen_string_literal: true

# 規定打数
turns = gets.split(',').map(&:to_i)
# プレイヤーの打数
result = gets.split(',').map(&:to_i)

# スコア (プレイヤーの打数 - 規定打数)
score = [result, turns].transpose.map { |ary| ary.inject(:-) }
# スコア一覧
list = %w[パー ボギー コンドル アルバトロス イーグル バーディ]
# 答え出力のための空配列
ans = []

18.times do |n|
  if score[n] <= 1 && score[n] >= -4
    ans.push(list[score[n]])
  else
    ans.push("#{score[n]}ボギー")
  end
  ans[n] = 'ホールインワン' if result[n] == 1 && turns[n] < 5
end

# カンマ区切りで出力
puts ans.join(',')
