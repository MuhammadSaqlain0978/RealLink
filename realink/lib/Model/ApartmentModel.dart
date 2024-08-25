class ApartmentModel {
  // Non-nullable fields with required parameters
  final String hotelTitle;
  final String location;
  final num price;
  final num bedrooms;
  final num washrooms;
  final String hotelImage;
  final num area;

  // Constructor with required parameters
  ApartmentModel({
    required this.hotelTitle,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.washrooms,
    required this.hotelImage,
    required this.area,
  });

  // Factory constructor to create an instance from JSON
  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      hotelTitle: json['hotel_title'] as String,
      location: json['location'] as String,
      price: json['price'] as num,
      bedrooms: json['bedrooms'] as num,
      washrooms: json['washrooms'] as num,
      hotelImage: json['hotel_image'] as String,
      area: json['area'] as num,
    );
  }

  // Method to create a copy of the model with updated fields
  ApartmentModel copyWith({
    String? hotelTitle,
    String? location,
    num? price,
    num? bedrooms,
    num? washrooms,
    String? hotelImage,
    num? area,
  }) {
    return ApartmentModel(
      hotelTitle: hotelTitle ?? this.hotelTitle,
      location: location ?? this.location,
      price: price ?? this.price,
      bedrooms: bedrooms ?? this.bedrooms,
      washrooms: washrooms ?? this.washrooms,
      hotelImage: hotelImage ?? this.hotelImage,
      area: area ?? this.area,
    );
  }

  // Method to convert the model instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'hotel_title': hotelTitle,
      'location': location,
      'price': price,
      'bedrooms': bedrooms,
      'washrooms': washrooms,
      'hotel_image': hotelImage,
      'area': area,
    };
  }
}
