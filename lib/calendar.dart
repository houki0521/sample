import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
    // カレンダーが表示される日付
  DateTime _focusedDay = DateTime.now();
  // カレンダー上でマークが表示される日付
  DateTime _currentDay = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1), // 表示する最初の日
                lastDay: DateTime.utc(2030, 12, 31), // 表示する最後の日
                locale: "ja_JP",
                focusedDay: _focusedDay,
                currentDay: _currentDay,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _currentDay = selectedDay; // タップした際にマーク位置を更新
                    _focusedDay = selectedDay; // タップした際にカレンダーの表示位置を更新
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false, // 日/週/月切り替えボタンを非表示
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
