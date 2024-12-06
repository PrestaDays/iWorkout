class WorkoutDay {
  final String day;

  WorkoutDay({
    required this.day,
  });

  factory WorkoutDay.fromMap(Map<String, dynamic> map) {
    return WorkoutDay(
      day: map['day'] as String,
    );
  }

}

extension UserXModel on WorkoutDay {
  WorkoutDay toEntity() {
    return WorkoutDay(
        day: day,
    );
  }
}