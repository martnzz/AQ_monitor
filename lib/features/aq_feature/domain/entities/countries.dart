class CountryItem {
  final String status;
  final List<Countries> data;

  CountryItem({
    required this.status,
    required this.data,
  });

}

class Countries {
  final String country;

  Countries({
    required this.country,
  });

}
