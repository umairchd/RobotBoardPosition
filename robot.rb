class Robot
  attr_accessor :x, :y, :direction, :placed

  def initialize
    @x = nil
    @y = nil
    @direction = nil
    @placed = false
  end

  def place(x, y, direction)
    if valid_placement?(x, y, direction)
      @x = x
      @y = y
      @direction = direction
      @placed = true
    end
  end

  def move
    return unless @placed

    new_x, new_y = calculate_new_position

    if valid_position?(new_x, new_y)
      @x = new_x
      @y = new_y
		else
			puts 'Cannot Move to Invalid Position'
		end
  end

  def left
    return unless @placed

    case @direction
    when 'NORTH'
      @direction = 'WEST'
    when 'WEST'
      @direction = 'SOUTH'
    when 'SOUTH'
      @direction = 'EAST'
    when 'EAST'
      @direction = 'NORTH'
    end
  end

  def right
    return unless @placed

    case @direction
    when 'NORTH'
      @direction = 'EAST'
    when 'EAST'
      @direction = 'SOUTH'
    when 'SOUTH'
      @direction = 'WEST'
    when 'WEST'
      @direction = 'NORTH'
    end
  end

  def report
    return 'Robot is not placed on the table.' unless @placed

    "#{@x},#{@y},#{@direction}"
  end

  private

  def calculate_new_position
    new_x = @x
    new_y = @y

    case @direction
    when 'NORTH'
      new_y += 1
    when 'EAST'
      new_x += 1
    when 'SOUTH'
      new_y -= 1
    when 'WEST'
      new_x -= 1
    end

    [new_x, new_y]
  end

  def valid_placement?(x, y, direction)
    x.between?(0, 4) && y.between?(0, 4) && ['NORTH', 'EAST', 'SOUTH', 'WEST'].include?(direction)
  end

  def valid_position?(x, y)
    x.between?(0, 4) && y.between?(0, 4)
  end
end

class RobotSimulator
  def initialize
    @robot = Robot.new
  end

  def run
    loop do
      command = gets.chomp

      case command
      when /^PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$/
        @robot.place($1.to_i, $2.to_i, $3)
      when 'MOVE'
        @robot.move
      when 'LEFT'
        @robot.left
      when 'RIGHT'
        @robot.right
      when 'REPORT'
        puts @robot.report
      when 'EXIT'
        break
      end
    end
  end
end

if $0 == __FILE__
  # The script is being run directly with 'ruby robot.rb'
  robot_simulator = RobotSimulator.new
  robot_simulator.run
end
