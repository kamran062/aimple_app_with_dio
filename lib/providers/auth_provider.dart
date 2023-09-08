import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _auth.authStateChanges().listen((User? newUser) {
      _user = newUser;
      notifyListeners();
    });
  }

  Future<void> _setLoading(bool value) async {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      await _setLoading(true);
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        await _setLoading(false);
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      await _setLoading(false);
    } catch (error) {
      print(error);
      await _setLoading(false);
    }
  }

  Future<void> signInWithApple() async {
    // Implement Apple Sign-In logic here using the apple_sign_in package.
    // For a complete implementation, refer to the package documentation.
    // https://pub.dev/packages/apple_sign_in
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _setLoading(true);
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _setLoading(false);
    } catch (error) {
      print(error);
      await _setLoading(false);
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _setLoading(true);
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _setLoading(false);
    } catch (error) {
      print(error);
      await _setLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      await _setLoading(true);
      await _auth.signOut();
      await googleSignIn.signOut();
      await _setLoading(false);
    } catch (error) {
      print(error);
      await _setLoading(false);
    }
  }
}
