import 'package:create_account/component/custom_dropdown/custom_dropdown.dart';
import 'package:create_account/component/page_header/page_header.dart';
import 'package:create_account/data/goal_for_activation.dart';
import 'package:create_account/data/monthly_expense.dart';
import 'package:create_account/data/monthly_income.dart';
import 'package:create_account/data/pairs.dart';
import 'package:flutter/material.dart';

/// [PersonalInfoPage]
/// This class is used to create Personal Info Page that will be consumed by [CreateAccountPage].
/// This clasas need [GlobalKey<FormState>] to detect state of current form,
/// [Pair<int, String>] to save the goalForActivation, monthlyIncome, and monthlyExpense value.
/// and [Function] to trigger callback to the [CreateAccountPage] when value changed.
class PersonalInfoPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Form(
      key: personalInfoForm,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Personal Information',
              subtitle:
                  'Please fill in the information below and your goal for digital saving.',
            ),
            CustomDropDown(
              label: 'Goal for activation',
              hint: '- Choose Option -',
              items: goal_for_activation.map((e) {
                return DropdownMenuItem(child: Text(e.v), value: e);
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Must choose one value.';
                }
                return null;
              },
              value: goalForActivationValue,
              onChanged: goalForActivationCallback,
            ),
            CustomDropDown(
              label: 'Monthly income',
              hint: '- Choose Option -',
              items: monthly_income.map((e) {
                return DropdownMenuItem(child: Text(e.v), value: e);
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Must choose one value.';
                }
                return null;
              },
              value: monthlyIncomeValue,
              onChanged: monthlyIncomeCallback,
            ),
            CustomDropDown(
              label: 'Monthly expense',
              hint: '- Choose Option -',
              items: monthly_expense.map((e) {
                return DropdownMenuItem(child: Text(e.v), value: e);
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Must choose one value.';
                }
                return null;
              },
              value: monthlyExpenseValue,
              onChanged: monthlyExpenseCallback,
            ),
          ],
        ),
      ),
    );
  }
}
