import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appdevproject/customnavbar.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ScheduleScreen extends StatelessWidget {
  final List<StudentInfo> tutorData = [
    StudentInfo(name: "Chelsea Pearce", date: "7:30 am - 10:30 am"),
    StudentInfo(name: "Jonathan Jarvis", date: "10:30 am - 12:30 am"),
    StudentInfo(name: "Natalia Lamb", date: "2:00 pm - 4:30 pm"),
    StudentInfo(name: "Dillan O'Quinn", date: "4:30 pm - 6:30 pm"),
    StudentInfo(name: "Rachel Larson", date: "6:30 pm - 7:30 pm"),
    //StudentInfo(name: "Victoria Downs", date: "7:30 pm - 8:30 pm"),
    //StudentInfo(name: "Inaaya Cain", date: "9:30 pm - 10:30 pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScheduleTutor(tutorDatas: tutorData);
  }
}


class StudentInfo {
  final String name;
  final String date;

  StudentInfo({
    required this.name,
    required this.date,
  });
}

void main() {
  runApp(
    MaterialApp(
      title: 'Tutor Schedule',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScheduleScreen(),
    ),
  );
}


class ScheduleTutor extends StatelessWidget {
  final List<Color> bookmarkColors = [
    (const Color(0xFF4FC3F7)),
    (const Color(0xFF1976D2)),
    (const Color(0xFF0D47A1)),
  ];
  final List<StudentInfo> tutorDatas;

  ScheduleTutor({required this.tutorDatas,});

  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String month = DateFormat('MMM').format(now);
    String day = DateFormat('d').format(now);

    int remainingStudents = tutorDatas.length - 4 + 1;
    bool showRemainingStudents = remainingStudents > 1;

    pw.Widget _buildPdfContent() {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('MMMM dd, yyyy').format(now);

      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Student Schedule',
            style: pw.TextStyle(
              fontSize: 20,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Date: $formattedDate',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 10),
          for (var info in tutorDatas)
            pw.Row(
              children: [
                pw.Text(
                  'Name: ${info.name}',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(width: 10),
                pw.Text(
                  'Schedule: ${info.date}',
                  style: pw.TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
        ],
      );
    }

    Future<void> _printPdf() async {
      final pdf = pw.Document();

      // Add your widget to PDF
      pdf.addPage(pw.MultiPage(
        build: (context) => [
          _buildPdfContent(),
        ],
      ));

      // Print the PDF
      await Printing.layoutPdf(
        onLayout: (format) async => pdf.save(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: tutorDatas.length <= 4 ? const NeverScrollableScrollPhysics() : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0,),
                Row(
                  children: [
                    Container(
                      width: 130.0,
                      height: 30,
                      color: (const Color(0xFFFDD835)),
                      child: Center(
                        child: Text(
                          month.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Container(
                        height: 30,
                        color: (const Color(0xFFFDD835)),
                        child: Center(
                          child: Text(
                            "Students for Today:".toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 130.0,
                      height: 100,
                      color: (const Color(0xFFEEEEEE)),
                      child: Center(
                        child: Text(
                          day.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    //Student List with Bullet
                    Expanded(
                      child: Container(
                        height: 100,
                        color: const Color(0xFFEEEEEE),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < (tutorDatas.length <= 4 ? tutorDatas.length : 3); i++)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.brightness_1,
                                            size: 6,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            tutorDatas[i].name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                if (showRemainingStudents)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.brightness_1,
                                            size: 6,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            '+ $remainingStudents more students',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  children: [
                    //Individual Containers with Time
                    Column(
                      children: tutorDatas.map((info) {
                        Color bookmarkColor = bookmarkColors[colorIndex % bookmarkColors.length];
                        colorIndex++;
                        return Column(
                          children: [
                            Container(
                              height: 95,
                              width: 500.0,
                              color: const Color(0xFFEEEEEE),
                              padding: const EdgeInsets.all(25.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.bookmark,
                                    color: bookmarkColor,
                                    size: 30.0,
                                  ),
                                  const SizedBox(width: 30.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        info.name.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        info.date.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        );
                      }).toList(),
                    ),
                    TextButton(
                      onPressed: _printPdf,
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                          return Colors.transparent;
                        }),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_download_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Get PDF Schedule",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}