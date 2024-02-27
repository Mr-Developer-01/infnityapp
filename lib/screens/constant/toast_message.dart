import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class ToastMessages {
  static errorMessage(BuildContext context,var message){
    showFlash(
      // barrierDismissible :true,
      context: context,
      builder: (_, controller) {
        Future.delayed(const Duration(seconds: 5), () {
          controller.dismiss();
        });
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.red),
            child: FlashBar(
              // showProgressIndicator: true,
              behavior: FlashBehavior.floating,
              position: FlashPosition.top,
              controller: controller,
              title: const Text(
                'Error',
                style: TextStyle(color: Colors.red),
              ),
              content:  Text(message,
                  style: const TextStyle(color: Colors.red)),
              indicatorColor: Colors.red,
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.red,
              ),
              primaryAction: TextButton(
                  onPressed: () => controller.dismiss(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
            ),
          ),
        );
      },
    );
  }
  static successMessage(BuildContext context,var message){
    showFlash(
      // barrierDismissible :true,
      context: context,
      builder: (_, controller) {
        Future.delayed(const Duration(seconds: 5), () {
          controller.dismiss();
        });
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.green),
            child: FlashBar(
              // showProgressIndicator: true,
              behavior: FlashBehavior.floating,
              position: FlashPosition.top,
              controller: controller,
              title: const Text(
                'Success',
                style: TextStyle(color: Colors.green),
              ),
              content:  Text(message,
                  style: const TextStyle(color: Colors.green)),
              indicatorColor: Colors.green,
              icon: const Icon(
                Icons.done_outline_outlined,
                color: Colors.green,
              ),
              primaryAction: TextButton(
                  onPressed: () => controller.dismiss(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.green,
                  )),
            ),
          ),
        );
      },
    );
  }
  static warnigMessage(BuildContext context,var message){
    showFlash(
      // barrierDismissible :true,
      context: context,
      builder: (_, controller) {
        Future.delayed(const Duration(seconds: 5), () {
          controller.dismiss();
        });
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          child: DefaultTextStyle(
            style:  TextStyle(color: Colors.yellow[800]),
            child: FlashBar(
              // showProgressIndicator: true,
              behavior: FlashBehavior.floating,
              position: FlashPosition.top,
              controller: controller,
              title:  Text(
                'Warning',
                style: TextStyle(color: Colors.yellow[800]),
              ),
              content:  Text(message,
                  style:  TextStyle(color: Colors.yellow[800])),
              indicatorColor: Colors.yellow[800],
              icon:  Icon(
                Icons.warning_amber_outlined,
                color: Colors.yellow[800],
              ),
              primaryAction: TextButton(
                  onPressed: () => controller.dismiss(),
                  child:  Icon(
                    Icons.close,
                    color: Colors.yellow[800],
                  )),
            ),
          ),
        );
      },
    );
  }
}