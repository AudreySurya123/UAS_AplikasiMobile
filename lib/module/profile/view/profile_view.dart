import 'package:flutter/material.dart';
import 'edit_profile_view.dart';
import '../../../db_helper.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<List<Map<String, dynamic>>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = DBHelper.instance.getUsers(); // Fetch user data from the database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Display a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var userData = snapshot.data as List<Map<String, dynamic>>;
            var username = userData.isNotEmpty ? userData[0]['name'] : 'N/A';
            var email = userData.isNotEmpty ? userData[0]['email'] : 'N/A';

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Username: $username',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Email: $email',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the edit profile view with the current username
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileView(currentUsername: username),
                          ),
                        );
                      },
                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}