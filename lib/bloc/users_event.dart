part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [] ;
}


class UsersLoadedEvent extends Equatable{
  @override
  List<Object?> get props => [];
}