import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:realink/utils/filter.dart';
import 'package:realink/utils/filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xffFECBA8),
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
          //-----notification-Button on top-----
          Positioned(
              right: 20.w,
              top: 55.h,
              child: Container(
                width: 40.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: const Color(0xffFE9B7A).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.notifications,
                    size: 25.sp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.push('/Notification');
                  },
                ),
              )),
          //-----Data------
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  buildHeader(),
                  SizedBox(height: 20.h),
                  buildSearchAndFilter(context),
                  SizedBox(height: 20.h),
                  buildCategoryIcons(context),
                ],
              ),
            ),
          ),
          //----Rectangle on bottom-----
          Positioned(
            bottom: 0,
            child: Container(
              width: 412.w,
              height: 520.h,
              decoration: BoxDecoration(
                color: const Color(0xffFFFEFD),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.r),
                  topLeft: Radius.circular(25.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // -----Special for you section (Horizontal Scroll)-----
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Special for you',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'see all',
                              style: TextStyle(color: Colors.deepOrangeAccent),
                            ),
                          ],
                        ),
                      ),
                      // -----(Horizontal Scroll)-----
                      SizedBox(
                        height: 250.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 260.w,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15.r)),
                                      child: Image.asset(
                                        'assets/images/house.png',
                                        height: 120.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Imarat Apartment',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 30.w),
                                              const Text(
                                                '650',
                                                style: TextStyle(
                                                    color: Colors.deepOrange),
                                              ),
                                              const Text('sqft'),
                                            ],
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on,
                                                  size: 16.sp),
                                              SizedBox(width: 5.w),
                                              const Text('PWD, Islamabad'),
                                            ],
                                          ),
                                          SizedBox(height: 12.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.bed, size: 20.sp),
                                              SizedBox(width: 4.w),
                                              const Text('2'),
                                              SizedBox(width: 50.w),
                                              Icon(Icons.bathtub, size: 20.sp),
                                              SizedBox(width: 4.w),
                                              const Text('2'),
                                              SizedBox(width: 50.w),
                                              Icon(Icons.garage, size: 20.sp),
                                              SizedBox(width: 4.w),
                                              const Text('1'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Text(
                          'Featured Properties',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // -----ListTiles-----
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'assets/images/house.png',
                                  width: 100.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Furnished House',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      SizedBox(width: 5.w),
                                      const Text('PWD, Islamabad'),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        '40,000',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      Text('/month'),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: const Column(
                                children: [
                                  Icon(Icons.star),
                                  Text('4.2'),
                                ],
                              ),
                            ),
                            // Repeat ListTile for other properties
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'assets/images/house.png',
                                  width: 100.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Hotels',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      SizedBox(width: 5.w),
                                      const Text('PWD, Islamabad'),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        '40,000',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      Text('/month'),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: const Column(
                                children: [
                                  Icon(Icons.star),
                                  Text('4.2'),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'assets/images/house.png',
                                  width: 100.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Apartments',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      SizedBox(width: 5.w),
                                      const Text('PWD, Islamabad'),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        '40,000',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      Text('/month'),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: const Column(
                                children: [
                                  Icon(Icons.star),
                                  Text('4.2'),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'assets/images/house.png',
                                  width: 100.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Commercial',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      SizedBox(width: 5.w),
                                      const Text('PWD, Islamabad'),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        '40,000',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      Text('/month'),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: const Column(
                                children: [
                                  Icon(Icons.star),
                                  Text('4.2'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Hello\nSamuel Tan 👋",
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      const Text("Let's find the best Real Estate with us!"),
    ],
  );
}

Widget buildSearchAndFilter(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(6.0.w),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search your property...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilterScreen()),
            );
          },
          child: Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(
              child: Icon(Icons.filter_alt, color: Colors.white, size: 30.sp),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildCategoryIcons(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 10.w, right: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            print('House Icon is clicked');
          },
          child: buildCategoryIcon(Icons.home, 'House'),
        ),
        GestureDetector(
          onTap: () {
            print('Office Icon is clicked');
          },
          child: buildCategoryIcon(Icons.business, 'Office'),
        ),
        GestureDetector(
          onTap: () {
            print('Hotel Icon is clicked');
          },
          child: buildCategoryIcon(Icons.hotel, 'Hotel'),
        ),
        GestureDetector(
          onTap: () {
            context.go('/CatagoryHotel'); // Navigate to the Apartment route
          },
          child: buildCategoryIcon(Icons.apartment, 'Apartment'),
        ),
      ],
    ),
  );
}

Widget buildCategoryIcon(IconData icon, String label) {
  return Column(
    children: [
      Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: 30.sp, color: Colors.black),
        ),
      ),
      SizedBox(height: 5.h),
      Text(
        label,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
