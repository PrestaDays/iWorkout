// ignore_for_file: public_member_api_docs, sort_constructors_first

class WorkoutDayReqParams {
  final String id;

  WorkoutDayReqParams({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

}