class Player
  def hand
    puts "数字を入力してください。"
    janken = {0=>"グー",1=>"チョキ",2=>"パー"}
    janken.each do |key, value|
      puts "#{key}:#{value}"
    end
  input_hand = gets.chomp
  if input_hand != "0" && input_hand != "1" && input_hand != "2"
    player = Player.new
    #「グー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする」という条件の時に、playerクラスをインスタンス化し、
    player.hand
    #handメソッドを呼び出すことで繰り返す。※クラスをnewしないと呼び出せない。
  else
    player_hand = input_hand.to_i
    puts "#{player_hand}"
    end
    return player_hand
    #returnしないとponメソッドに値渡しできない。
  end
end


class Enemy
  def hand
    number = [0,1,2]
    enemy_hand = number.sample
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # puts "b:#{player_hand}"
    # puts "c:#{enemy_hand}"
    result = (player_hand - enemy_hand +3)%3
    # puts "d:#{result}"
    janken = {0=>"グー",1=>"チョキ",2=>"パー"}
    if result == 2
      puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです。"
    elsif result == 1
      puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです。"
    end
    if result == 0
      puts "引き分けです。もう一度じゃんけんしましょう。"
      player = Player.new
      enemy = Enemy.new
      player.hand
      enemy.hand
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new


janken.pon(player.hand, enemy.hand)
