import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/pages/forgot_password_page.dart';
import 'package:aerplus_customer/pages/home_page.dart';
import 'package:aerplus_customer/pages/register_page.dart';
import 'package:aerplus_customer/services/network/authorization_services/api_authorization_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;

  login() async {
    await APIAuthorizationService(context: context).loginSystem(_emailController.text, _passwordController.text).then((loginResult) {
      if(loginResult == true) {
        ReplaceTo(context: context, target: const HomePage()).go();
      }
    });
  }

  register() {
    MoveTo(context: context, target: const RegisterPage()).go();
  }

  forgotPassword() {
    MoveTo(context: context, target: const ForgotPasswordPage()).go();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    'KETIKA ALAM & TEKNOLOGI BERPADU',
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Masukan email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Masukan password',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: const UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        icon: Icon(
                          _hidePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => forgotPassword(),
                          child: const Text(
                            'Lupa Password?',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => login(),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'Belum memiliki akun?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () => register(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                    ),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}