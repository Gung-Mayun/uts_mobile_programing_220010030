import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_mobile_programing_220010030/main.dart';
import 'package:uts_mobile_programing_220010030/models/animal.dart';

void main() {
  final mockAnimalData = [
    Animal(
      id: '1',
      speciesName: 'Panthera tigris',
      localName: 'Harimau',
      description: 'Harimau adalah hewan buas yang hidup di hutan.',
      imageUrl: 'https://example.com/tiger.jpg',
    ),
    Animal(
      id: '2',
      speciesName: 'Elephas maximus',
      localName: 'Gajah',
      description: 'Gajah adalah hewan darat terbesar di dunia.',
      imageUrl: 'https://example.com/elephant.jpg',
    ),
  ];

  testWidgets('HomePage renders correctly', (WidgetTester tester) async {
    // Pass mock data to the app
    // Verify that the app bar contains the correct title.
    expect(find.text('Animal Data'), findsOneWidget);

    // Verify that the list of animals is displayed.
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the first animal's name is in the list.
    expect(find.text(mockAnimalData[0].localName), findsOneWidget);
  });

  testWidgets('Navigates to DetailPage when a list item is tapped', (WidgetTester tester) async {
    // Pass mock data to the app

    // Tap on the first list item.
    await tester.tap(find.text(mockAnimalData[0].localName));
    await tester.pumpAndSettle();

    // Verify that the detail page is displayed with correct data.
    expect(find.text(mockAnimalData[0].speciesName), findsOneWidget);
    expect(find.text(mockAnimalData[0].description), findsOneWidget);
  });
}
