class Data {
  final String dt;
  final double c;
  final double g;
  final String d;
  final String t;
  final double pred;
  final double min;
  final double max;
  final double rain;

  Data(
      {required this.dt,
      required this.c,
      required this.g,
      required this.d,
      required this.t,
      required this.pred,
      required this.min,
      required this.max,
      required this.rain});

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      dt: parsedJson['dt'].toString(),
      c: parsedJson['GC'],
      g: parsedJson['GG'],
      d: parsedJson['Date'].toString(),
      t: parsedJson['Time'].toString(),
      pred: parsedJson['Pred'],
      min: parsedJson['min_temp'],
      max: parsedJson['max_temp'],
      rain: parsedJson['Rainfall'],
    );
  }
}

class ChartData {
  final String dat;
  final double con;
  final double gen;

  ChartData({
    required this.dat,
    required this.con,
    required this.gen,
  });
}

class Teamdata {
  final String name;
  final String email;

  Teamdata({
    required this.name,
    required this.email,
  });
}
