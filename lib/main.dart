import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrationapi/repo/users_repo.dart';

import 'Screens/my_home_screen.dart';
import 'bloc/users_bloc.dart';
import 'crud/user_list_bloc.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => UserListBloc())],
      child: MaterialApp(
        title: 'CRUD using bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomeScreen(),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UsersBloc(UsersRepo()),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomeScreen(),
//       ),
//     );
//   }
// }

