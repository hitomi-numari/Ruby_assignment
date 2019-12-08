# require 'byebug'

class Interface
  def beginning
   puts "数字を入力してください。"
  end

  def error
    puts "値が不正です。もう一度入力してください。"
  end

  def even
    puts "引き分けです。もう一度じゃんけんしましょう。"
  end
end

class Player
  def hand
    # puts "数字を入力してください。"
    input_hand = gets.chomp
    player_hand = input_hand
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
    #ponを定義する時に引数を２つ受け取った状態にしているから。
    if player_hand != "0" && player_hand != "1" && player_hand != "2"
      interface = Interface.new
      interface.error
      rock_scissors_paper = Rock_scissors_paper.new
      rock_scissors_paper.rock_scissors_paper
    else
      player_hand = player_hand.to_i
      puts "#{player_hand}"
      result = (player_hand - enemy_hand +3)%3
      janken = {0=>"グー",1=>"チョキ",2=>"パー"}
    if result == 2
      puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです。"
    elsif result == 0
      # puts "引き分けです。もう一度じゃんけんしましょう。"
      interface = Interface.new
      interface.even
      rock_scissors_paper = Rock_scissors_paper.new
      rock_scissors_paper.rock_scissors_paper
    else
      puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです。"
    end
    end
  end
end

class Rock_scissors_paper
  def rock_scissors_paper
    janken = {0=>"グー",1=>"チョキ",2=>"パー"}
    janken.each do |key, value|
      puts "#{key}:#{value}"
    end
    # player ＝　Player.new
    # enemy = Enemy.new
    janken = Janken.new
    janken.pon(Player.new.hand, Enemy.new.hand)
    #ponメソッドに引数を２つ渡す必要があるので、呼び出す時は引数二つ渡す。
  end
end

#ファイルを呼び出す時下記が呼び出される。(表示したい順番厳守)
interface = Interface.new
interface.beginning
rock_scissors_paper = Rock_scissors_paper.new
rock_scissors_paper.rock_scissors_paper
