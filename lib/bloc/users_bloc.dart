import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../Models/users_model.dart';
import '../repo/users_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersLoadedEvent, UsersState> {
  final UsersRepo usersRepo;
  UsersBloc (this.usersRepo) : super(UsersLoadingState()) {
    on<UsersLoadedEvent>((event, emit) async{
      try {
        emit(UsersLoadingState());
        var data =
        await usersRepo.getUsers();
        emit(UsersLoadedState(data));
      }catch(e) {
        emit(UsersErrorState(e.toString()));
      }
    });
  }
}




























