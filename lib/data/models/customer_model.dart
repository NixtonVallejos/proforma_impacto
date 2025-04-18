class Customer {
  final int id;
  final String name;
  final String code;
  final String? company;
  final String? email;
  final String? phone;
  final String? address;

  Customer({
    required this.id,
    required this.name,
    required this.code,
    this.company,
    this.email,
    this.phone,
    this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      company: json['company'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}
