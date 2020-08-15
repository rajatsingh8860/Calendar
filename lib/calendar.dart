import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class MyCalendar extends StatefulWidget {
  @override
  MyCalendarState createState() => MyCalendarState();
}

List<DateTime> presentDates = [
  DateTime(2020, 8, 1),
  DateTime(2020, 8, 3),
  DateTime(2020, 8, 4),
  DateTime(2020, 8, 5),
  DateTime(2020, 8, 6),
  DateTime(2020, 8, 9),
  DateTime(2020, 8, 10),
  DateTime(2020, 8, 11),
];
List<DateTime> absentDates = [
  DateTime(2020, 8, 2),
  DateTime(2020, 8, 7),
  DateTime(2020, 8, 8),
  DateTime(2020, 8, 12),
  DateTime(2020, 8, 13),
  DateTime(2020, 8, 14),
  DateTime(2020, 8, 16),
  DateTime(2020, 8, 17),
  DateTime(2020, 8, 18),
];

List<DateTime> leaveDates=[
  DateTime(2020,8,28),
  DateTime(2020,8,30)
];

class MyCalendarState extends State<MyCalendar> {
  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
  static Widget _absentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

      static Widget _leaveIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

     

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

 /// var len = 9;
  double cHeight;
  double cwidth;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    cwidth=MediaQuery.of(context).size.width;
    for (int i = 0; i < presentDates.length; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );}

      for (int i = 0; i < absentDates.length; i++) {
        _markedDateMap.add(
          absentDates[i],
          new Event(
            date: absentDates[i],
            title: 'Event 5',
            icon: _absentIcon(
              absentDates[i].day.toString(),
            ),
          ),
        );
      }

      for (int i = 0; i < leaveDates.length; i++) {
        _markedDateMap.add(
          leaveDates[i],
          new Event(
            date: leaveDates[i],
            title: 'Event 5',
            icon: _leaveIcon(
              leaveDates[i].day.toString(),
            ),
          ),
        );
      }
    

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue[200],
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
          null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calender"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendarCarouselNoHeader,
            SizedBox(height:50),
            markerRepresent(Colors.red, "Absent   :","${absentDates.length}   day(s)"),
            markerRepresent(Colors.yellow, "Leave     :","${leaveDates.length}   day(s)"),
            markerRepresent(Colors.green, "Holiday  :","${presentDates.length}   day(s)"),
            
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data,String count) {
    return new ListTile(
      title: Padding(
        padding:EdgeInsets.only(left:cwidth/5),
              child: new Text(
          data,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
        ),
      ),
      trailing: Padding(
       padding:EdgeInsets.only(right:cwidth/6),
        child: Text(count.toString(),style: TextStyle(color:color,fontWeight: FontWeight.bold,fontSize: 20))),
    );
  }
}