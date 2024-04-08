import 'package:tribb/screens/constant/colors.dart';
import 'package:flutter/material.dart';

class PropertyData {
  static var projectList = [
    {
      "name": "CONSCIENT HINES",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "2095 – 3395 Sq. Ft.",
      "amount": "3.87 Cr",
      "image":
          "https://i.pinimg.com/564x/60/44/ed/6044edd88afec0f09dbe0c6e50df27e4.jpg",
      "isWishListed": false
    },
    {
      "name": "TRUMP TOWER",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "3525 – 6050 Sq. Ft.",
      "amount": "8.52 Cr",
      "image":
          "https://i.pinimg.com/564x/35/fc/08/35fc08f04ead397a85806147e2a9e4e6.jpg",
      "isWishListed": false
    },
    {
      "name": "MAHINDRA",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "3106 – 5187 Sq. Ft.",
      "amount": "5.20 Cr",
      "image":
          "https://i.pinimg.com/474x/1a/54/d9/1a54d98f61408e226a80506713cfea04.jpg",
      "isWishListed": false
    },
    {
      "name": "CENTRAL PARK ",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "1065 – 1607 Sq. Ft.",
      "amount": "1.85 Cr",
      "image":
          "https://i.pinimg.com/564x/ee/a8/89/eea889eab390905a6104690e2de31237.jpg",
      "isWishListed": false
    },
  ];
  static List<ImageDetails> images = [
    ImageDetails(
      imagePath: 'assets/images/applogo.png',
      price: '\$20.00',
      photographer: 'Martin Andres',
      title: 'New Year',
      details:
          'This image was taken during a party in New York on new years eve. Quite a colorful shot.',
    ),
    ImageDetails(
      imagePath: 'assets/images/background-img.jpg',
      price: '\$10.00',
      photographer: 'Abraham Costa',
      title: 'Spring',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/bg-image.jpg',
      price: '\$30.00',
      photographer: 'Jamie Bryan',
      title: 'Casual Look',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/booking-form.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-1.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-2.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-3.jpg',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-4.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/friend.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/home-loan.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/image.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/off-1.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/off-2.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/off-3.png',
      price: '\$20.00',
      photographer: 'Matthew',
      title: 'Cone Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/possession-form.png',
      price: '\$25.00',
      photographer: 'Martin Sawyer',
      title: 'Pink Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/referfriend.png',
      price: '\$15.00',
      photographer: 'John Doe',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/applogo.png',
      price: '\$20.00',
      photographer: 'Martin Andres',
      title: 'New Year',
      details:
          'This image was taken during a party in New York on new years eve. Quite a colorful shot.',
    ),
    ImageDetails(
      imagePath: 'assets/images/background-img.jpg',
      price: '\$10.00',
      photographer: 'Abraham Costa',
      title: 'Spring',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/bg-image.jpg',
      price: '\$30.00',
      photographer: 'Jamie Bryan',
      title: 'Casual Look',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/booking-form.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-1.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-2.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-3.jpg',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/demo-4.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/friend.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/home-loan.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/image.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/off-1.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/off-2.png',
      price: '\$20.00',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/off-3.png',
      price: '\$20.00',
      photographer: 'Matthew',
      title: 'Cone Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/possession-form.png',
      price: '\$25.00',
      photographer: 'Martin Sawyer',
      title: 'Pink Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/images/referfriend.png',
      price: '\$15.00',
      photographer: 'John Doe',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
  ];
  static var userList = [
    {"name": "Laura Christiansen", "username": "laurachristiansen"},
    {"name": 'Naja Poulsen', "username": "najapoulsen"},
    {"name": 'Lionel Merk', "username": "lionelmerk"},
    {"name": 'Zivan Kojic', "username": "zivankojic"},
    {"name": 'Brad Henderson', "username": "bradhenderson"},
    {"name": 'Jael Mercie', "username": "jaelmercie"},
    {"name": 'Jade Morin', "username": "jademorin"},
    {"name": 'Shambhavi Padmanabha', "username": "shambhavipadmanabha"},
    {"name": 'Nevaeh Jones', "username": "nevaehjones"},
    {"name": 'Zoe Chu', "username": "zoechu"},
    {"name": 'Anmol Hiremath', "username": "anmolhiremath"},
    {"name": 'Siebrand Van Beusichem', "username": "siebrandvan"},
    {"name": 'Hugo Regalado', "username": "hugoregalado"}
  ];
 static var amenities = [
    {
      "isSelected": false,
      "name": 'Reserve Parking',
    },
    {
      "isSelected": false,
      "name": 'Visitor Parking',
    },
    {
      "isSelected": false,
      "name": '24*7 Power Back-Up',
    },
    {
      "isSelected": false,
      "name": 'Lift',
    },
    {
      "isSelected": false,
      "name": 'Jogging Track',
    },
    {
      "isSelected": false,
      "name": 'Cycling Track',
    },
    {
      "isSelected": false,
      "name": 'Intercom',
    },
    {
      "isSelected": false,
      "name": 'Park',
    },
    {
      "isSelected": false,
      "name": 'Community Center',
    },
    {
      "isSelected": false,
      "name": 'Security Personnel',
    },
    {
      "isSelected": false,
      "name": '24*7 Water',
    },
    {
      "isSelected": false,
      "name": 'Maintenance Staff',
    },
    {
      "isSelected": false,
      "name": 'Security / Fire Alarm',
    },
    {
      "isSelected": false,
      "name": 'Club-House',
    },
    {
      "isSelected": false,
      "name": 'Fire-Fighting',
    },
    {
      "isSelected": false,
      "name": 'Badminton Court',
    },
    {
      "isSelected": false,
      "name": 'Cafe Lounge',
    },
    {
      "isSelected": false,
      "name": 'Mini Theatre',
    },
    {
      "isSelected": false,
      "name": 'Squash Court',
    },
    {
      "isSelected": false,
      "name": 'Skating Rink',
    },
    {
      "isSelected": false,
      "name": 'Steam Sauna Bath',
    },
    {
      "isSelected": false,
      "name": 'Yoga & Meditation Area',
    },
    {
      "isSelected": false,
      "name": 'Cricket Practice Pitch',
    },
    {
      "isSelected": false,
      "name": 'Pet Garden',
    },
    {
      "isSelected": false,
      "name": 'Toddler Play Area',
    },
    {
      "isSelected": false,
      "name": 'CCTV',
    },
    {
      "isSelected": false,
      "name": 'GYM',
    },
    {
      "isSelected": false,
      "name": 'Walking/Jogging track',
    },
    {
      "isSelected": false,
      "name": 'Play area',
    },
    {
      "isSelected": false,
      "name": 'Club house',
    },
    {
      "isSelected": false,
      "name": 'Swimming pool',
    },
    {
      "isSelected": false,
      "name": 'Rooftop garden',
    },
    {
      "isSelected": false,
      "name": 'Open deck',
    },
    {
      "isSelected": false,
      "name": 'Sky lounge',
    },
    {
      "isSelected": false,
      "name": 'Spa and salon',
    },
    {
      "isSelected": false,
      "name": 'Concierge services',
    },
    {
      "isSelected": false,
      "name": 'Party hall',
    },
    {
      "isSelected": false,
      "name": 'Temple and religious activity place',
    },
    {
      "isSelected": false,
      "name": 'Cinema hall',
    },
    {
      "isSelected": false,
      "name": 'Wi-Fi connectivity',
    }
  ];
  static var facilitiesList = [
    {
      "name": "Gas",
      "icon": Icon(
        Icons.propane_tank,
        color: ColorsClass.themeColor,
      )
    },
    {
      "name": "Electricity",
      "icon": Icon(
        Icons.tungsten,
        color: ColorsClass.themeColor,
      )
    },
    {
      "name": "Internet",
      "icon": Icon(
        Icons.wifi,
        color: ColorsClass.themeColor,
      )
    },
    {
      "name": "TV",
      "icon": Icon(
        Icons.tv,
        color: ColorsClass.themeColor,
      )
    },
//  {
//    "name":"Refrigerator",
//    "icon":const Icon(Icons.kitchen)
//  },
  ];
}

class ImageDetails {
  final String imagePath;
  final String price;
  final String photographer;
  final String title;
  final String details;
  ImageDetails({
    required this.imagePath,
    required this.price,
    required this.photographer,
    required this.title,
    required this.details,
  });
}
