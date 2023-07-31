import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrationapi/bloc/users_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    context.read<UsersBloc>().add(UsersLoadedEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get User Detail",
          style: TextStyle(color: Colors.white), // Set the text color for the app bar title
        ),
        centerTitle: true, // Center the title
        backgroundColor: const Color(0xFF271237), // You can change this color as you like
        leading: Image.asset('assets/images/img_8.png', width: 2,
          height: 2,), // Replace 'assets/logo.png' with your image path
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.usersModel.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  // color: const Color(0xFFC194CC),
                  color: const Color(0xFFCFBFD9),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add margin
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Add rounded corners
                    side: BorderSide(color: Colors.grey.shade300), // Add border color
                  ),
                  child: ListTile(
                    leading: Text(state.usersModel[index].name.toString()),
                  ),
                );
              },
            );
          } else if (state is UsersErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
      backgroundColor: Colors.white, // You can change this color as you like
    );
  }
}
