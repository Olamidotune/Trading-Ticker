import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<void> initSignIn() async {
    await _googleSignIn.initialize(
      serverClientId:
          '839188101886-ic63jvuhdmf6mpp0rgae0dblasajecqc.apps.googleusercontent.com',
    );
  }

  Future<User?> signInWithGoogle() async {
    try {
      await initSignIn();

      final googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      if (isNewUser) {
        logInfo('New user signed up with Google');

        final uid = userCredential.user!.uid;
        final fullName = googleUser.displayName;
        final email = googleUser.email;

        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'fullName': fullName,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });

        await PersistenceService().saveUserName(fullName ?? '');
        await PersistenceService().saveUserEmail(email);
      } else {
        logInfo('Existing user logged in with Google');

        final fullName = userCredential.user?.displayName;
        final email = userCredential.user?.email ?? '';

        await PersistenceService().saveUserName(fullName ?? '');
        await PersistenceService().saveUserEmail(email);
      }

      return userCredential.user;
    } catch (e, stack) {
      logError('Google auth error: $e', stack);
      return null;
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  static User? getCurrentUser() => _auth.currentUser;
}
