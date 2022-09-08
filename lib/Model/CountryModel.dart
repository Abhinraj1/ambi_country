

class CountryModel{
  String? Capital,
      Currency,
      OfficialName,
      Region,
      Flag;

  CountryModel({
    this.Capital,
  this.Currency,
  this.OfficialName,
  this.Region,
  this.Flag
  });

  @override
  String toString() {
    return '{ ${this.Capital},${this.Currency},${this.OfficialName},${this.Region},${this.Flag} }';
  }
}