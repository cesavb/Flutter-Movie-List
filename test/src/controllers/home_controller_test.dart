import 'package:flutter_movie_list/src/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = Homecontroller();

  test('Deve preencher a variavel', () async {
    await controller.start(1);
    expect(controller.show.isNotEmpty, true);
  });
}
