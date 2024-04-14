class TyrePsi {
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyrePsi({required this.isLowPressure, required this.psi, required this.temp});
}

final List<TyrePsi> demoPsiList = [
  TyrePsi(isLowPressure: true, psi: 23.6, temp: 56),
  TyrePsi(isLowPressure: false, psi: 35.0, temp: 29),
  TyrePsi(isLowPressure: false, psi: 34.6, temp: 41),
  TyrePsi(isLowPressure: false, psi: 33.9, temp: 42),
];
