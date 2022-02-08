import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_with_google/src/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _contactText = '';
  final loginController = LoginController.instance;

  @override
  void initState() {
    super.initState();
    loginController.onCurrentUserChange();
  }

  Future<void> fazerLogout() async {
    loginController.googleSignIn.disconnect();
  }

  Widget _buildBody() {
    GoogleSignInAccount? user = loginController.currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("Signed in successfully."),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: fazerLogout,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => loginController.handleGetContact(user),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton(
              child: const Text('SIGN IN'),
              onPressed: () async {
                bool res = await loginController.handleSignIn();
                if (res) {
                  Navigator.popAndPushNamed(context, "/home");
                } else {
                  print("Erro ao fazer login");
                }
              }),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
