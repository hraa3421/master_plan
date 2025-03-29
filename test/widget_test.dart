import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_plan/main.dart';

void main() {
  testWidgets('Master Plan UI Test', (WidgetTester tester) async {
    // Membangun aplikasi dan memulai frame pertama
    await tester.pumpWidget(const MasterPlanApp());

    // Memastikan judul 'Master Plan' tampil di AppBar
    expect(find.textContaining('Master Plan'), findsOneWidget);

    // Memastikan tombol tambah tugas (FloatingActionButton) ada
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Memastikan tidak ada tugas awalnya (ListView kosong)
    expect(find.byType(ListTile), findsNothing);

    // **Menambahkan tugas baru dengan menekan tombol "+"**
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Memastikan ada satu tugas yang muncul di dalam daftar
    expect(find.byType(ListTile), findsOneWidget);

    // **Mengedit deskripsi tugas**
    await tester.enterText(find.byType(TextFormField), "Belajar Flutter");
    await tester.pump();

    // Memastikan teks yang diinput muncul di TextFormField
    expect(find.text("Belajar Flutter"), findsOneWidget);

    // **Menandai tugas sebagai selesai dengan mencentang Checkbox**
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Memastikan Checkbox berubah status menjadi tercentang
    Checkbox checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, true);
  });
}
