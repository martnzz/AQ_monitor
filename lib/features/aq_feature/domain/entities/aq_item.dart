class Item {
  final String status;
  final Data? data;

  const Item({
    required this.status,
    required this.data,
  });
}

class Data {
  final String city;
  final String state;
  final String country;
  final Location location;
  final Current current;

  Data({
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });
}

class Current {
  final Pollution pollution;
  final Weather weather;

  Current({
    required this.pollution,
    required this.weather,
  });
}

class Pollution {
  final String ts;
  final int aqius;
  final String mainus;
  final int aqicn;
  final String maincn;

  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });
}

class Weather {
  final String ts;
  final int tp;
  final int pr;
  final int hu;
  final double ws;
  final int wd;
  final String ic;

  Weather({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });
}
