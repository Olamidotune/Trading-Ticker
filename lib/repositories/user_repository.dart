// repositories/user_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointicker/api/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UserRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  CollectionReference get _usersRef => _firestore.collection('users');

  /// Search users by name prefix (case-insensitive), excluding the current user.
  Future<List<UserModel>> searchUsers(String query) async {
    final currentUid = _auth.currentUser?.uid;
    final lowerQuery = query.trim().toLowerCase();

    if (lowerQuery.isEmpty) return [];

    final snapshot = await _usersRef
        .where('fullNameLower', isGreaterThanOrEqualTo: lowerQuery)
        .where('fullNameLower', isLessThanOrEqualTo: '$lowerQuery\uf8ff')
        .limit(20)
        .get();

    return snapshot.docs
        .map((doc) => UserModel.fromDoc(doc))
        .where((user) => user.uid != currentUid)
        .toList();
  }

  /// Fetch a single user by uid (e.g. for chat headers, profile screens).
  Future<UserModel?> getUserById(String uid) async {
    final doc = await _usersRef.doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromDoc(doc);
  }

  /// Fetch multiple users by uid list (e.g. resolving chat participants).
  Future<List<UserModel>> getUsersByIds(List<String> uids) async {
    if (uids.isEmpty) return [];

    // Firestore 'whereIn' supports max 30 items — chunk if needed.
    final chunks = <List<String>>[];
    for (var i = 0; i < uids.length; i += 30) {
      chunks.add(uids.sublist(i, i + 30 > uids.length ? uids.length : i + 30));
    }

    final results = <UserModel>[];
    for (final chunk in chunks) {
      final snapshot =
          await _usersRef.where(FieldPath.documentId, whereIn: chunk).get();
      results.addAll(snapshot.docs.map((doc) => UserModel.fromDoc(doc)));
    }
    return results;
  }

  /// Stream the current logged-in user's profile (useful for a "my profile" screen).

  Stream<UserModel?> currentUserStream() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return Stream.value(null);

    return _usersRef.doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return UserModel.fromDoc(doc);
    });
  }
}
