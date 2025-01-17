import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert';
import 'package:jobseek/login_page.dart'; // Import for JSON encoding/decoding

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({super.key});

  @override
  State<StudentRegistrationPage> createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _rollnoController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _registerStudent() async {
    if (!_formKey.currentState!.validate()) return;

    const String apiUrl =
        'https://aluminiapi-ugxk.onrender.com/api/auth/student/register';

    final Map<String, String> requestBody = {
      "student_name": _nameController.text,
      "student_id": _studentIdController.text,
      "rollno": _rollnoController.text,
      "enrollment_year": _yearController.text,
      "branch": _branchController.text,
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
            SnackBar(content: Text('Student registerd successfuly')));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to register : ${response.body}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Student Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                ),
                TextFormField(
                  controller: _studentIdController,
                  decoration: const InputDecoration(labelText: 'Student ID'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your student ID' : null,
                ),
                TextFormField(
                  controller: _rollnoController,
                  decoration: const InputDecoration(labelText: 'Roll Number'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your roll number' : null,
                ),
                TextFormField(
                  controller: _yearController,
                  decoration:
                      const InputDecoration(labelText: 'Enrollment Year'),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your enrollment year'
                      : null,
                ),
                TextFormField(
                  controller: _branchController,
                  decoration: const InputDecoration(labelText: 'Branch'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your branch' : null,
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
                  onPressed: _registerStudent,
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
