class CountryStats {
  String? name;
  int? deaths;
  int? cases;
  int? recovered;
  CountryStats({
     this.cases,
     this.deaths,
     this.recovered,
     this.name,
  });

  set setCases(value) {
    cases = value;
  }

  set setDeaths(value) {
    deaths = value;
  }

  set setRecovered(value) {
    deaths = value;
  }

  set setCountryName(value) {
    name = value;
  }
}
