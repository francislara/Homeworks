class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      sleep 1
      system("clear")
    end

    game_over_message
    reset_game
=begin
    system("clear") # Resets game and starts a new one, breaks rspec
    puts "New game starting!"
    sleep 1
    system("clear")
    play
=end
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      puts round_success_message
      @sequence_length = sequence_length + 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence one color at a time:"
    @seq.each do |color|
      user_color = gets.chomp.downcase
      unless user_color == color
        @game_over = true
        system("clear")
        puts game_over_message
        sleep 1
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Round successful. Here's the next sequence:"
  end

  def game_over_message
    "Game over! You lasted for #{@sequence_length} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
