enum Direction { north, east, south, west }

void main() {
  //position {7, 3} facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  const instructions = "RAALAL";
  // process the instructions and get the final position and direction
  for (var instruction in instructions.split('')) {
    switch (instruction) {
      case 'R':
        direction = turnRight(direction);
        break;
      case 'L':
        direction = turnLeft(direction);
        break;
      case 'A':
        var result = advance(x, y, direction);
        x = result[0];
        y = result[1];
        break;
    }
  }
  print("Final position: {$x, $y}");
  print("Facing: ${directionToString(direction)}");
}
// turn left
Direction turnLeft(Direction currentDirection) {
  switch (currentDirection) {
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
    case Direction.east:
      return Direction.north;
  }
}
// turn right 
Direction turnRight(Direction currentDirection) {
  switch (currentDirection) {
    case Direction.north:
      return Direction.east;
    case Direction.east:
      return Direction.south;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
  }
}
// advance
List<int> advance(int x, int y, Direction direction) {
  switch (direction) {
    case Direction.north:
      return [x, y + 1];
    case Direction.east:
      return [x + 1, y];
    case Direction.south:
      return [x, y - 1];
    case Direction.west:
      return [x - 1, y];
  }
}
// utility to convert the direction to a string
String directionToString(Direction direction) {
  switch (direction) {
    case Direction.north:
      return "North";
    case Direction.east:
      return "East";
    case Direction.south:
      return "South";
    case Direction.west:
      return "West";
  }
}
