enum BlogCategory {
  TECHNOLOGY,
  HOT_NEWS,
  CONCEPTS,
  ELECTRIC_CARS,
  EXOTIC,
  OLDTIMER;

  String get formattedEnum => name.replaceAll('_', ' ');
}
