import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xffFECBA8),
            ),
            //-----Back-Button on top-----
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
                      if (Navigator.canPop(context)) {
                        print("Popping route");
                        Navigator.pop(context);
                      } else {
                        print("No routes to pop");
                      }
                    }),
              ),
            ),
            //----Circles on right-----
            Positioned(
              right: -45.w,
              top: -33.h,
              child: Container(
                width: 220.w,
                height: 220.h,
                decoration: const BoxDecoration(
                  color: Color(0xffFED9BE),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            //----Circles on right-----
            Positioned(
              right: -20.w,
              top: -15.h,
              child: Container(
                width: 170.w,
                height: 170.h,
                decoration: const BoxDecoration(
                  color: Color(0xffFEDCC3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            //----Rectangle on bottom-----
            Positioned(
              bottom: 0,
              child: Container(
                width: 412.w,
                height: 730.h,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFEFD),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        //-----Title----
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                'Welcome to ',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Lesta.',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffFF7E5F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        //-----Heading-----
                        Text(
                          'Enter your registered email address or phone number to log in',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20.h),
                        //-----Email-----
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email or phone number'),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email or phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        //-----Password-----
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password'),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                            suffixIcon: const Icon(Icons.visibility_off),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        //-----forget button-----
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // forgot action
                            },
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        //-----Login button-----
                        SizedBox(
                          width: 350.w,
                          height: 60.h,
                          child: ElevatedButton(
                            onPressed: () {
                              context.push('/Home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 126, 95, 1),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0.r),
                              ),
                            ),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.1,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                'or',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.1,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        //-----login from google-----
                        SizedBox(
                          width: 350.w,
                          height: 60.h,
                          child: TextButton(
                            onPressed: () {
                              // Google login logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 55.w,
                                  child: Image.asset(
                                      'assets/images/google_logo.png'),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Log In with Google',
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //-----Sign up-----
                        Padding(
                          padding: EdgeInsets.only(top: 70.h, left: 80.w),
                          child: Row(
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.black54),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go('/SignUp');
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
