import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = const RangeValues(0, 100000);
  RangeValues _sizeRange = const RangeValues(600, 2080);
  int? _selectedRooms;
  int? _selectedBathrooms;
  List<bool> _propertyTypes = [true, false, false, false];
  final List<bool> _starRatings = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFE0B2), Color(0xFFFFCC80)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        title: const Text(
          "Filter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFFAB91),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Property Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10, // Adjusts the spacing between buttons
              runSpacing: 10, // Adjusts the spacing between rows
              children: List<Widget>.generate(4, (index) {
                return ChoiceChip(
                  label: Text(
                    ['All', 'House', 'Apartment', 'Office'][index],
                    style: const TextStyle(fontSize: 16),
                  ),
                  selected: _propertyTypes[index],
                  onSelected: (bool selected) {
                    setState(() {
                      if (index == 0) {
                        _propertyTypes = [true, false, false, false];
                      } else {
                        _propertyTypes[0] = false;
                        _propertyTypes[index] = selected;
                      }
                    });
                  },
                  selectedColor: Colors.orange[100],
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text("Price Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: CustomPaint(
                painter: GraphPainter(_priceRange),
                child: Container(),
              ),
            ),
            const SizedBox(height: 20),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 100000,
              divisions: 1000,
              labels: RangeLabels(
                "\$${_priceRange.start.round()}",
                "\$${_priceRange.end.round()}",
              ),
              activeColor: Colors.orange,
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Rooms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: List.generate(6, (index) {
                return ChoiceChip(
                  label:
                      Text(index == 0 ? 'Any' : (index < 5 ? '$index' : '5+')),
                  selected: _selectedRooms == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedRooms = selected ? index : null;
                    });
                  },
                  selectedColor:
                      Colors.orange[100], // Orange color when selected
                  backgroundColor:
                      Colors.white, // Default color when not selected
                  elevation: 2,
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text("Bathrooms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: List.generate(6, (index) {
                return ChoiceChip(
                  label:
                      Text(index == 0 ? 'Any' : (index < 5 ? '$index' : '5+')),
                  selected: _selectedBathrooms == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedBathrooms = selected ? index : null;
                    });
                  },
                  selectedColor:
                      Colors.orange[100], // Orange color when selected
                  backgroundColor:
                      Colors.white, // Default color when not selected
                  elevation: 2,
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text("Property Size",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            RangeSlider(
              values: _sizeRange,
              min: 600,
              max: 2080,
              divisions: 1480,
              labels: RangeLabels(
                "${_sizeRange.start.round()} sqft",
                "${_sizeRange.end.round()} sqft",
              ),
              activeColor: Colors.orange,
              onChanged: (RangeValues values) {
                setState(() {
                  _sizeRange = values;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Star Range",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Column(
              children: List.generate(5, (index) {
                return Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(index + 1, (starIndex) {
                          return const Icon(Icons.star, color: Colors.orange);
                        }),
                      ),
                    ),
                    Checkbox(
                      value: _starRatings[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _starRatings[index] = value ?? false;
                        });
                      },
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Apply filter logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Apply Filter",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final RangeValues values;

  GraphPainter(this.values);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Get the X positions corresponding to the start and end of the price range.
    double startX = values.start / 100000 * size.width;
    double endX = values.end / 100000 * size.width;

    // Height is scaled based on the range values.
    double startY = size.height - (values.start / 100000 * size.height);
    double endY = size.height - (values.end / 100000 * size.height);

    // Create a stepped path graph (horizontal, vertical lines)
    Path path = Path();
    path.moveTo(0, size.height); // Bottom left
    path.lineTo(startX, startY); // Step to start value
    path.lineTo(endX, startY); // Horizontal step to the end value's x
    path.lineTo(endX, endY); // Vertical step to the end value

    path.lineTo(size.width, size.height); // Connect to the bottom right

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
