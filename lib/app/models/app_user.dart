class AppUser {
  // 1. Properties
  // 2. FromFireStore  Map OF Data Convert It To Object
  // 3. ToFireStore Your Object Convert It To Your Data
  static const String collectionName = 'users';
  String? id;
  String? name;
  String? email;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
  });

  AppUser.fromFirestore(Map<String, dynamic> data)
      : this(
          id: data['id'] as String,
          name: data['name'] as String,
          email: data['email'] as String,
        );
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
