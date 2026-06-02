import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _login(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    final user = await ApiService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Email or Password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: isMobile
          ? MobileLoginView(
              emailController: emailController,
              passwordController: passwordController,
              onLogin: () async {
                await _login(context, emailController, passwordController);
              },
            )
          : DesktopLoginView(
              emailController: emailController,
              passwordController: passwordController,
              onLogin: () async {
                await _login(context, emailController, passwordController);
              },
            ),
    );
  }
}

class DesktopLoginView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const DesktopLoginView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: double.infinity,
            color: const Color(0xFF4F63D9),
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_balance, color: Colors.white, size: 80),
                  SizedBox(height: 25),
                  Text(
                    "GovConnect",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Digital Governance Portal",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            color: const Color(0xFFF8F9FA),
            child: Center(
              child: SizedBox(
                width: 420,
                child: LoginForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  onLogin: onLogin,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileLoginView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const MobileLoginView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
            color: const Color(0xFF4F63D9),
            child: const Column(
              children: [
                Icon(Icons.account_balance, color: Colors.white, size: 65),
                SizedBox(height: 15),
                Text(
                  "GovConnect",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Digital Governance Portal",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: LoginForm(
              emailController: emailController,
              passwordController: passwordController,
              onLogin: onLogin,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Welcome Back",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Login to continue using citizen services",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 35),
        CustomTextField(
          hint: "Email Address",
          controller: emailController,
          icon: Icons.email,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hint: "Password",
          controller: passwordController,
          icon: Icons.lock,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        CustomButton(
          text: "Login",
          onPressed: onLogin,
        ),
        const SizedBox(height: 18),
        const Text(
          "Email: citizen@gov.au | Password: Citizen@123",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.black45),
        ),
      ],
    );
  }
}