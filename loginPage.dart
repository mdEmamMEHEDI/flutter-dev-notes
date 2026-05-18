import 'package:flutter/material.dart';

// Main function
// এখান থেকেই app run শুরু হয়
void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // MaterialApp পুরো app control করে
    return MaterialApp(

      // Debug banner remove
      debugShowCheckedModeBanner: false,

      // প্রথম screen
      home: const LoginPage(),
    );
  }
}

// Login Page
// StatefulWidget কারণ UI change হতে পারে
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Main State Class
class _LoginPageState extends State<LoginPage> {

  // Form Key
  // পুরো form control করার জন্য
  final _formKey = GlobalKey<FormState>();


  // Controller
  // User কি লিখছে সেটা ধরার জন্য
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Top Bar
      appBar: AppBar(

        title: const Text("Login Page"),

        centerTitle: true,

        backgroundColor: Colors.cyan,
      ),

      // Main Body
      body: Center(

        // Keyboard উঠলে overflow আটকাবে
        child: SingleChildScrollView(

          // Form Widget
          child: Form(

            // Form key connect
            key: _formKey,

            child: Column(

              children: [

                // Top Text
                const Text(

                  "Login with your phone and password",

                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                // Space
                const SizedBox(height: 25),




                // =========================
                // PHONE NUMBER FIELD
                // =========================

                Padding(

                  // Left Right Space
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),

                  child: TextFormField(

                    // Controller connect
                    controller: phoneController,

                    // Number keyboard show করবে
                    keyboardType: TextInputType.phone,

                    // Field Design
                    decoration: InputDecoration(

                      // Grey hint text
                      hintText: "Enter your number",

                      // Upper label
                      labelText: "Phone Number",

                      // Left icon
                      prefixIcon: const Icon(Icons.phone),

                      // Right icon
                      suffixIcon: const Icon(Icons.check),

                      // Label style
                      labelStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),

                      // Border Design
                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    // Validation
                    validator: (value) {

                      // Empty check
                      if (value == null || value.isEmpty) {

                        return "Please enter your phone number";
                      }

                      // Minimum length check
                      else if (value.length < 8) {

                        return "Phone number is too short";
                      }

                      // Valid
                      else {

                        return null;
                      }
                    },
                  ),
                ),

                // Space
                const SizedBox(height: 20),




                // =========================
                // PASSWORD FIELD
                // =========================

                Padding(

                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),

                  child: TextFormField(

                    // Password controller
                    controller: passwordController,

                    // Password hide
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

                    // Password validation
                    validator: (value) {

                      // Empty check
                      if (value == null || value.isEmpty) {

                        return "Please enter password";
                      }

                      // Length check
                      else if (value.length < 6) {

                        return "Password must be at least 6 characters";
                      }

                      // Valid
                      else {

                        return null;
                      }
                    },
                  ),
                ),

                // Space
                const SizedBox(height: 20),




                // =========================
                // LOGIN BUTTON
                // =========================

                SizedBox(

                  width: 300,

                  child: ElevatedButton(

                    onPressed: () {

                      // সব validation check
                      if (_formKey.currentState!.validate()) {

                        // Success message
                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(

                            content: Text("Login Successful"),
                          ),
                        );

                        // Console print
                        print(phoneController.text);

                        print(passwordController.text);
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
