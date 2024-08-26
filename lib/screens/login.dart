import 'package:dermat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login'),
            ElevatedButton(
              onPressed: () async {
                // final prefs = await SharedPreferences.getInstance();
                // await prefs.setBool('isAuthenticated', true);
                ref.read(authStateProvider.notifier).state =
                    AuthState.authenticated;
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
