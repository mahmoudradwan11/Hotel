import 'package:flutter/material.dart';

class GermanyHotels{
  String? name;
  String? price;
  String? rite;
  String? image;
  String? description;
  String? location;
  double? locationRite;
  double? service;
  double?clean;
  double?value;
  GermanyHotels({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.rite,
    required this.location
  });
  GermanyHotels.fromJson(Map<String, dynamic> json) {
    name =  json['Name'];
    description = json['Description'];
    rite = json['Rite'];
    price = json['Price'];
    image =json['Image'];
    location = json['Location'];
    locationRite = json['Location rite'];
    service = json['Service'];
    clean = json['Cleanliness'];
    value = json['Value'];
  }
  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Image':image,
      'Description': description,
      'Rite':rite,
      'Price':price,
      'Location':location,
      'Location rite':locationRite,
      'Service':service,
      'Cleanliness':clean,
      'Value':value,
    };
  }
}