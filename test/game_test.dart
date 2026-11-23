import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_elementler_ve_bilim/oyun_elementler_ve_bilim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(elementlerBilimConfig.title.length, 33);
    expect(elementlerBilimConfig.tagline.length, 33);
    for (final s in elementlerBilimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(elementlerBilimConfig.gameId, elementlerBilimId);
    expect(elementlerBilimRules.gameId, elementlerBilimId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(elementlerBilimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: elementlerBilimId, optionalMechanics: elementlerBilimRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(elementlerBilimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
