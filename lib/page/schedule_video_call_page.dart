import 'package:create_account/component/animated_calendar_icon/animated_calendar_icon.dart';
import 'package:create_account/component/custom_text_field/custom_text_field.dart';
import 'package:create_account/component/page_header/page_header.dart';
import 'package:create_account/utils/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [ScheduleVideoCallPage]
/// This class is used to create Scheduled Video Call Page that will be consumed by [CreateAccountPage].
/// This clasas need [GlobalKey<FormState>] to detect state of current form,
/// [DateTime] to save the date and time value.
/// and [Function] to trigger callback to the [CreateAccountPage] when value changed.
class ScheduleVideoCallPage extends StatefulWidget {
  final GlobalKey<FormState> scheduleVideoCallForm;
  final DateTime date, time;
  final Function dateCallback, timeCallback;

  const ScheduleVideoCallPage({
    Key key,
    @required this.scheduleVideoCallForm,
    @required this.date,
    @required this.time,
    @required this.dateCallback,
    @required this.timeCallback,
  }) : super(key: key);

  @override
  ScheduleVideoCallPageState createState() => ScheduleVideoCallPageState();
}

/// [ScheduleVideoCallPageState]
/// This class is used to save state of [ScheduleVideoCallPage]
class ScheduleVideoCallPageState extends State<ScheduleVideoCallPage> {
  TextEditingController _dateTextController, _timeTextController;

  @override
  void initState() {
    _dateTextController =
        TextEditingController(text: DateFormat.formatDate(widget.date));
    _timeTextController =
        TextEditingController(text: DateFormat.formatTime(widget.time));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;

    final datePicker = CustomTextField(
      controller: _dateTextController,
      label: 'Date',
      hint: '- Choose Date -',
      readOnly: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Must put the date';
        }
        return null;
      },
      tail: Icon(Icons.arrow_drop_down),
      onTap: () async {
        if (isIos) {
          final init = widget.date ?? DateTime.now();

          if (widget.date == null) {
            setState(() {
              _dateTextController.text = DateFormat.formatDate(init);
              widget.dateCallback(init);
            });
          }

          await showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                height: 300,
                color: Colors.white,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (result) {
                    setState(() {
                      _dateTextController.text = DateFormat.formatDate(result);
                      widget.dateCallback(result);
                    });
                  },
                  initialDateTime: init,
                  minimumYear: 1900,
                  maximumYear: 2100,
                ),
              );
            },
          );
        } else {
          final result = await showDatePicker(
            context: context,
            initialDate: widget.date ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (result != null) {
            setState(() {
              _dateTextController.text = DateFormat.formatDate(result);
              widget.dateCallback(result);
            });
          }
        }
      },
    );

    final timePicker = CustomTextField(
      controller: _timeTextController,
      label: 'Time',
      hint: '- Choose Time -',
      readOnly: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Must put the time';
        }
        return null;
      },
      tail: Icon(Icons.arrow_drop_down),
      onTap: () async {
        if (isIos) {
          final init = widget.time ?? DateTime.now();

          if (widget.time == null) {
            setState(() {
              _timeTextController.text = DateFormat.formatTime(init);
              widget.timeCallback(init);
            });
          }

          await showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                height: 300,
                color: Colors.white,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (result) {
                    setState(() {
                      _timeTextController.text = DateFormat.formatTime(result);
                      widget.timeCallback(result);
                    });
                  },
                  initialDateTime: init,
                  minimumYear: 1900,
                  maximumYear: 2100,
                ),
              );
            },
          );
        } else {
          final result = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(widget.time ?? DateTime.now()),
          );
          if (result != null) {
            setState(() {
              DateTime def = widget.time ?? DateTime.now();
              DateTime time = DateTime(
                  def.year, def.month, def.day, result.hour, result.minute);
              _timeTextController.text = DateFormat.formatTime(time);
              widget.timeCallback(time);
            });
          }
        }
      },
    );

    return Form(
      key: widget.scheduleVideoCallForm,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedCalendarIcon(),
            PageHeader(
              title: 'Schedule Video Call',
              subtitle:
                  'Choose the date and time that you preferred. We will send a link via email to make a video call on the scheduled date and time.',
            ),
            datePicker,
            timePicker,
          ],
        ),
      ),
    );
  }
}
