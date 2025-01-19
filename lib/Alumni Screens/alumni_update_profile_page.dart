import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlumniUpdateProfilePage extends StatefulWidget {
  final String token;
  final String alumniId;
  final Map<String, dynamic> profile;

  const AlumniUpdateProfilePage({
    super.key,
    required this.token,
    required this.alumniId,
    required this.profile,
  });

  @override
  State<AlumniUpdateProfilePage> createState() =>
      _AlumniUpdateProfilePageState();
}

class _AlumniUpdateProfilePageState extends State<AlumniUpdateProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _yearController;
  late TextEditingController _domainController;
  late TextEditingController _companyController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile['full_name']);
    _yearController =
        TextEditingController(text: widget.profile['year_of_passing']);
    _domainController = TextEditingController(text: widget.profile['domain']);
    _companyController =
        TextEditingController(text: widget.profile['company_name_or_startup']);
    _emailController = TextEditingController(text: widget.profile['email']);
  }

  Future<void> _updateProfile() async {
    final String apiUrl =
        'https://aluminiapi-ugxk.onrender.com/api/alumni/${widget.alumniId}';

    final Map<String, String> requestBody = {
      "full_name": _nameController.text,
      "year_of_passing": _yearController.text,
      "domain": _domainController.text,
      "company_name_or_startup": _companyController.text,
      "email": _emailController.text,
    };

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'])),
        );
        Navigator.pop(context);
      } else {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'] ?? 'Update failed')),
        );
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
        title: const Text('Update Alumni Profile'),
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
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                ),
                TextFormField(
                  controller: _yearController,
                  decoration:
                      const InputDecoration(labelText: 'Year of Passing'),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter the year of passing'
                      : null,
                ),
                TextFormField(
                  controller: _domainController,
                  decoration: const InputDecoration(labelText: 'Domain'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your domain' : null,
                ),
                TextFormField(
                  controller: _companyController,
                  decoration:
                      const InputDecoration(labelText: 'Company/Startup'),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your company/startup'
                      : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your email' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _updateProfile();
                    }
                  },
                  child: const Text('Update Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
