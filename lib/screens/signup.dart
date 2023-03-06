import 'package:ara/components/my_button.dart';
import 'package:ara/components/my_textfield.dart';
import 'package:ara/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUp extends StatelessWidget {
  SignUp ({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),

                    GradientText(
                      'Ara', style: TextStyle(
                        fontFamily: 'Inspiration',
                        fontSize: 120,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900
                    ),
                      colors: [
                        Colors.purple,
                        Colors.red,
                        Colors.blueAccent,
                      ],
                    ),

                    const SizedBox(height: 20),

                    MyTextField(
                      controller: nameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    MyTextField(
                      controller: contactController,
                      hintText: 'Contact no.',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    MyButton(
                      onTap: (){},
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // google button
                        SquareTile(imagePath: 'images/google.png'),

                        SizedBox(width: 15),

                      ],
                    ),

                    const SizedBox(height: 30),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'SignUp now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )

                  ])
          ),

        ) );
  }
}
