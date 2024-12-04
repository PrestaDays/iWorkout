class UserEntity {
  final String id;
  final String displayName;
  final String image;

  UserEntity({
    required this.id,
    required this.displayName,
    required this.image
  });

  String getUserPath() {
    return "/users/$id";
  }
}