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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get User Detail"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if(state is UsersLoadingState){
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if(state is UsersLoadedState) {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
              return ListTile(
                leading:
                Text(state.usersModel[index].name.toString()),
              );
            });
          } else if (state is UsersErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ));


  }
}
