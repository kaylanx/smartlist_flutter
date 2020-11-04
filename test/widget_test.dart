import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smartlist_flutter/main.dart';

void main() {
  testWidgets('Adding task appears', (WidgetTester tester) async {
    await tester.pumpWidget(SmartListApp());

    mainScreenDisplayed();
    addTaskScreenNotShown();
    await addButtonPressed(tester);

    addTaskScreenShown();
    addTaskButtonIsDisabled(tester);

    await enterTaskText(tester);
    addTaskButtonIsEnabled(tester);
    await clickAddTaskButton(tester);
    addTaskScreenNotShown();
    checkTaskAdded();
  });

  testWidgets('Toggling task gets toggled', (WidgetTester tester) async {
    await tester.pumpWidget(SmartListApp());
    await addButtonPressed(tester);
    await enterTaskText(tester);
    await clickAddTaskButton(tester);

    final checkboxFinder = find.byType(Checkbox);
    Checkbox checkbox = tester.firstWidget(checkboxFinder);
    expect(checkbox.value, false);
    Finder textFinder = find.text('This is a test task');
    Text text = tester.firstWidget(textFinder);
    expect(text.style.decoration, TextDecoration.none);

    await tester.tap(checkboxFinder);
    await tester.pump();
    checkbox = tester.firstWidget(checkboxFinder);
    expect(checkbox.value, true);

    textFinder = find.text('This is a test task');
    text = tester.firstWidget(textFinder);
    expect(text.style.decoration, TextDecoration.lineThrough);
  });

  testWidgets('Delete task disappears from screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(SmartListApp());

    mainScreenDisplayed();
    addTaskScreenNotShown();
    await addButtonPressed(tester);

    addTaskScreenShown();

    await enterTaskText(tester);
    await clickAddTaskButton(tester);
    addTaskScreenNotShown();
    checkTaskAdded();

    await removeTask(tester);
    await tester.pumpAndSettle();

    expect(find.text('0 items'), findsOneWidget);
    expect(find.text('This is a test task'), findsNothing);
  });
}

void addTaskButtonIsDisabled(WidgetTester tester) {
  expect(tester.widget<MaterialButton>(find.byType(MaterialButton)).enabled,
      isFalse);
}

void addTaskButtonIsEnabled(WidgetTester tester) {
  expect(tester.widget<MaterialButton>(find.byType(MaterialButton)).enabled,
      isTrue);
}

Future removeTask(WidgetTester tester) async {
  final dismissibleFinder = find.byType(Dismissible);
  await tester.drag(dismissibleFinder, Offset(-500.0, 0.0));
  await tester.pumpAndSettle();
}

void checkTaskAdded() {
  expect(find.text('0 items'), findsNothing);
  expect(find.text('1 item'), findsOneWidget);
  expect(find.text('This is a test task'), findsOneWidget);
  expect(find.byType(Checkbox), findsOneWidget);
}

void addTaskScreenShown() {
  expect(find.text('Add Item'), findsOneWidget);
  expect(find.byType(TextField), findsOneWidget);
  expect(find.text('Add'), findsOneWidget);
}

Future addButtonPressed(WidgetTester tester) async {
  await tester.pump();
  await tester.tap(find.byIcon(Icons.add));

  // Bottom sheet animation
  await tester.pumpAndSettle();
}

void mainScreenDisplayed() {
  expect(find.text('Smart List'), findsOneWidget);
  expect(find.text('0 items'), findsOneWidget);
  expect(find.byIcon(Icons.add), findsOneWidget);
}

Future enterTaskText(WidgetTester tester) async {
  await tester.enterText(find.byType(TextField), 'This is a test task');
  await tester.pump();
}

Future clickAddTaskButton(WidgetTester tester) async {
  await tester.tap(find.text('Add'));
  // Bottom sheet animation
  await tester.pumpAndSettle();
}

void addTaskScreenNotShown() {
  expect(find.text('Add Item'), findsNothing);
  expect(find.byType(TextField), findsNothing);
  expect(find.text('Add'), findsNothing);
}
