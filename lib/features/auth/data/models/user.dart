import 'package:iworkout/features/auth/domain/entities/user.dart';

class UserModel {
  final String id;
  final String displayName;
  final String image;

  UserModel({
    required this.id,
    required this.displayName,
    required this.image
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      displayName: map['displayName'] as String,
      image: map['image'] as String,
    );
  }

}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
        id: id,
        displayName: displayName,
        image: image
    );
  }
}