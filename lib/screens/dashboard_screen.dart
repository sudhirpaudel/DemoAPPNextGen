import 'package:flutter/material.dart';
import 'package:smapp/config/colors.dart';
import 'package:smapp/config/images.dart';
import 'package:smapp/model/grid_model.dart';
import 'package:smapp/screens/next_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    List<GridData> gridDummyData = [
      GridData(iconName: studentIcon, name: "Students"),
      GridData(iconName: teacherIcon, name: "Teachers"),
      GridData(iconName: attendanceIcon, name: "Attendance"),
      GridData(iconName: syllabusIcon, name: "Syllabus"),
      GridData(iconName: timetableIcon, name: "Time Table"),
      GridData(iconName: assignmentIcon, name: "Assignments"),
      GridData(iconName: examIcon, name: "Exams"),
      GridData(iconName: resultIcon, name: "Results"),
      GridData(iconName: feeIcon, name: "Fee"),
      GridData(iconName: eventIcon, name: "Events"),
      GridData(iconName: inboxIcon, name: "Inbox"),
      GridData(iconName: askIcon, name: "Ask Doubt"),
    ];

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Sudhir Paudel",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      notification = !notification;
                    });
                  },
                  icon: Icon(
                    notification
                        ? Icons.notifications_active_outlined
                        : Icons.notifications_outlined,
                    size: 28,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 2,left:20 , right: 20),
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search),
                  SizedBox(
                    height: 40,
                    width: width - 130,
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: height - 210,
              child: ListView(
                children: [
                  const Text(
                    "Academics",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: width,
                    height:
                        (gridDummyData.length / (width / 120).round()).ceil() >
                                3
                            ? 4 * 120
                            : (gridDummyData.length / (width / 140).round())
                                    .ceil() *
                                140,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (width / 120).round(),
                          mainAxisExtent: 120,
                        ),
                        itemCount: gridDummyData.length,
                        itemBuilder: (context, index) {
                          return gridItem(context, gridDummyData[index]);
                        }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "E-Learning",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: width,
                    height:
                        (gridDummyData.length / (width / 120).round()).ceil() >
                                3
                            ? 4 * 120
                            : (gridDummyData.length / (width / 140).round())
                                    .ceil() *
                                140,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (width / 180).round(),
                          mainAxisExtent: 180,
                        ),
                        itemCount: gridDummyData.length,
                        itemBuilder: (context, index) {
                          return gridItem(context, gridDummyData[index]);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridItem(BuildContext context, GridData gridData) {
    return Container(
      height: 110,
      width: 110,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NextPage(
                      gridData: gridData,
                    )),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              gridData.iconName!,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              gridData.name!,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
