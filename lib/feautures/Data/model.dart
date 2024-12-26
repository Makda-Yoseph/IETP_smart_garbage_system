// 1. Create a new file named model.dart in the Data folder
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';

class GarbageDataModel extends GarbageCanModel {
  GarbageDataModel({
    required String name,
    required String id,
    required int level_one,
    required int level_two,
  }) : super(
          name: name,
          id: id,
          level_one: level_one,
          level_two: level_two,
        );

  /// Factory method to create a GarbageCanModel instance from a JSON map
  factory GarbageDataModel.fromJson(Map<String, dynamic> json) {
    return GarbageDataModel(
      name: json['name'] as String,
      id: json['id'] as String,
      level_one: json['level_one'] as int,
      level_two: json['level_two'] as int,
    );
  }

  /// Method to convert a GarbageCanModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'level_one': level_one,
      'level_two': level_two,
    };
  }
}
