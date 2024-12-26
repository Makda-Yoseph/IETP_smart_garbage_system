import 'package:firebase_database/firebase_database.dart';
import 'package:ietp_project/feautures/Data/model.dart';

/// DataSource class to interact with Firebase for Garbage Data operations
class GarbageDataSource {
  final DatabaseReference _database;

  /// Constructor with a dependency on DatabaseReference
  GarbageDataSource(this._database);

  /// Fetches the garbage list from Firebase
  Future<List<GarbageDataModel>> getGarbageList() async {
    try {
      final snapshot = await _database.child('garbage_data').get();
      if (snapshot.exists) {
        // Map Firebase data into a list of GarbageDataModel
        final data = (snapshot.value as Map<dynamic, dynamic>).map(
          (key, value) => MapEntry(
            key,
            GarbageDataModel.fromJson(Map<String, dynamic>.from(value)),
          ),
        );

        return data.values.toList();
      } else {
        throw Exception("No garbage data found in Firebase.");
      }
    } catch (e) {
      throw Exception("Error fetching garbage list: $e");
    }
  }

  /// Fetches details of a specific garbage can by ID
  Future<GarbageDataModel> getGarbageDetail(String id) async {
    try {
      final snapshot = await _database.child('garbage_data/$id').get();
      if (snapshot.exists) {
        final json = Map<String, dynamic>.from(snapshot.value as Map);
        return GarbageDataModel.fromJson(json);
      } else {
        throw Exception("Garbage data with ID $id not found.");
      }
    } catch (e) {
      throw Exception("Error fetching garbage detail: $e");
    }
  }

  /// Updates the garbage levels for a specific garbage can
  Future<void> updateGarbageLevel(GarbageDataModel garbageCanModel) async {
    try {
      await _database
          .child('garbage_data/${garbageCanModel.id}')
          .update(garbageCanModel.toJson());
    } catch (e) {
      throw Exception("Error updating garbage level: $e");
    }
  }
}
