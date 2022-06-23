import 'package:santander_turma_2/app/modules/listen_battery_from_platform/battery_repository.dart';

class ListenBatteryController {
  final BatteryRepository batteryRepository;

  ListenBatteryController(this.batteryRepository);

  Stream<double> get batteryStream => batteryRepository.stream;
}
