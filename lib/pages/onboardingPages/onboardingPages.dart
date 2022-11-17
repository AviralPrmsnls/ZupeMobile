import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zupe/pages/homePage/homePagemodified.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:zupe/pages/onboardingPages/sections/otpSectionPage.dart';
import 'package:zupe/provider/otpSectionProvider.dart';
import '../../constant/constant.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int initalPage = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Provider.of<OtpSectionProvider>(context).getOtpRequestSent
            ? InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kFloatingbtnColor,
                  size: 22,
                ),
              )
            : SizedBox(),
        backgroundColor: kchatPageColor,
      ),
      backgroundColor: kchatPageColor,
      body: Column(
        children: [
          Container(
            height: h - (MediaQuery.of(context).viewInsets.bottom + 180),
            child: BannerCarousel(
              onPageChanged: (value) {
                setState(() {
                  initalPage = value;
                });
              },
              pageController: pageController,
              margin: EdgeInsets.zero,
              customizedBanners: [
                OtpSection(),
              ],
              customizedIndicators: const IndicatorModel.animation(
                  width: 20, height: 7, spaceBetween: 4, widthAnimation: 50),
              height: h - 200,
              activeColor: kFloatingbtnColor,
              disableColor: Color.fromRGBO(173, 255, 0, .4),
              animation: true,
              borderRadius: 0,
              width: w,
              indicatorBottom: false,
            ),
          ),
          SizedBox(
            height: 55,
            child: Provider.of<OtpSectionProvider>(context).getOtpRequestSent
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Material(
                      color: Provider.of<OtpSectionProvider>(context)
                              .getMobileNumberEntered
                          ? kFloatingbtnColor
                          : Color.fromRGBO(62, 62, 62, 1),
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          if (initalPage == 0) {
                            Provider.of<OtpSectionProvider>(context,
                                    listen: false)
                                .setOtpRequestSent = true;
                          } else {
                            setState(() {
                              if (initalPage < 2) {
                                initalPage++;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePageModified()),
                                );
                              }
                            });
                            pageController.animateToPage(initalPage,
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Container(
                          height: 45,
                          width: w - 96,
                          decoration: const BoxDecoration(
                              // color: Colors.white,
                              ),
                          child: Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: "Satoshi",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Provider.of<OtpSectionProvider>(context)
                                        .getMobileNumberEntered
                                    ? Colors.black
                                    : Color.fromRGBO(172, 172, 172, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Terms & Privacy Policy",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w300,
                fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
