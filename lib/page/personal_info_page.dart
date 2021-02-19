import 'package:create_account/data/goal_for_activation.dart';
import 'package:create_account/data/monthly_expense.dart';
import 'package:create_account/data/monthly_income.dart';
import 'package:create_account/data/pairs.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  final GlobalKey<FormState> personalInfoForm;

  final Pair<int, String> goalForActivationValue,
      monthlyExpenseValue,
      monthlyIncomeValue;

  final Function goalForActivationCallback,
      monthlyExpenseCallback,
      monthlyIncomeCallback;

  const PersonalInfoPage({
    Key key,
    @required this.personalInfoForm,
    @required this.goalForActivationValue,
    @required this.goalForActivationCallback,
    @required this.monthlyExpenseValue,
    @required this.monthlyExpenseCallback,
    @required this.monthlyIncomeValue,
    @required this.monthlyIncomeCallback,
  }) : super(key: key);

  @override
  PersonalInfoPageState createState() => PersonalInfoPageState();
}

class PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.personalInfoForm,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<Pair<int, String>>(
              value: widget.goalForActivationValue,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Goal for activation',
                hintText: '- Choose Option -',
              ),
              items: goal_for_activation.map((e) {
                return DropdownMenuItem(child: Text(e.v), value: e);
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Must choose one value.';
                }
                return null;
              },
              onChanged: widget.goalForActivationCallback,
            ),
            DropdownButtonFormField<Pair<int, String>>(
              value: widget.monthlyIncomeValue,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Monthly Income',
                hintText: '- Choose Option -',
              ),
              items: monthly_income.map((e) {
                return DropdownMenuItem(child: Text(e.v), value: e);
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Must choose one value.';
                }
                return null;
              },
              onChanged: widget.monthlyIncomeCallback,
            ),
            DropdownButtonFormField<Pair<int, String>>(
              value: widget.monthlyExpenseValue,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Monthly Expense',
                hintText: '- Choose Option -',
              ),
              items: monthly_expense.map((e) {
                return DropdownMenuItem(child: Text(e.v), value: e);
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Must choose one value.';
                }
                return null;
              },
              onChanged: widget.monthlyExpenseCallback,
            ),
          ],
        ),
      ),
    );
  }
}
