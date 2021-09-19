import '/constants/constants.dart';
import '/screens/dashboard/widgets/shops_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/categories.dart';
import 'widgets/dashboad_header.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kprimaryColor,
            //  height: 250.0,
            child: SafeArea(
              child: Column(
                children: [
                  const DashBoardHeader(),
                  const SizedBox(height: 25.0),
                  Expanded(
                    child: Container(
                      //height: 500.0,
                      decoration: const BoxDecoration(
                        color: Color(0XFFf3f5f7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          SizedBox(height: 10.0),
                          Categories(),
                          //SizedBox(height: 18.0),
                          ShopsWidgets(),

                          // Expanded(child: Container())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
