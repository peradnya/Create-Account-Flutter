import 'package:create_account/component/step_indicator/step_indicator.dart';
import 'package:create_account/data/pairs.dart';
import 'package:create_account/page/create_passwor_page.dart';
import 'package:create_account/page/personal_info_page.dart';
import 'package:create_account/page/schedule_video_call_page.dart';
import 'package:create_account/page/welcome_page.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  int _steps;
  TextEditingController _emailTextController, _passwordTextController;
  GlobalKey<FormState> _welcomeForm,
      _createPasswordForm,
      _personalInfoForm,
      _scheduleVideoCallForm;

  Pair<int, String> _goalForActivationValue,
      _monthlyExpenseValue,
      _monthlyIncomeValue;

  Function _goalForActivationCallback,
      _monthlyExpenseCallback,
      _monthlyIncomeCallback,
      _dateVideoCallCallback,
      _timeVideoCallCallback;

  DateTime _dateVideoCall, _timeVideoCall;

  FocusScopeNode _focus;

  @override
  void initState() {
    _steps = 0;
    _welcomeForm = GlobalKey<FormState>();
    _createPasswordForm = GlobalKey<FormState>();
    _personalInfoForm = GlobalKey<FormState>();
    _scheduleVideoCallForm = GlobalKey<FormState>();

    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _goalForActivationValue = null;
    _monthlyExpenseValue = null;
    _monthlyIncomeValue = null;
    _dateVideoCall = null;
    _timeVideoCall = null;

    _goalForActivationCallback = (value) {
      setState(() {
        _goalForActivationValue = value;
      });
    };

    _monthlyExpenseCallback = (value) {
      setState(() {
        _monthlyExpenseValue = value;
      });
    };

    _monthlyIncomeCallback = (value) {
      setState(() {
        _monthlyIncomeValue = value;
      });
    };

    _dateVideoCallCallback = (value) {
      setState(() {
        _dateVideoCall = value;
      });
    };

    _timeVideoCallCallback = (value) {
      setState(() {
        _timeVideoCall = value;
      });
    };

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _focus = FocusScope.of(context);
    super.didChangeDependencies();
  }

  void _disableSoftKeyboard() {
    if (!_focus.hasPrimaryFocus && _focus.focusedChild != null) {
      _focus.focusedChild.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_steps) {
      case 0:
        page = WelcomePage(
          welcomeForm: _welcomeForm,
          emailTextController: _emailTextController,
        );
        break;
      case 1:
        page = CreatePasswordPage(
          createPasswordForm: _createPasswordForm,
          passwordTextController: _passwordTextController,
        );
        break;
      case 2:
        page = PersonalInfoPage(
          personalInfoForm: _personalInfoForm,
          goalForActivationValue: _goalForActivationValue,
          goalForActivationCallback: _goalForActivationCallback,
          monthlyExpenseValue: _monthlyExpenseValue,
          monthlyExpenseCallback: _monthlyExpenseCallback,
          monthlyIncomeValue: _monthlyIncomeValue,
          monthlyIncomeCallback: _monthlyIncomeCallback,
        );
        break;
      case 3:
        page = ScheduleVideoCallPage(
          scheduleVideoCallForm: _scheduleVideoCallForm,
          date: _dateVideoCall,
          time: _timeVideoCall,
          dateCallback: _dateVideoCallCallback,
          timeCallback: _timeVideoCallCallback,
        );
        break;
      default:
        page = Container(
          child: Text('Registered'),
        );
        break;
    }

    return Listener(
      //onPointerDown: (_) => _disableSoftKeyboard(),
      child: Scaffold(
        appBar: _steps == 0
            ? AppBar(
                elevation: 0,
                title: Container(),
              )
            : AppBar(
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      if (_steps > 0) {
                        _steps = _steps - 1;
                      }
                    });
                  },
                ),
                title: Text('Create Account'),
              ),
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              StepIndicator(
                currentStep: _steps,
                maxStep: 4,
              ),
              Expanded(
                child: Container(
                  color: _steps == 0 ? Colors.white : Colors.blue,
                  child: SingleChildScrollView(
                    child: page,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: _steps == 0 ? Colors.white : Colors.blue,
                child: RaisedButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    switch (_steps) {
                      case 0:
                        if (_welcomeForm.currentState.validate()) {
                          setState(() {
                            _steps = _steps + 1;
                          });
                        }
                        break;
                      case 1:
                        if (_createPasswordForm.currentState.validate()) {
                          setState(() {
                            _steps = _steps + 1;
                          });
                        }
                        break;
                      case 2:
                        if (_personalInfoForm.currentState.validate()) {
                          setState(() {
                            _steps = _steps + 1;
                          });
                        }
                        break;
                      case 3:
                        if (_scheduleVideoCallForm.currentState.validate()) {
                          setState(() {
                            _steps = _steps + 1;
                          });
                        }
                        break;
                      default:
                        break;
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
