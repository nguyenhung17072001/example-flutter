
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
    this.phoneNumber, 
    this.address, 
    this.images, 
    this.role
  });

  @override
  String toString() {
    
    return 'username: $username';
  }
}