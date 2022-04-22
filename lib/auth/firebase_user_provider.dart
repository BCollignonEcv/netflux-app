import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class NetflixFirebaseUser {
  NetflixFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

NetflixFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<NetflixFirebaseUser> netflixFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<NetflixFirebaseUser>(
        (user) => currentUser = NetflixFirebaseUser(user));
