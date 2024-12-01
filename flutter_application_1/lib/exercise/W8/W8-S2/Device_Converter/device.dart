class Device {
  final String name;
  final double conversionRate;

  Device(this.name, this.conversionRate);

  static final List<Device> devices = [
    Device("Euro", 0.95),
    Device("Riels", 4100.0),
    Device("Dong", 25346.0),
  ];
}
