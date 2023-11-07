require 'rspec'
require_relative 'robot'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe 'placing the robot' do
    it 'places the robot within valid coordinates' do
      robot.place(1, 2, 'NORTH')
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.direction).to eq('NORTH')
      expect(robot.placed).to be(true)
    end

    it 'does not place the robot outside valid coordinates' do
      robot.place(6, 0, 'SOUTH')
      expect(robot.placed).to be(false)
    end
  end

  describe 'moving the robot' do
    it 'moves the robot one unit NORTH when facing NORTH' do
      robot.place(2, 2, 'NORTH')
      robot.move
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(3)
    end

    it 'moves the robot one unit NORTH when facing SOUTH' do
      robot.place(2, 2, 'SOUTH')
      robot.move
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(1)
    end

    it 'moves the robot one unit NORTH when facing WEST' do
      robot.place(2, 2, 'WEST')
      robot.move
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
    end

    it 'moves the robot one unit NORTH when facing NORTH' do
      robot.place(2, 2, 'NORTH')
      robot.move
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(3)
    end

    it 'prevents the robot from falling off the table when moving SOUTH' do
      robot.place(3, 0, 'SOUTH')
      robot.move
      expect(robot.x).to eq(3)
      expect(robot.y).to eq(0)
    end

		it 'prevents the robot from falling off the table when moving WEST' do
      robot.place(0, 2, 'WEST')
      robot.move
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(2)
    end

		it 'prevents the robot from falling off the table when moving NORTH' do
      robot.place(2, 4, 'NORTH')
      robot.move
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(4)
    end

    it 'prevents the robot from falling off the table when moving EAST' do
      robot.place(4, 1, 'EAST')
      robot.move
      expect(robot.x).to eq(4)
    end
  end

  describe 'rotating the robot' do
    it 'rotates the robot 90 degrees LEFT' do
      robot.place(2, 2, 'NORTH')
      robot.left
      expect(robot.direction).to eq('WEST')
    end

    it 'rotates the robot 90 degrees RIGHT' do
      robot.place(2, 2, 'EAST')
      robot.right
      expect(robot.direction).to eq('SOUTH')
    end

    it 'rotates the robot 180 degrees LEFT' do
      robot.place(2, 2, 'NORTH')
      robot.left
      robot.left
      expect(robot.direction).to eq('SOUTH')
    end

    it 'rotates the robot 180 degrees RIGHT' do
      robot.place(2, 2, 'WEST')
      robot.right
      robot.right
      expect(robot.direction).to eq('EAST')
    end

    it 'rotates the robot 360 degrees LEFT' do
      robot.place(2, 2, 'NORTH')
      robot.left
      robot.left
      robot.left
      robot.left
      expect(robot.direction).to eq('NORTH')
    end

    it 'rotates the robot 360 degrees RIGHT' do
      robot.place(2, 2, 'WEST')
      robot.right
      robot.right
      robot.right
      robot.right
      expect(robot.direction).to eq('WEST')
    end
  end

  describe 'reporting the robot' do
    it 'returns the robot position and direction when placed' do
      robot.place(3, 4, 'WEST')
      report = robot.report
      expect(report).to eq('3,4,WEST')
    end

    it 'returns a message when the robot is not placed' do
      report = robot.report
      expect(report).to eq('Robot is not placed on the table.')
    end
  end
end
