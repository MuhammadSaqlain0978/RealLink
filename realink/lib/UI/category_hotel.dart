import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../Model/ApartmentModel.dart';

class CategoryHotel extends StatefulWidget {
  const CategoryHotel({super.key});

  @override
  State<CategoryHotel> createState() => _CategoryHotelState();
}

class _CategoryHotelState extends State<CategoryHotel> {
  List<ApartmentModel> apartments = [];

  @override
  void initState() {
    super.initState();
    fetchApartments();
  }

  Future<void> fetchApartments() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/30ed6ec7-9221-4483-bea6-8c27af6944b9'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        apartments = data.map((json) => ApartmentModel.fromJson(json)).toList();
      });
    } else {
      print('Failed to load apartments');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.1),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFFB079),
                const Color(0xFFFFB079).withOpacity(0.25),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
              child: Text(
                'Apartments',
                style: TextStyle(
                  fontFamily: 'DMSans-Regular',
                  fontSize: screenSize.width * 0.07,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
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
                      context.go('/home');
                    }),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.push('/Filter');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.filter_list_alt,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            context.push('/Search');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  _buildInformationDrawer(context),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: apartments.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: apartments.length,
                      itemBuilder: (context, index) {
                        final apartment = apartments[index];
                        return ApartmentCard(
                            apartment: apartment, screenSize: screenSize);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationDrawer(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Notifications'),
            onTap: () {
              context.push('/Notification');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Help Center'),
            onTap: () {
              context.push('/Help');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('FAQs'),
            onTap: () {
              context.push('/FAQs');
            },
          ),
        ],
      ),
    );
  }
}

class ApartmentCard extends StatelessWidget {
  final ApartmentModel apartment;
  final Size screenSize;

  const ApartmentCard(
      {super.key, required this.apartment, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(screenSize.width * 0.02),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                apartment.hotelImage,
                height: screenSize.height * 0.2, // Responsive height
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    apartment.hotelTitle,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '${apartment.price} /month',
                  style:
                      const TextStyle(color: Colors.redAccent, fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 3.0),
                Text(
                  apartment.location,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.bedroom_parent_outlined),
                const SizedBox(width: 7),
                Text(
                  '${apartment.bedrooms}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 30),
                const Icon(Icons.bathroom_outlined),
                const SizedBox(width: 7),
                Text(
                  ' ${apartment.washrooms}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 30),
                const Icon(Icons.location_city_outlined),
                const SizedBox(width: 7),
                Text(
                  '${apartment.area} sqft',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
