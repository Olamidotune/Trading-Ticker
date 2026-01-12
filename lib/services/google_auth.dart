import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Google Sign-In Service Class
class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool isInitialize = false;

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId:
            '839188101886-ic63jvuhdmf6mpp0rgae0dblasajecqc.apps.googleusercontent.com',
      );
    }
    isInitialize = true;
  }

  // // Sign in with Google
  // static Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     initSignIn();
  //     final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
  //     final idToken = googleUser.authentication.idToken;
  //     final authorizationClient = googleUser.authorizationClient;
  //     GoogleSignInClientAuthorization? authorization = await authorizationClient
  //         .authorizationForScopes(['email', 'profile']);
  //     final accessToken = authorization?.accessToken;
  //     if (accessToken == null) {
  //       final authorization2 = await authorizationClient.authorizationForScopes(
  //         ['email', 'profile'],
  //       );
  //       if (authorization2?.accessToken == null) {
  //         throw FirebaseAuthException(code: "error", message: "error");
  //       }
  //       authorization = authorization2;
  //     }
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: accessToken,
  //       idToken: idToken,
  //     );
  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     final User? user = userCredential.user;
  //     if (user != null) {
  //       final userDoc =
  //           FirebaseFirestore.instance.collection('users').doc(user.uid);
  //       final docSnapshot = await userDoc.get();
  //       if (!docSnapshot.exists) {
  //         await userDoc.set({
  //           'uid': user.uid,
  //           'name': user.displayName ?? '',
  //           'email': user.email ?? '',
  //           'photoURL': user.photoURL ?? '',
  //           'provider': 'google',
  //           'createdAt': FieldValue.serverTimestamp(),
  //         });
  //       }
  //     }
  //     return userCredential;
  //   } catch (e) {
  //     print('Error: $e');
  //     rethrow;
  //   }
  // }

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow.
      final googleUser = await _googleSignIn.authenticate();

      // Retrieve the authentication details from the Google account.
      final googleAuth = googleUser.authentication;

      // Create a new credential using the Google authentication details.
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential.
      final userCredential = await _auth.signInWithCredential(credential);

      logInfo("User signed in with Google: ${userCredential.user?.email}");

      // Return the authenticated user.
      return userCredential.user;
    } catch (e) {
      // Print the error and return null if an exception occurs.
      logInfo("Sign-in error: $e");
      return null;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (error, trace) {
      logError('Error signing out: $error', trace);
      rethrow;
    }
  }

  // Get current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }
}
