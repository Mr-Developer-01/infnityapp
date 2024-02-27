import 'dart:convert';
import 'package:tribb/screens/constant/colors.dart';
import 'package:flutter/material.dart';
class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final VoidCallback onChangePic;

   const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
    required this.onChangePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = const Base64Decoder().convert(imagePath);

    return 
    ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Image.memory(
         image,
          fit: BoxFit.cover,
          width: 70,
          height: 70,
        ),
      ),
    );
    
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 2,
        child: buildCircle(
          color: ColorsClass.themeColor,
          all: 7,
          child: InkWell(
    onTap: onChangePic,
    child: const Icon(Icons.edit, size: 18.0, color: Colors.white,),
)
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
