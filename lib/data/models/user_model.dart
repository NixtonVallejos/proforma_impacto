class User {
  final int id;
  final String firstName;
  final String secondName;
  final String firstSurname;
  final String secondSurname;
  final String code;
  final String dni;
  final String address;
  final String phoneNumber;
  final String birthday;
  final bool isSingle;
  final bool hasChildren;
  final String username;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.firstSurname,
    required this.secondSurname,
    required this.code,
    required this.dni,
    required this.address,
    required this.phoneNumber,
    required this.birthday,
    required this.isSingle,
    required this.hasChildren,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      secondName: json['second_name'],
      firstSurname: json['first_surname'],
      secondSurname: json['second_surname'],
      code: json['code'],
      dni: json['dni'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      birthday: json['birthday'],
      isSingle: json['is_single'],
      hasChildren: json['has_children'],
      username: json['username'],
      email: json['email'],
    );
  }
}
