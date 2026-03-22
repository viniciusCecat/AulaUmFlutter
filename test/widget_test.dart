import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aula_um/main.dart';

void main() {
  testWidgets('abre selecionar e navega para resultado', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Escolha do APP'), findsOneWidget);

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    expect(find.text('Sua Escolha'), findsOneWidget);
    expect(find.text('Jogar novamente'), findsOneWidget);
  });
}
