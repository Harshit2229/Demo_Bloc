import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrationapi/Models/user.dart';
import '../crud/user_list_bloc.dart';
import 'crud_detail.dart';

class CRUDScreen extends StatefulWidget {
  const CRUDScreen({Key? key}) : super(key: key);

  @override
  _CRUDScreenState createState() => _CRUDScreenState();
}

class _CRUDScreenState extends State<CRUDScreen> {
  late UserListBloc _userListBloc;
  final Map<String, String> nameMap = {};
  final Map<String, String> emailMap = {};
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _userListBloc = BlocProvider.of<UserListBloc>(context);
  }

  @override
  void _showUserDetails(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          "Add User Detail",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF271237),
      ),

      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return GestureDetector(
                  onTap: () => _showUserDetails(user),
              child: Card(
                color: const Color(0xFFCFBFD9),
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editUser(user),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteUser(user),
                      ),
                    ],
                  ),
                ),
              ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF271237),
        onPressed: _addUser,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addUser() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final newUser = User(
                  name: name,
                  email: email,
                  id: DateTime.now().millisecondsSinceEpoch.toString(), image: '',
                );
                _userListBloc.add(AddUser(user: newUser));
                nameMap[newUser.id] = name;
                emailMap[newUser.id] = email;
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editUser(User user) {
    final int userIndex = _userListBloc.state.users.indexOf(user);
    showDialog(
      context: context,
      builder: (context) {
        name = nameMap[user.id] ?? user.name;
        email = emailMap[user.id] ?? user.email;
        return AlertDialog(
          title: const Text('Edit User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                controller: TextEditingController(text: name),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                controller: TextEditingController(text: email),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final updatedUser = User(
                  id: user.id,
                  name: name,
                  email: email,
                  image: '',
                );
                _userListBloc.add(UpdateUser(user: updatedUser, userIndex: userIndex));
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${user.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                _userListBloc.add(DeleteUser(user: user));
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
