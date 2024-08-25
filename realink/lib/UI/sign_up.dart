import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//import 'package:sign_up/sign_up_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  bool _isPasswordVisible = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _isAllFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    //listeners to the controllers to check if fields are filled
    _fullNameController.addListener(_checkIfAllFieldsFilled);
    _emailController.addListener(_checkIfAllFieldsFilled);
    _passwordController.addListener(_checkIfAllFieldsFilled);
    _phoneNumberController.addListener(_checkIfAllFieldsFilled);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _checkIfAllFieldsFilled() {
    setState(() {
      _isAllFieldsFilled = _fullNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          _emailController.text.contains('@') &&
          _passwordController.text.contains(RegExp(r'[A-Z]')) &&
          _passwordController.text.contains(RegExp(r'[a-z]')) &&
          number.phoneNumber != null;
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
                    context.pop();
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 700.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Text(
                              "Create your account",
                              style: GoogleFonts.dmSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff1F244B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Please enter your data to create account",
                            style: GoogleFonts.dmSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff555568),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),
                        // Full Name Field
                        _buildTextField("Full Name*", "Enter your full name",
                            _fullNameController),
                        SizedBox(height: 16.h),
                        // Phone Number Field
                        _buildPhoneNumberField(),
                        SizedBox(height: 16.h),
                        // Email Field
                        _buildTextField("Email*", "Enter your email address",
                            _emailController),
                        SizedBox(height: 16.h),
                        // Password Field
                        _buildTextField("Password*", "Enter your password",
                            _passwordController,
                            isPassword: true),
                        SizedBox(height: 32.h),
                        // Continue Button with Gradient
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: InkWell(
                            onTap: _isAllFieldsFilled
                                ? () {
                                    context.go('/SignUpOTP');
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
                        SizedBox(height: 25.h),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey[300],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "or",
                                style: GoogleFonts.dmSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        // Google Sign Up Button
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Handle login logic here
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(right: 48.w),
                              child: Image.asset(
                                'assets/images/google_logo.png',
                              ),
                            ),
                            label: Text(
                              "Sign Up with Google",
                              style: GoogleFonts.dmSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff555568),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.push('/Login');
                              },
                              child: Text(
                                'Login In',
                                style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffFF7E5F),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
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

  // Custom text field
  Widget _buildTextField(
      String label, String hint, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff555568),
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: isPassword && !_isPasswordVisible,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xff979BB5).withOpacity(0.6),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff979BB5),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0x99555568),
            ),
          ),
        ),
      ],
    );
  }

  // Custom phone number input field
  Widget _buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number*",
          style: GoogleFonts.dmSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff555568),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff979BB5).withOpacity(0.6),
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            children: [
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  setState(() {
                    this.number = number;
                    _checkIfAllFieldsFilled();
                  });
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                  showFlags: false,
                  useEmoji: false,
                ),
                searchBoxDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                initialValue: number,
                textFieldController: _phoneNumberController,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: false,
                ),
                inputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  hintText: "Enter your phone number",
                  hintStyle: GoogleFonts.dmSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0x99555568),
                  ),
                ),
                inputBorder: InputBorder.none,
              ),
              Positioned(
                left: 120.w, // Adjust this value based on your layout
                top: 0.h, // Adjust this value based on your layout
                bottom: 0.h, // Adjust this value based on your layout
                child: Container(
                  width: 1.w, // Thickness of the line
                  color: const Color(0xff979BB5).withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
