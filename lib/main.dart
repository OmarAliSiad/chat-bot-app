import 'package:ai_app/chatbot/data/cubit/chat_cubit/chatbot_cubit.dart';
import 'package:ai_app/chatbot/presentation/chat_bot_screen.dart';
import 'package:ai_app/core/themeMode/theme_mode_cubit.dart';
import 'package:ai_app/core/themes/dark_theme.dart';
import 'package:ai_app/core/themes/light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')], // Add all your supported locales
      path: 'assets/translations', // Path to your translation files
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
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
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            // Add these three lines for EasyLocalization
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const ChatbotScreen(),
          );
        },
      ),
    );
  }
}
