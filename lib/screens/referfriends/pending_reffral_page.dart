import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tribb/screens/constant/colors.dart';

class PendingReffralPage extends StatefulWidget {
  const PendingReffralPage({super.key});

  @override
  State<PendingReffralPage> createState() => _PendingReffralPageState();
}

class _PendingReffralPageState extends State<PendingReffralPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsClass.themeColor
        ),
        title:  Text('Pending Referrals',style: TextStyle(color: ColorsClass.themeColor),),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const GFAvatar(
                  size: GFSize.SMALL,
                  child: Text('D'),
                ),
                // trailing: const Text(
                //   "GFG",
                //   style: TextStyle(color: Colors.green, fontSize: 15),
                // ),
                title: Text("List item $index"),
                subtitle: const Text('Refered on : 12/2/2024'),
                );
                
          }),
        ),
      ),
    );
  }
}