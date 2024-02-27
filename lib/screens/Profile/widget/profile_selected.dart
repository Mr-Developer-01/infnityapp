
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfileSelectedWidget extends StatelessWidget {
  //  XFile selectedFile;
  final VoidCallback onClicked;
  final VoidCallback onChangePic;

   const ProfileSelectedWidget({
    Key? key,
    //  required this.selectedFile,
    required this.onClicked,
    required this.onChangePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          // buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  // Widget buildImage() {

    // return ClipOval(
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Text(''),
    //       fit: BoxFit.cover,
    //       width: 70,
    //       height: 70,
    //     ),
    //   )
  // }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 2,
        child: buildCircle(
          color: color,
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
