class TicTac
  def initialize(player1, player2)
  	@a = Player.new(player1)
  	@b = Player.new(player2)
  	@board = Array.new(9, false) 
  	start
  end

  class Player
  	attr_reader :name

  	def initialize(name)
  	  @name = name
  	  @cells = []
  	end
  	
  	def add_to_cell(num)
  	  @cells << num
  	end

  	def num_get
  	  a = @cells.pop
  	  @cells << a 
  	  a
  	end

  end

  def start
  	puts "hello welcome to Tic Tac Toy game"
  	z = false
  	5.times do |i|
  	  if i == 4
  	  	puts "#{@a.name } please enter your number: "
        c = gets.chomp.to_i
        @a.add_to_cell(c)
        @board[c] = 'X'
        z = check_win 
  	    display_msg(z) 
  	    break
  	  end

  	  puts "#{@a.name } please enter your number: "
  	  c = gets.chomp.to_i
  	  @a.add_to_cell(c)
  	  @board[c] = 'X'
  	  z = check_win if i > 1
  	  display_msg(z) if z != false
  	  break if z!= false
  	  puts "#{@b.name } please enter your number: "
  	  c = gets.chomp.to_i
  	  @b.add_to_cell(c)
  	  @board[c] = 'O'
  	  z = check_win if i > 1
  	  display_msg(z) if z != false
  	  break if z != false
    end

  end

  def check_win

 	[1,2,3].each do |i|
  	  if @board[i] == @board[i+3] and @board[i+3] == @board[i+6] and @board[i]
  	  	return @board[i]
  	  end
    end

    [1,4,7].each do |i|
  	  if @board[i] == @board[i+1] and @board[i+1] == @board[i+2] and @board[i]
  	  	return @board[i]
  	  end
    end
    
    if @board[1] == @board[5] and @board[5] == @board[9]
      zx = @board[1]
      return zx
    end
    
    if @board[3] == @board[5] and @board[5] == @board[7]
      zx = @board[3]
      return zx
    end
    false
  end

  def display_msg(v)
    if v == 'X'
      puts "#{@a.name } is win"
    elsif v == 'O'
      puts "#{@b.name } is win"
    else
      puts "nither of you are win  #{v}"
    end
  end

end

s =  TicTac.new('ali', 'hamid')