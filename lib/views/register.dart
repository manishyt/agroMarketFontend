import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/controllers/user/register_controller.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _validationMessage = "";
  RegisterController registerController = RegisterController();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 150, 156, 153),
      body: Center(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 235, 225),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      width: 100, // Set the desired width
                      height: 100, // Set the desired height
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors
                            .white, // You can set the background color of the oval
                      ),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "SignUp",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  buildTextField("First Name", _firstNameController),
                  const SizedBox(height: 5),
                  buildTextField("Last Name", _lastNameController),
                  const SizedBox(height: 5),
                  buildTextField("Email", _emailController),
                  const SizedBox(height: 5),
                  buildTextField("Mobile Number", _phoneNumberController),
                  const SizedBox(height: 5),
                  buildTextField("Country", _countryController),
                  const SizedBox(height: 5),
                  buildTextField("City", _cityController),
                  const SizedBox(height: 5),
                  buildTextField("Password", _passwordController,
                      isPassword: true),
                  const SizedBox(height: 5),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // Perform validation
                      if (!validateFields()) {
                        Get.snackbar("Registration Failed",
                            "Please fill all the required fields");
                      } else {
                        try {
                          registerController.registerUser(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              phoneNumber: _phoneNumberController.text,
                              country: _countryController.text,
                              city: _cityController.text,
                              password: _passwordController.text);
                          // ignore: empty_catches
                        } catch (e) {}
                      }
                    },
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _validationMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: const Text("Have an account? Login")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(),
      ),
    );
  }

  bool validateFields() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _countryController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
