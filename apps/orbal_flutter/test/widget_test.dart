import 'package:flutter_test/flutter_test.dart';
import 'package:orbal/app.dart';

void main() {
  testWidgets('Orbal dashboard renders prototype status', (tester) async {
    await tester.pumpWidget(const OrbalApp());
    expect(find.text('ORBΛL'), findsOneWidget);
    expect(find.text('Prototype status'), findsOneWidget);
    expect(find.text('0.000000 ORB'), findsOneWidget);
  });
}
