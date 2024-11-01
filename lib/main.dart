import 'package:dermat/bottom_navbar.dart';
import 'package:dermat/screens/account_screen.dart';
import 'package:dermat/screens/login.dart';
import 'package:dermat/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

final authStateProvider = StateProvider<AuthState>((ref) => AuthState.initial);

enum AuthState { initial, unauthenticated, authenticated }

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dermat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: authState == AuthState.initial
          ? const SplashScreen()
          : authState == AuthState.unauthenticated
              ? const LoginScreen()
              : BottomNavbar(),
      routes: <String, WidgetBuilder>{
        '/onboarding': (_) => const OnboardingScreen(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => BottomNavbar(),
        '/account': (_) => const Account(),
      },
    );
  }
}

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInitialRoute();
  }

  Future<void> _checkInitialRoute() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    final onboardingComplete = prefs.getBool('onboardingComplete') ?? false;
    final isAuthenticated = prefs.getBool('isAuthenticated') ?? false;

    if (!onboardingComplete) {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    } else if (!isAuthenticated) {
      ref.read(authStateProvider.notifier).state = AuthState.unauthenticated;
    } else {
      ref.read(authStateProvider.notifier).state = AuthState.authenticated;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
