import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../Models/users_model.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersLoadedEvent, UsersState> {
  UsersBloc() : super(UsersLoadingState()) {
    on<UsersLoadedEvent>((event, emit) async{
      try {
        emit(UsersLoadingState());
        var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
        if(response.statusCode==200){
          emit(UsersLoadedState(usersModelFromJson(response.body)));
        }
        else{
          throw Exception("Failed to load Users Data");
        }
      }catch(e) {
        emit(UsersErrorState(e.toString()));
      }
    });
  }
}




























