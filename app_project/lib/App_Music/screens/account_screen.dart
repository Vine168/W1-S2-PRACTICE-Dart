import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  final String userName = "Chim Vine";
  final String userId = "0987654";
  final String userEmail = "chimvine777@gmail.com";
  final String profileImageUrl = "assets/images/profile.jpg"; // Add your profile image path here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Account", style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profileImageUrl),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Profile Information",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProfileInfo("Name", userName),
            _buildProfileInfo("User ID", userId),
            _buildProfileInfo("Email", userEmail),
            _buildProfileInfo("Phone", "+855 884834024"), // Additional information
            _buildProfileInfo("Address", "2004, Phnom Penh, Cambodia"), // Additional information
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement sign-out logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Signed out successfully!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Sign Out", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}