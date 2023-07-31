import 'package:flutter/material.dart';
import 'package:integrationapi/Models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ),
        centerTitle: true,
        backgroundColor: const Color(0xFF271237),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/img_11.png'),
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(Icons.person, 'Name', user.name),
          _buildDetailRow(Icons.email, 'Email', user.email),
          // Add any additional information or widgets you want to show here
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Text(
          detail,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
