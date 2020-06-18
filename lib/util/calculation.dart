import 'dart:math' as math;

abstract class ICalculation {
  bool checkDuration(int day);
  bool checkAmount(double amount);
  double dayInYear(int day);
  double getRate(int day);
  double findInterest(double principalAmount, int day);
  double performCalculation(double principalAmount, int day);
}

class Calculation implements ICalculation {
  static const double INTEREST_RATE = 5 / 100;

  @override
  double performCalculation(double amount, int day) {
    if (checkAmount(amount) && checkDuration(day))
      return findInterest(amount, day);
    return null;
  }

  @override
  double dayInYear(int day) {
    return day / 365;
  }

  @override
  bool checkAmount(double amount) {
    return amount >= 1000;
  }

  @override
  double findInterest(double principalAmount, int day) {
    double matureValue =
        principalAmount * math.pow((1 + INTEREST_RATE), dayInYear(day));
    print('mature value $matureValue');
    return matureValue - principalAmount;
  }

  @override
  bool checkDuration(int day) {
    return day > 10 && day < 1000;
  }

  @override
  double getRate(int day) {
    int twoYears = 360 * 2;
    if (day >= 10 && day <= 30)
      return 6 / 100;
    else if (day >= 31 && day <= 60)
      return 8 / 100;
    else if (day >= 61 && day <= 90)
      return 10 / 100;
    else if (day >= 91 && day <= twoYears)
      return 13 / 100;
    else if (day >= twoYears && day <= 1000)
      return 15.5 / 100;
    else
      return null;
  }
}
