import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:integrationapi/Models/user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitial(users: [])) {
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  void _addUser(AddUser event, Emitter<UserListState> emit) {
    state.users.add(event.user);
    print('User added: ${event.user.name}');
    emit(UserListUpdated(users: state.users));
  }

  void _deleteUser(DeleteUser event, Emitter<UserListState> emit) {
    // Create a copy of the current list and remove the specified user
    final List<User> updatedUsers = List.from(state.users)..remove(event.user);
    emit(UserListUpdated(users: updatedUsers));
  }

  void _updateUser(UpdateUser event, Emitter<UserListState> emit) {
    final List<User> updatedUsers = List.from(state.users);
    if (event.userIndex >= 0 && event.userIndex < updatedUsers.length) {
      final User updatedUser = event.user;
      updatedUsers[event.userIndex] = updatedUser;
      emit(UserListUpdated(users: updatedUsers));
    }
  }

}
