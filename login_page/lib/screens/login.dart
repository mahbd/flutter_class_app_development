import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    bool _visible = false;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        color: Colors.white,
        child: Column(
          children: [
            const Text('Welcome',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
                'In publishing and graphic design, lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'abc@gmail.com',
                prefixIcon: const Icon(Icons.email),
                suffixIcon: IconButton(
                    onPressed: () => _emailController.clear(),
                    icon: const Icon(Icons.clear)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () => {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text('Log in'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
