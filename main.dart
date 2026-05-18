import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),

      body: Center(

        child: SingleChildScrollView(

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const Text(
                  "Login with your phone and password",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // PHONE FIELD
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),

                  child: TextFormField(

                    controller: phoneController,

                    keyboardType: TextInputType.phone,

                    decoration: InputDecoration(

                      hintText: "Enter your number",

                      labelText: "Phone Number",

                      prefixIcon: const Icon(Icons.phone),

                      suffixIcon: const Icon(Icons.check),

                      labelStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      }

                      else if (value.length < 8) {
                        return "Phone number is too short";
                      }

                      else {
                        return null;
                      }
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // PASSWORD FIELD
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),

                  child: TextFormField(

                    controller: passwordController,

                    obscureText: true,

                    decoration: InputDecoration(

                      hintText: "Enter your password",

                      labelText: "Password",

                      prefixIcon: const Icon(Icons.lock),

                      suffixIcon: const Icon(Icons.visibility),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }

                      else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      else {
                        return null;
                      }
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // LOGIN BUTTON
                SizedBox(

                  width: 300,

                  child: ElevatedButton(

                    onPressed: () {

                      if (_formKey.currentState!.validate()) {

                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(
                            content: Text("Login Successful"),
                          ),
                        );
                      }
                    },

                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}