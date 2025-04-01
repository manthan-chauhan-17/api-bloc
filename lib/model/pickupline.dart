class PickupLine {
  final String line;

  PickupLine({required this.line});

  factory PickupLine.fromJson(Map<String, dynamic> json) {
    return PickupLine(
      line: json["random_pickup_line"],
    );
  }
}
