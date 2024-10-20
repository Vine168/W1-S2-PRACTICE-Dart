class Window {
  String material, type;
  Window(this.material, this.type);
}
class Roof {
  String material;
  double height;
  Roof(this.material, this.height);
}
class Door {
  String material;
  bool hasLock;
  Door(this.material, this.hasLock);
}
class House {
  String address;
  Roof roof;
  List<Window> windows = [];
  List<Door> doors = [];
  
  House(this.address, this.roof);

  void addWindow(Window window) => windows.add(window);
  void addDoor(Door door) => doors.add(door);

  void describe() {
    print('House at $address with ${roof.material} roof and ${windows.length} windows.');
  }
}
void main() {
  House house = House('007 Street', Roof('Concrete', 1.3));
  house.addWindow(Window('Glass', 'Sliding'));
 
  house.describe();
}
