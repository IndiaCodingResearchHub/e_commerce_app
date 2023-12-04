import 'package:flutter/material.dart';


class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'),
      ),
      body: _buildUserProfile(),
    );
  }

  Widget _buildUserProfile() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage('https://example.com/user_avatar.jpg'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Surya Prakash',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'suryahaldi@gmail.com',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          SizedBox(height: 16.0),
          _buildProfileInfo('Shipping Address', 'Noida, UP'),
          _buildProfileInfo('Phone Number', '+91 0000000000'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Implement logout logic
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}