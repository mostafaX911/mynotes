import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            // print(user);
            // if (user == null) {
            //   return const RegisterView();
            // } else {
            //   if (user.emailVerified) {
            //     return ElevatedButton(
            //         onPressed: () {
            //           FirebaseAuth.instance.signOut();
            //           Navigator.of(context)
            //               .pushNamedAndRemoveUntil('/login/', (route) => false);
            //         },
            //         child: const Text('Logout'));
            //   } else {
            //     return const VerifyEmailView();
            //   }
            // }
            return const LoginView();

          default:
            return const Text('Loading...');
        }
      },
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor: Colors.primaries[5],
      ),
      body: Column(
        children: [
          const Text('Please verify your email address'),
          ElevatedButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
              // FirebaseAuth.instance.signOut();
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil('/login/', (route) => false);
            },
            child: const Text('Send verification email'),
          ),
        ],
      ),
    );
  }
}
