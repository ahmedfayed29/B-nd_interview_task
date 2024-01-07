import 'package:flutter/material.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/auth/login/view.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  void _navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      RouteUtils.navigateAndReplace(LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   Res.people,
            //   fit: BoxFit.fill,
            //   height: 140.height,
            //   width: 120.width,
            // ),
            SizedBox(
              height: 16.height,
            ),
            // Image.asset(
            //   Res.logo,
            //   width: 184.width,
            //   height: 190.height,
            //   fit: BoxFit.fill,
            // ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          // image: DecorationImage(
          //   image: AssetImage(Res.background),
          //   fit: BoxFit.fill,
          // ),
        ),
      ),
    );
  }
}
