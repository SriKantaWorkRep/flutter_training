import 'package:dealdox_integrated/common/widgets/Registration.dart';
import 'package:dealdox_integrated/common/widgets/create_a_pin.dart';
import 'package:dealdox_integrated/common/widgets/reset_password.dart';
import 'package:dealdox_integrated/common/widgets/reset_your_password.dart';
import 'package:dealdox_integrated/common/widgets/splash.dart';
import 'package:dealdox_integrated/common/widgets/welcome_back.dart';
import 'package:dealdox_integrated/common/widgets/welcome_back_pin.dart';
import 'package:go_router/go_router.dart';

import '../widgets/carousal_screen.dart';
import '../widgets/validate_otp.dart';

final GoRouter routes=GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: "/",builder: ((context,state)=>Splash())),
    GoRoute(path: "/registration",builder: ((context,state)=>Registration())),
    GoRoute(path: "/carousal",builder: ((context,state)=>CarouselScreen())),
    GoRoute(path: "/createpin",builder: ((context,state)=>CreateAPin())),
    GoRoute(path: "/resetpass",builder: ((context,state)=>ResetPass())),
    GoRoute(path: "/resetyourpass",builder: ((context,state)=>ResetYourPass())),
    GoRoute(path: "/validateotp",builder: ((context,state)=>ValidateOTP())),
    GoRoute(path: "/welcome",builder: ((context,state)=>WelcomeBack())),
    GoRoute(path: "/welcomepin",builder: ((context,state)=>WelcomeBackPin())),
  ]
);