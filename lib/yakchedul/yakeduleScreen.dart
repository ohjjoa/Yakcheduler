import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class YakeduleScreen extends StatefulWidget {
  @override
  _YakeduleScreenState createState() => _YakeduleScreenState();
}

class _YakeduleScreenState extends State<YakeduleScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {
    DateTime.now(): ['일정 1', '일정 2'],
    DateTime.now().add(Duration(days: 2)): ['일정 3'],
    DateTime.now().subtract(Duration(days: 3)): ['일정 4'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2021, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: (day) {
              return _events[day] ?? [];
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: _events[_selectedDay] != null ? _events[_selectedDay]!.length : 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_events[_selectedDay]![index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEvent(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addEvent() {
    if (_selectedDay == null) return;

    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _eventController = TextEditingController();

        return AlertDialog(
          title: Text('Add Event'),
          content: TextField(
            controller: _eventController,
            decoration: InputDecoration(hintText: 'Enter event title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_eventController.text.isEmpty) return;

                setState(() {
                  if (_events[_selectedDay] != null) {
                    _events[_selectedDay]!.add(_eventController.text);
                  } else {
                    _events[_selectedDay!] = [_eventController.text];
                  }
                });

                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
