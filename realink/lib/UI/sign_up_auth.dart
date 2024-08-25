import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class SignUpAuth extends StatefulWidget {
  const SignUpAuth({super.key});

  @override
  State<SignUpAuth> createState() => _SignUpAuthState();
}

class _SignUpAuthState extends State<SignUpAuth> {
  final TextEditingController _inputController = TextEditingController();
  bool _isAllFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _inputController.addListener(_checkAllFieldsFilled);
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _checkAllFieldsFilled() {
    setState(() {
      _isAllFieldsFilled = _inputController.text.length == 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 40.h,
              left: 20.w,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFF7E5F).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12)),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    CupertinoIcons.back,
                    size: 28.sp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 610.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 66.h,
                          ),
                          Image.asset(
                            "assets/images/signup_conf.png",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Enter the code we sent via SMS to your registered phone",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff555568),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Pinput(
                            length: 4,
                            controller: _inputController,
                            defaultPinTheme: PinTheme(
                                margin: EdgeInsets.all(8.w),
                                width: 50.w,
                                height: 50.h,
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                      color: const Color(0xff979BB5)
                                          .withOpacity(0.6)),
                                )),
                            submittedPinTheme: PinTheme(
                                margin: EdgeInsets.all(8.w),
                                width: 50.w,
                                height: 50.h,
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: Colors.grey),
                                )),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            "I didn’t receive the code",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff555568),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //logic here
                            },
                            child: Text(
                              "RESEND CODE",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffFF7E5F),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 130.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 48.h,
                            child: InkWell(
                              onTap: _isAllFieldsFilled
                                  ? () {
                                      //logic here
                                    }
                                  : null,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: _isAllFieldsFilled
                                      ? const LinearGradient(
                                          colors: [
                                            Color(0xffFF7E5F),
                                            Color(0xffFEB079),
                                          ],
                                        )
                                      : const LinearGradient(
                                          colors: [
                                            Color(0xffFFDEB3),
                                            Color(0xffFFC97D),
                                          ],
                                        ),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Continue",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 87.h)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
