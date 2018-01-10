import 'package:test/test.dart';
import '../lib/services/firebaseAuth.dart';
import '../lib/models/user.dart';


void main() {
  User user = new User();
  user.email = "red5@red.com";
  user.password = "redred";
  UserAuth userAuth = new UserAuth();

  test('create a user in firebase', () {
    String testEmail;
    userAuth.signUp(user).then((onValue) {
      testEmail = onValue.email;
    });
    expect(testEmail, user.email);
  });

  test('login user', () {
    userAuth.logIn(user).then((onValue) {
      expect(onValue.email, user.email);
    });
  });


  test('sign out user', () async {
    userAuth.logIn(user);
    // userAuth.signOut();
    userAuth.getCurrentUser().then((onValue) {
      expect(onValue, null);
    });
  });
}
