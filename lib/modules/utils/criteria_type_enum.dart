enum CriteriaType {
  plainText('plain_text'),
  variable("variable");

  const CriteriaType(this.value);

  final String value;

  static CriteriaType getTypeFromString(String value) {
    switch (value) {
      case 'variable':
        return CriteriaType.variable;

      case 'plain_text':
      default:
        return CriteriaType.plainText;
    }
  }
}

enum SubCriteriaType {
  indicator('indicator'),
  valueType("value");

  const SubCriteriaType(this.value);

  final String value;

  static SubCriteriaType getTypeFromString(String value) {
    switch (value) {
      case 'indicator':
        return SubCriteriaType.indicator;

      case 'value':
      default:
        return SubCriteriaType.valueType;
    }
  }
}
