import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' show json;

import "package:http/http.dart" as http;

class LoginController {
  static LoginController instance = LoginController();

  String contactText = '';
  GoogleSignIn googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? currentUser;

  onCurrentUserChange() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      currentUser = account;
      if (currentUser != null) {
        handleGetContact(currentUser!);
      }
    });
    googleSignIn.signInSilently();
  }

  Future<void> handleGetContact(GoogleSignInAccount user) async {
    contactText = "Loading contact info...";

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      contactText = "People API gave a ${response.statusCode} "
          "response. Check logs for details.";
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = pickFirstNamedContact(data);
    if (namedContact != null) {
      contactText = "I see you know $namedContact!";
    } else {
      contactText = "No contacts to display.";
    }
  }

  String? pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<bool> handleSignIn() async {
    try {
      await googleSignIn.signIn();
      return true;
    } catch (error) {
      return false;
    }
  }
}
