import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarWidget(),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Column(
        children: [
          Text("Selected Day = " + today.toString().split(" ")[0]),
          TableCalendar(
              locale: "en_US",
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              selectedDayPredicate: (day) => isSameDay(day, today),
              availableGestures: AvailableGestures.all,
              rowHeight: 43,
              onDaySelected: _onDaySelected,
              focusedDay: today,
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(2030, 10, 16)),
              
        ],
      ),
    );
    ;
  }
}
