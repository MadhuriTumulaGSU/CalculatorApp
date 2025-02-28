import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator_hw2/main.dart';

void main() {
  testWidgets('Calculator performs basic operations', (WidgetTester tester) async {
    // Build the CalculatorApp
    await tester.pumpWidget(CalculatorApp());

    // Find buttons by text
    Finder button1 = find.text('1');
    Finder button2 = find.text('2');
    Finder buttonPlus = find.text('+');
    Finder buttonEquals = find.text('=');
    Finder display = find.byType(Text).last; // Find last text widget for result

    // Tap 1 + 2 =
    await tester.tap(button1);
    await tester.tap(buttonPlus);
    await tester.tap(button2);
    await tester.tap(buttonEquals);

    // Rebuild the widget tree after taps
    await tester.pump();

    // Verify result is 3
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('Calculator handles division by zero', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    Finder button5 = find.text('5');
    Finder buttonDiv = find.text('÷');
    Finder button0 = find.text('0');
    Finder buttonEquals = find.text('=');
    
    // Tap 5 ÷ 0 =
    await tester.tap(button5);
    await tester.tap(buttonDiv);
    await tester.tap(button0);
    await tester.tap(buttonEquals);

    await tester.pump();

    // Expect "Error" to be displayed
    expect(find.text('Error'), findsOneWidget);
  });
}
