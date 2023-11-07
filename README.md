# Handle Robot Position on 5 * 5 Board

# Robot

This is a Ruby class that provides methods for moving and reporting position of robot and it also don't let robot fall off the board.

## Running the Tests

To run the tests for this class, you need to have the `rspec` gem installed. If you don't have it installed, you can install it by running the following command:


bundle install

Once you have `rspec` installed, you can run the tests using the following command:

rspec robot_spec.rb


This command will execute the RSpec spec file `robot_spec.rb` and display the test results in the console.

## Description

You can also see `Robot` class in the `robot.rb` file which is used to keep track of Robot position. To run the example usage, simply execute the following command:

ruby robot.rb

This will run the script which will following commands as input

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
EXIT
```

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST (e.g. PLACE 2,2,NORTH).
- MOVE will move the toy robot one unit forward in the direction it is currently
  facing (e.g. robot has 2,2,NORTH placement on table after MOVE command new placement will be 2,2,NORTH).
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot(e.g. robot face is towards NORTH after running LEFT it will face WEST and if run RIGHT insead then robot front will be towards EAST).
- REPORT will announce the X,Y and F of the robot. This can be in any form, but
  standard output is sufficient (e.g. robot x = 1 y = 2 and its face is towards WEST running REPORT will return 1,2,WEST).
- EXIT will stop the program which is ruby by command 'ruby robot.rb'

