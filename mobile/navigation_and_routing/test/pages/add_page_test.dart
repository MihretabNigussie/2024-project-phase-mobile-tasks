import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihretab/pages/pages.dart';

void main() {
  testWidgets('AddPage UI Test', (WidgetTester tester) async {
    // Build our AddPage and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AddPage(),
    ));

    // Verify that 'Add Product' text is present.
    expect(find.text('Add Product'), findsOneWidget);

    // Verify that 'Image URL' text field is present.
    expect(find.byType(TextField), findsNWidgets(6));

    // Verify that 'ADD' button is present.
    expect(find.text('ADD'), findsOneWidget);

    // Verify that 'CANCEL' button is present.
    expect(find.text('CANCEL'), findsOneWidget);
  });

  testWidgets('AddPage Add Button Test', (WidgetTester tester) async {
    // Build our AddPage and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AddPage(),
    ));

    // Tap the 'ADD' button and trigger a frame.
    await tester.tap(find.text('ADD'));
    await tester.pump();

    // You can add further assertions here based on your specific requirements.
  });

  testWidgets('AddPage Cancel Button Test', (WidgetTester tester) async {
    // Build our AddPage and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: AddPage(),
    ));

    // Tap the 'CANCEL' button and trigger a frame.
    await tester.tap(find.text('CANCEL'));
    await tester.pump();

    // You can add further assertions here based on your specific requirements.
  });
}
