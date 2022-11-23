import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/FirstPage.dart';
import 'package:zupe/pages/onboardingPages/onboardingPages.dart';
import 'package:zupe/provider/onboardingProvider/onBoardingProvider.dart';
import 'package:zupe/service/apiService.dart';

class PreHomePage extends StatefulWidget {
  const PreHomePage({super.key});

  @override
  State<PreHomePage> createState() => _PreHomePageState();
}

class _PreHomePageState extends State<PreHomePage> {
  ApiService apiService = ApiService();
  bool isLoading = true;
  bool isLoggedin = false;
  getPref() async {
    final prefs = await SharedPreferences.getInstance();
    Provider.of<PhomeNumberSectionProvider>(context, listen: false)
        .setPhoneNumber = prefs.getString("UserPhone") ?? "";
    Provider.of<ProfileSectionProvider>(context, listen: false).setbase64Dp =
        prefs.getString("base64Dp") ?? "";
    Provider.of<ProfileSectionProvider>(context, listen: false).setuserName =
        prefs.getString("userName") ?? "";
    if (Provider.of<PhomeNumberSectionProvider>(context, listen: false)
            .getPhoneNumber ==
        "") {
      setState(() {
        isLoggedin = false;
        isLoading = false;
      });
    } else {
      var result = await apiService.checkUserIfStillLoggedIn(
          Provider.of<PhomeNumberSectionProvider>(context, listen: false)
              .getPhoneNumber);
      if (result == 200) {
        setState(() {
          isLoggedin = true;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoggedin = false;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return isLoading
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              height: h,
              width: w,
              child: Center(
                child: CircularProgressIndicator(
                  color: kFloatingbtnColor,
                ),
              ),
            ),
          )
        : isLoggedin
            ? FirstPage()
            : OnBoardingPage();
  }
}
