require 'rails_helper'

describe Pitcher do
  # 省略
  it "most_winners_in_termメソッド使用時、最多勝投手が一人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 19)
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 20)
    Pitcher.create(player_id: 'goro', year_id: 2002, wins: 19)
    Pitcher.create(player_id: 'rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq ["siro"]
  end

  it "most_winners_in_termメソッド使用時、最多勝投手が複数人の場合" do
    Pitcher.create(player_id: 'taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 18)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 19)
    Pitcher.create(player_id: 'siro', year_id: 2001, wins: 20)
    Pitcher.create(player_id: 'goro', year_id: 2002, wins: 20)
    Pitcher.create(player_id: 'rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq ["siro","goro"]
  end

  it "most_winners_in_termメソッド使用時、指定した期間のデータが存在しない場合" do
    Pitcher.create(player_id: 'taro', year_id: 1999, wins: 21)
    Pitcher.create(player_id: 'rokuro', year_id: 2003, wins: 21)
    expect(Pitcher.most_winners_in_term(2000, 2002)).to eq []
  end
end
