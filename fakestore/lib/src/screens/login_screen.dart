import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/api_service.dart';
import 'home.dart';
// import 'home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ApiService get apiService => GetIt.I<ApiService>();
  final TextEditingController nameCtrl = TextEditingController(
    text: 'mor_2314',
  );

  final TextEditingController passwordCtrl = TextEditingController(
    text: '83r5^_',
  );

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shop'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: passwordCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        // final getToken = await apiService.login(
                        //   nameCtrl.text,
                        //   passwordCtrl.text,
                        // );

                        setState(() {
                          loading = false;
                        });
                        // if (getToken != null && getToken['token'] != null) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Successfully logged in'),
                        //       backgroundColor:
                        //           Color.fromARGB(255, 215, 224, 215),
                        //     ),
                        //   );
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(
                                userToken: "123",
                              ),
                            ),
                          ),
                        );
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Incorrect username or password'),
                        //       backgroundColor: Colors.red,
                        //     ),
                        //   );
                        // }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
