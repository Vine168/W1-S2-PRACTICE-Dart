enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address,
      this._yearsOfExperience);

  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
      : this._name = name,
        this._baseSalary = 40000,
        this._address = address,
        this._yearsOfExperience = yearsOfExperience,
        this._skills = [Skill.FLUTTER, Skill.DART, Skill.OTHER];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double totalSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  @override
  String toString() {
    return 'employee Name: $_name,\nbase Salary: \$${_baseSalary}, \n'
        'years of experience: $_yearsOfExperience, \n'
        'address: ${_address.street}, ${_address.city}, ${_address.zipCode}, \n'
        'skills: ${_skills.map((skill) => skill.toString())}';
  }
}
void main() {
  Address address = Address("2004", "Phnom Penh", "120101");
  Employee employee1 = Employee("Chim Vine", 40000, [Skill.FLUTTER], address, 3);

  print(employee1);
  print('total salary: \$${employee1.totalSalary()}');
}
