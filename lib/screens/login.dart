import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0E6), // Light peachy background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 48),
                _buildLogoSection(),
                SizedBox(height: 48),
                _buildWelcomeText(),
                SizedBox(height: 32),
                _buildEmailField(),
                SizedBox(height: 16),
                _buildPasswordField(),
                SizedBox(height: 24),
                _buildLoginButton(context),
                SizedBox(height: 16),
                _buildForgotPasswordLink(),
                SizedBox(height: 32),
                // _buildSocialLoginSection(),
                // SizedBox(height: 24),
                _buildSignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildLogoSection() {
  return SvgPicture.string(
    '''
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <circle cx="60" cy="60" r="55" fill="#FFA07A" />
  <path d="M45 75 Q 60 90 75 75 Q 90 60 75 45 Q 60 30 45 45 Q 30 60 45 75 Z" fill="#FFFFFF" />
  <circle cx="52" cy="52" r="5" fill="#FF6347" />
  <circle cx="68" cy="52" r="5" fill="#FF6347" />
</svg>
      ''',
    width: 120,
    height: 120,
  );
}

Widget _buildWelcomeText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Welcome Back!',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4A4A4A),
        ),
      ),
      SizedBox(height: 8),
      Text(
        'Log in to continue your skincare journey',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF8E8E8E),
        ),
      ),
    ],
  );
}

Widget _buildEmailField() {
  return TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Email',
      prefixIcon: Icon(Icons.email, color: Color(0xFFFF6347)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Widget _buildPasswordField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Password',
      prefixIcon: Icon(Icons.lock, color: Color(0xFFFF6347)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Widget _buildLoginButton(BuildContext context) {
  return ElevatedButton(
    child: Text('Log In'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFF6347),
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: () async {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isAuthenticated', true);
      // ref.read(authStateProvider.notifier).state = AuthState.authenticated;
      Navigator.of(context).pushReplacementNamed('/home');
    },
  );
}

Widget _buildForgotPasswordLink() {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Color(0xFFFF6347)),
      ),
      onPressed: () {
        // Implement forgot password functionality
      },
    ),
  );
}

// Widget _buildSocialLoginSection() {
//   return Column(
//     children: [
//       Text(
//         'Or log in with',
//         style: TextStyle(color: Color(0xFF8E8E8E)),
//       ),
//       SizedBox(height: 16),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildSocialLoginButton(
//             'assets/google_logo.svg',
//             'Google',
//             Color(0xFFDB4437),
//           ),
//           SizedBox(width: 16),
//           _buildSocialLoginButton(
//             'assets/facebook_logo.svg',
//             'Facebook',
//             Color(0xFF4267B2),
//           ),
//         ],
//       ),
//     ],
//   );
// }

// Widget _buildSocialLoginButton(String svgAsset, String label, Color color) {
//   return ElevatedButton.icon(
//     icon: SvgPicture.asset(
//       svgAsset,
//       width: 24,
//       height: 24,
//     ),
//     label: Text(label),
//     style: ElevatedButton.styleFrom(
//       backgroundColor: color,
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//     onPressed: () {
//       // Implement social login functionality
//     },
//   );
// }

Widget _buildSignUpLink() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account?",
        style: TextStyle(color: Color(0xFF8E8E8E)),
      ),
      TextButton(
        child: Text(
          'Sign Up',
          style: TextStyle(color: Color(0xFFFF6347)),
        ),
        onPressed: () {
          // Navigate to sign up page
        },
      ),
    ],
  );
}
