import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/bloc_providers/user_cubit/user_cubit.dart';
import 'package:hr_app/features/splash/view.dart';

import 'core/route_utils/route_utils.dart';
import 'system_design/colors/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      child: const SplashView(),
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(create: (_) => UserCubit()),
        ],
        child: MaterialApp(
          title: 'Hr app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            hoverColor: Colors.transparent,
            fontFamily: "lotta",
            scaffoldBackgroundColor: AppColors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            primaryColor: AppColors.primary,
          ),
          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
          home: child,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: [
            // const Locale('ar'),
            const Locale('en'),
            // const Locale('ar')
          ],
          locale: context.locale,
        ),
      ),
    );
  }
}
