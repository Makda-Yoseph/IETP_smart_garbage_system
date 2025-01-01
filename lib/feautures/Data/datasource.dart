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
        final garbageList = <GarbageDataModel>[];

        // Iterate through the top-level map
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        data.forEach((id, uniqueKeyMap) {
          // Extract the inner map containing the actual garbage data
          final innerData = Map<String, dynamic>.from(uniqueKeyMap as Map);
          innerData.forEach((uniqueKey, garbageDetails) {
            final garbageJson = Map<String, dynamic>.from(garbageDetails);
            garbageList.add(GarbageDataModel.fromJson({
              ...garbageJson,
              'id': id, // Include the `id` in the model
            }));
          });
        });

        return garbageList;
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
        // Get the first unique key's data (assuming only one unique key exists)
        final uniqueKeyMap = Map<String, dynamic>.from(snapshot.value as Map);
        final uniqueKeyEntry = uniqueKeyMap.entries.first;
        final garbageJson = Map<String, dynamic>.from(uniqueKeyEntry.value);

        return GarbageDataModel.fromJson({
          ...garbageJson,
          'id': id, // Include the `id` in the model
        });
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
      final snapshot =
          await _database.child('garbage_data/${garbageCanModel.id}').get();
      if (snapshot.exists) {
        // Get the unique key (assuming only one unique key exists)
        final uniqueKeyMap = Map<String, dynamic>.from(snapshot.value as Map);
        final uniqueKey = uniqueKeyMap.keys.first;

        await _database
            .child('garbage_data/${garbageCanModel.id}/$uniqueKey')
            .update(garbageCanModel.toJson());
      } else {
        throw Exception(
            "Garbage data with ID ${garbageCanModel.id} not found.");
      }
    } catch (e) {
      throw Exception("Error updating garbage level: $e");
    }
  }
}
