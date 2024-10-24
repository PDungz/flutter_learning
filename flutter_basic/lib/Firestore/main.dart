import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/apis/dio_client.dart';
import 'core/theme/my_theme.dart';
import 'features/auth/login/login_screen.dart';
import 'features/home/data/datasources/movie_remote_data_source.dart';
import 'features/home/data/repositories/movie_repository_impl.dart';
import 'features/home/domain/usecases/global_info_usecases.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/home/presentation/logic_holders/global_info_bloc/global_info_bloc.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'root_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalInfoBloc>(
      create: (_) => GlobalInfoBloc(
        GlobalInfoUsecases(MovieRepositoryImpl(
            remoteDataSource: MovieRemoteDataSourceImpl(dio: DioClient().dio))),
      )..add(GetGlobalInfo()),
      child: MaterialApp(
        theme: MyTheme.darkTheme(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const LoginScreen());
            case 'home':
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            // case 'forgot-password':
            //   return MaterialPageRoute(
            //       builder: (_) => const ForgotPasswordScreen());
            case 'profile':
              return MaterialPageRoute(builder: (_) => const ProfileScreen());
            default:
            // return MaterialPageRoute(builder: (_) => const NotFoundPage());
          }
          return null;
        },
        home: const RootPage(),
      ),
    );
  }
}

// NowPlayingMoviesScreen()
