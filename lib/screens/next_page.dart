import 'package:flutter/material.dart';
import 'package:smapp/config/colors.dart';
import 'package:smapp/model/grid_model.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key, required this.gridData});
  final GridData gridData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: backgroundColor,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Text(
                  gridData.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 24),
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
             SizedBox(
              height: 300,
              child: Center(
                child: Text(
                  "Details about ${gridData.name}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
