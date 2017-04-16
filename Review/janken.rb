def janken

  puts "1: rock, 2: paper, 3: scissors"
  player= gets.to_i
  computer = rand(3)
  next_game = true

  hands = ["rock", "paper", "scissors"]

  puts "your hand is #{hands[player]}! computer's hand is #{hands[computer]}"

  #もし自分が勝ちなら
  if (player == 1 && computer == 3) || (player > computer)
    puts "you win!"
    return next_game = false
  # 自分が負けなら
  elsif (player == 3 && computer == 1) || (player < computer)
    puts "you lose!"
    return next_game = false
  else player == computer
    puts "one more time!"
    return next_game = true
  end

end

next_game = true

while next_game do
  janken
end
