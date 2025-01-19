import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jobseek/Alumni%20Screens/alumni_update_profile_page.dart';

class AlumniProfilePage extends StatefulWidget {
  final String token;
  final String alumniId;

  const AlumniProfilePage(
      {super.key, required this.token, required this.alumniId});

  @override
  State<AlumniProfilePage> createState() => _AlumniProfilePageState();
}

class _AlumniProfilePageState extends State<AlumniProfilePage> {
  Map<String, dynamic>? _profile;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final String apiUrl =
        'https://aluminiapi-ugxk.onrender.com/api/alumni/${widget.alumniId}';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _profile = jsonDecode(response.body);
          _isLoading = false;
        });
      } else if (response.statusCode == 404) {
        setState(() {
          _errorMessage = jsonDecode(response.body)['message'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Unexpected error occurred';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  void _navigateToUpdatePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlumniUpdateProfilePage(
          token: widget.token,
          alumniId: widget.alumniId,
          profile: _profile!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Profile'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name: ${_profile!['full_name']}',
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text('Year of Passing: ${_profile!['year_of_passing']}',
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text('Domain: ${_profile!['domain']}',
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text(
                          'Company/Startup: ${_profile!['company_name_or_startup']}',
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text('Email: ${_profile!['email']}',
                          style: const TextStyle(fontSize: 18)),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _navigateToUpdatePage,
                        child: const Text('Update Profile'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
