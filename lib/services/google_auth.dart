import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<void> initSignIn() async {
    await _googleSignIn.initialize(
        serverClientId:
            // '839188101886-ic63jvuhdmf6mpp0rgae0dblasajecqc.apps.googleusercontent.com',
            '839188101886-v45mfn5s4v3tfv7aut9pktmq2aamubar.apps.googleusercontent.com');
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
