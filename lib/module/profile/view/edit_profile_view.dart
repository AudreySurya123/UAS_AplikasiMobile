import 'package:flutter/material.dart';
import '../../../db_helper.dart';

class EditProfileView extends StatefulWidget {
  final String currentUsername;

  const EditProfileView({Key? key, required this.currentUsername}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.currentUsername;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username TextField
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
              SizedBox(height: 16.0),
              // Email TextField
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
              SizedBox(height: 16.0),
              // Password TextField
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  // Handle saving profile changes to the database
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  Map<String, dynamic> updatedUser = {
                    'name': username,
                    'email': email,
                    'password': password,
                  };

                  await DBHelper.instance.updateUser(widget.currentUsername, updatedUser);

                  // For simplicity, we'll just pop the screen for now
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}