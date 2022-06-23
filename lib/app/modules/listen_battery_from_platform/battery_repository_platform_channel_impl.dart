import 'package:flutter/services.dart';
import 'package:santander_turma_2/app/modules/listen_battery_from_platform/battery_repository.dart';

class BatteryRepositoryPlatformChannelImpl implements BatteryRepository {
  final eventChannel = const EventChannel('com.example.santander_turma_2/battery_stream');

  @override
  Stream<double> get stream => eventChannel.receiveBroadcastStream().map((batteryValue) => batteryValue as double);
}
