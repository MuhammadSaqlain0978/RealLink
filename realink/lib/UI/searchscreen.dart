import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil

    return Scaffold(
      backgroundColor: const Color(0xffFECBA8),
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
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
                  Navigator.pop(context);
                }),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              context.push('/Notification');
            },
            color: Colors.black,
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: -40.w,
            top: -40.h,
            child: Container(
              width: 220.w,
              height: 220.h,
              decoration: const BoxDecoration(
                color: Color(0xffFED9BE),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -20.w,
            top: -20.h,
            child: Container(
              width: 170.w,
              height: 170.h,
              decoration: const BoxDecoration(
                color: Color(0xffFEDCC3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const SearchBar(),
                SizedBox(height: 20.h),
                buildFilterButton(),
                SizedBox(height: 10.h),
                Text(
                  "8 Results",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView(
                    children: [
                      buildPropertyCard(
                        image: 'assets/images/house1.jpg',
                        title: 'New House',
                        location: 'PWD, Islamabad',
                        price: '45,000',
                        size: '14 Marla',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house2.jpg',
                        title: 'Furnished House',
                        location: 'DHA, Lahore',
                        price: '50,000',
                        size: '2 Marla',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house3.jpg',
                        title: 'New House',
                        location: 'Bahria Town, Rawalpindi',
                        price: '65,000',
                        size: '10 Marla',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house4.jpg',
                        title: 'Luxury Villa',
                        location: 'E-11, Islamabad',
                        price: '100,000',
                        size: '1 Kanal',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house5.jpg',
                        title: 'Modern House',
                        location: 'Gulberg, Lahore',
                        price: '80,000',
                        size: '12 Marla',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house6.jpg',
                        title: 'Stylish Home',
                        location: 'Clifton, Karachi',
                        price: '90,000',
                        size: '15 Marla',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house7.jpg',
                        title: 'Golden House',
                        location: 'Gulberg, Lahore',
                        price: '80,000',
                        size: '10 Marla',
                      ),
                      buildPropertyCard(
                        image: 'assets/images/house8.jpg',
                        title: 'Modern House',
                        location: 'Gulberg, Lahore',
                        price: '90,000',
                        size: '12 Marla',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {
          // Your filter logic here
        },
        icon: const Icon(Icons.filter_list),
        label: const Text('Filter'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFE9B7A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }

  Widget buildPropertyCard({
    required String image,
    required String title,
    required String location,
    required String price,
    required String size,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                image,
                height: 90.h,
                width: 90.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 18, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            '4.6',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. $price /month',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffFE9B7A),
                        ),
                      ),
                      Text(
                        size,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildIconWithText(Icons.bed, '3'),
                      SizedBox(width: 20.w),
                      buildIconWithText(Icons.bathtub, '2'),
                      SizedBox(width: 20.w),
                      buildIconWithText(Icons.garage, '1'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconWithText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey),
        SizedBox(width: 4.w),
        Text(text, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.h),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        hintText: 'Search for houses...',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
      ),
    );
  }
}
