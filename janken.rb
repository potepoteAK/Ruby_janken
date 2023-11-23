#じゃんけんメソッド
def janken
  #あいこ判定するためのフラグ
  aiko_flg = 0
  #じゃんけんで勝敗がつくまでループ
  while true do
    #正しい選択肢が入力されるまでループ
    while true do
      if aiko_flg == 0
        puts "じゃんけん..."
      else
        puts "あいこで..."
      end
      puts "0(グー)1(チョキ)2(パー)3(プログラムを終了する)"
      tmp_choice = gets.chomp
      #0~3以外の値ならもう一回ループ
      if tmp_choice != "0" && tmp_choice != "1" && tmp_choice != "2" && tmp_choice != "3"
        puts "不正な値です。再入力してください。"
        next
      end
      int_choice = tmp_choice.to_i
      break
    end
    
    #入力値が3なら"終了"という文字列を呼び出し元に戻す
    if int_choice == 3
      return "終了"
    end
    
    #相手の選択肢
    int_npc_choice = rand(3)
    
    #コンソール出力
    choice = janken_convert(int_choice)
    npc_choice = janken_convert(int_npc_choice)
    if aiko_flg == 0
      puts "ぽん！"
    else
      puts "しょ！"
    end
    puts "--------------------"
    puts "あなた：#{choice}"
    puts "NPC：#{npc_choice}"
    puts "--------------------"
    
    #勝敗判定
    int_janken_result= (int_choice - int_npc_choice + 3) % 3
    if int_janken_result == 0
      #あいこ
      aiko_flg = 1
      next
    elsif int_janken_result == 1
      #負け
      return "負け"
    else
      #勝ち
      return "勝ち"
    end
  end
end

#じゃんけんの数値をじゃんけんの手に変換するメソッド
def janken_convert(int_janken_choice)
  case int_janken_choice
  when 0
    return "グー"
  when 1
    return "チョキ"
  when 2
    return "パー"
  end
end

#あっち向いてホイメソッド
def attimuitehoi(janken_result)
  #正しい選択肢が入力されるまでループ
  while true do
    puts "あっち向いて〜"
    puts "0(上)1(下)2(右)3(左)"
    tmp_choice = gets.chomp
    #0~3以外の値ならもう一回ループ
    if tmp_choice != "0" && tmp_choice != "1" && tmp_choice != "2" && tmp_choice != "3"
      puts "不正な値です。再入力してください。"
      next
    end
    int_choice = tmp_choice.to_i
    break
  end
  
  #相手の選択肢
  int_npc_choice = rand(4)
  
  #コンソール出力
  choice = attimuitehoi_convert(int_choice)
  npc_choice = attimuitehoi_convert(int_npc_choice)
  puts "ほい！"
  puts "--------------------"
  puts "あなた：#{choice}"
  puts "NPC：#{npc_choice}"
  puts "--------------------"
  
  #勝敗判定
  if janken_result == "勝ち"
    if choice == npc_choice
      return "勝ち"
    else
      return "勝負つかず"
    end
  else
    if choice == npc_choice
      return "負け"
    else
      return "勝負つかず"
    end
  end
end

#あっち向いてホイの数値をあっち向いてホイの選択肢に変換するメソッド
def attimuitehoi_convert(int_attimuitehoi_choice)
  case int_attimuitehoi_choice
  when 0
    return "上"
  when 1
    return "下"
  when 2
    return "右"
  when 3
    return "左"
  end
end

#実際に処理が走る部分
while true do
  janken_result = janken
  if janken_result == "終了"
    break
  end
  attimuitehoi_result = attimuitehoi(janken_result)
  if attimuitehoi_result == "勝ち"
    puts "あなたの勝ちです！"
  elsif attimuitehoi_result == "負け"
    puts "NPCの勝ちです。"
  else
    next
  end
  break
end