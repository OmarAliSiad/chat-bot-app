import 'package:ai_app/core/themeMode/theme_mode_cubit.dart';
import 'package:ai_app/core/themes/dark_theme.dart';
import 'package:ai_app/core/themes/light_theme.dart';
import 'package:ai_app/screens/chatbot/data/cubit/chat_cubit/chatbot_cubit.dart';
import 'package:ai_app/screens/page_view/preseantion/views/page_view.dart';
import 'package:ai_app/screens/splash/presnation/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeModeCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.light; // Default theme
          if (state is ThemeModeChanged) {
            themeMode = state.themeMode;
          }
          return MaterialApp(
            routes: {
              PageScreen.id: (context) => const PageScreen(),
              SplashView.id: (context) => const SplashView(),
            },
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
