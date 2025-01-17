import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert';
import 'package:jobseek/login_page.dart';

class AlumniRegistrationPage extends StatefulWidget {
  const AlumniRegistrationPage({super.key});

  @override
  State<AlumniRegistrationPage> createState() => _AlumniRegistrationPageState();
}

class _AlumniRegistrationPageState extends State<AlumniRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _yearOfPassingController =
      TextEditingController();
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _registerAlumni() async {
    if (!_formKey.currentState!.validate()) return;

    const String apiUrl =
        'https://aluminiapi-ugxk.onrender.com/api/auth/alumni/register';

    final Map<String, dynamic> requestBody = {
      "full_name": _fullNameController.text,
      "year_of_passing": int.parse(_yearOfPassingController.text),
      "domain": _domainController.text,
      "company_name_or_startup": _companyNameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Alumni registerd successfuly')));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to register : ${response.body}')));
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your full name' : null,
                ),
                TextFormField(
                  controller: _yearOfPassingController,
                  decoration:
                      const InputDecoration(labelText: 'Year of Passing'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your year of passing'
                      : null,
                ),
                TextFormField(
                  controller: _domainController,
                  decoration: const InputDecoration(labelText: 'Domain'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your domain' : null,
                ),
                TextFormField(
                  controller: _companyNameController,
                  decoration:
                      const InputDecoration(labelText: 'Company/Startup'),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your company or startup name'
                      : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your email' : null,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your password' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _registerAlumni,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
