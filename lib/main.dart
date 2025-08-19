import 'package:lifter/app/app.dart';
import 'package:lifter/app/bootstrap.dart';

void main() async {
  await bootstrap(() {
    return const MainApp();
  });
}
