import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _searchResults = [];

  void _performSearch(String query) {
    // Dummy search logic, replace with actual search logic
    List<String> allProperties = [
      'New House in PWD, Islamabad',
      'Furnished House in DHA, Lahore',
      'New House in Bahria Town, Rawalpindi',
      'Luxury Villa in E-11, Islamabad',
      'Modern House in Gulberg, Lahore',
      'Stylish Home in Clifton, Karachi',
    ];

    setState(() {
      _searchResults = allProperties
          .where((property) =>
              property.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Increase height here
        child: AppBar(
          backgroundColor: const Color(0xFFFFE4D4), // Light peach color
          elevation: 0,
          leading: CupertinoButton(
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
          flexibleSpace: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 50, // Increase the height of the search bar
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onChanged: (value) {
                  _performSearch(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Apartments in DHA Phase 5',
                  hintStyle: TextStyle(color: Color(0xFF5A6C64)),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF5A6C64)),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(top: 12), // Center the text vertically
                ),
                style: const TextStyle(color: Color(0xFF5A6C64)),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_searchResults.length} Result${_searchResults.length != 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF344356),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Filter logic here
                  },
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFE9B7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            size: 100, // Adjust icon size as needed
                            color: Color(0xFFB0B8B9),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Page Not Found',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFB0B8B9),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_searchResults[index]),
                          textColor: const Color(0xFF344356),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
