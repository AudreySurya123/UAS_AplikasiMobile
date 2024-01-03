import 'package:flutter/material.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Username: Audrey Surya',
                style: TextStyle(fontSize: 20.0, color: Colors.black), // Set text color to black
              ),
              SizedBox(height: 16.0),
              Text(
                'Email: surya16@gmail.com',
                style: TextStyle(fontSize: 20.0, color: Colors.black), // Set text color to black
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the edit profile view with the current username
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileView(currentUsername: 'YourUsername'),
                    ),
                  );
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}