import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TextBoxApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.green,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class TextBoxApp extends StatefulWidget {
  const TextBoxApp({Key? key}) : super(key: key);

  @override
  _TextBoxAppState createState() => _TextBoxAppState();
}

class _TextBoxAppState extends State<TextBoxApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;
  Icon hidePasswordIcon = const Icon(Icons.visibility_off);
  Icon showPasswordIcon = const Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextBox'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 140)),
            const Center(
                child: Text(
              'This is Text Box',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            )),
            const Padding(padding: EdgeInsets.only(top: 50)),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Enter name',
                  hintText: 'Enter name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25)),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Enter email',
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25)),
            SizedBox(
              width: 350,
              child: TextFormField(
                obscureText: hidePassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffix: IconButton(
                    icon: hidePassword ? hidePasswordIcon : showPasswordIcon,
                    onPressed: () {
                      setState(
                        () {
                          hidePassword = !hidePassword;
                        },
                      );
                    },
                  ),
                  labelText: 'Enter Password',
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(),
                  ),
                ),
                style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25)),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Your Information'),
                          content: Text('Email: ${_emailController.text}\n'
                              'Name: ${_nameController.text}\n'
                              'Password: ${_passwordController.text}'),
                        ));
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
