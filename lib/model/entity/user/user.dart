
class User {
  final String username;
  final String token;
  final String? fullName;
  final num? phoneNumber;
  final String? address;
  final String? images;
  final String? role;

  User({
    required this.username, 
    required this.token, 
    this.fullName, 
    this.address,
    this.images,
    this.phoneNumber,
    this.role,
  })
  

  @override
  String toString() {
    return 'username: $username';
  }
}