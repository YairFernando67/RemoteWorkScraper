#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/scraper'

input = 1
# while welcome_input == 1
  puts "WELCOME...CHECK OUT SOME JOBS THAT MIGHT BE INTERESTING FOR YOU!!"
  puts "What type of jobs are you interested in?"
  welcome = "Ruby and Rails developer  ==>> TYPE 1" + "\n" + "React developer  ==>> TYPE 2" + "\n" + "Java Script Developer  ==>> TYPE 3"
  puts welcome
  input = gets.chomp.to_i
  while input != 1 && input != 2 && input != 3
    puts "Please select one of the following options:"
    puts welcome
    input = gets.chomp.to_i
  end
  case input
    when 1
      print "Loading Ruby and Rails jobs....."
      scraper = Scraper.new()
      jobs = scraper.getData
      jobs.each do |job|
        p job
      end
    when 2
      print "Loading React jobs....."
    when 3
      print "Loading JavaScript jobs....."
  end
# end

sleep(0.1)
print "!"
sleep(0.1)
print "!"
sleep(0.2)
print "!"
sleep(0.3)
puts "!"
lop = true
while lop
  puts "Player 1: Enter your name?"
  begin
    p_one_name = Kernel.gets.chomp.match("[a-zA-Z]+.*").string
  rescue
    puts "Please do not use only numbers on your name!!"
  else
    p_one = Player.new(p_one_name)
    lop = false
  end
end

lop2 = true
while lop2
  puts "Player 2: Enter your name?"
  begin
    p_two_name = Kernel.gets.chomp.match("[a-zA-Z]+.*").string
  rescue
    puts "Please do not use only numbers on your name!!"
  else
    p_two = Player.new(p_two_name)
    lop2 = false
  end
end


puts "-------------Let's begin #{p_one.name} VS #{p_two.name}-------------"
new_game = Game.new()
p "Movements"
puts "#{p_one.name}".ljust(10) + ": #{p_one.selection.size}".rjust(10)
puts "#{p_two.name}".ljust(10) + ": #{p_two.selection.size}".rjust(10)
puts ""

turn = 0
while !new_game.winner
  puts "BOARD".center(20)
  print ''.center(6)
  i = 0
  for slot in new_game.available_board do
    i+=1
    print "|#{slot}"
    if (i % 3) == 0
      print "|\n"
      print ''.center(6)
    end

  end
  puts ""

  new_game.turn = new_game.next_turn(turn)
  if new_game.turn
    puts "#{p_one.name}, pick a number:"
    p_one.move = gets.chomp.to_i
    while !new_game.available_board.include?(p_one.move)
      puts "Please select one of the available options"
      p_one.move = gets.chomp.to_i
    end
    p_one.selection << p_one.move
    new_game.update_board(p_one.move, turn)
  else
    puts "#{p_two.name}, pick a number:"
    p_two.move = gets.chomp.to_i
    while !new_game.available_board.include?(p_two.move)
      puts "Please select one of the available options"
      p_two.move = gets.chomp.to_i
    end
    p_two.selection << p_two.move
    new_game.update_board(p_two.move, turn)
  end

  turn += 1
  start_checking = new_game.checker(turn)
  if start_checking
    p_one_wins = p_one.winner(p_one.selection)
    p_two_wins = p_two.winner(p_two.selection)
    if p_one_wins || p_two_wins
      new_game.winner = true
      print "CONGRATS!!!! the winner is"
      sleep(0.1)
      print "."
      sleep(0.2)
      print "."
      sleep(0.3)
      print "."
      sleep(0.6)
    end

    puts "#{p_one_name.upcase}!!!!!!" if p_one_wins
    puts "#{p_two_name.upcase}!!!!!!" if p_two_wins
  end
  break if turn == 9

end
puts "-This is a tie-" if new_game.winner == false
print ''.center(6)
i = 0
for slot in new_game.available_board do
  i+=1
  print "|#{slot}"
  if (i % 3) == 0
    print "|\n"
    print ''.center(6)
  end
end
