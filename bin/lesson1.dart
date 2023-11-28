import 'package:args/args.dart';

void main() {
  var tariffEco = 250.0;
  var tariffStandard = 200.0;
  var tariffPrem = 150.0;
  var tariffBoundEcoToStandard = 10;
  var tariffBoundStardardToPrem = 20;

  double totalDistance = 25.0;
  double currentDistance = 0.0;

  double totalFare = 0.0;

  while (currentDistance < totalDistance) {
    double remainingDistance = totalDistance - currentDistance;

    double currentTariff;
    if (currentDistance < tariffBoundEcoToStandard) {
      currentTariff = tariffEco;
    } else if (currentDistance < tariffBoundStardardToPrem) {
      currentTariff = tariffStandard;
    } else {
      currentTariff = tariffPrem;
    }

    double fare = calculateFare(remainingDistance, currentTariff);

    totalFare += fare;

    currentDistance = ((currentDistance < tariffBoundEcoToStandard)
        ? tariffBoundEcoToStandard
        : (currentDistance < tariffBoundStardardToPrem)
        ? tariffBoundStardardToPrem
        : totalDistance).toDouble();

    print("Расстояние: $currentDistance км, Тариф: $currentTariff тенге, Стоимость: $fare тенге");
  }

  print("Итоговая стоимость: $totalFare тенге");
  print("Пройденное расстояние: $totalDistance км");
}

double calculateFare(double distance, double tariff) {
  return distance * tariff;
}