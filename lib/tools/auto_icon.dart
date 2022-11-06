autoIcon(name) {
    if (name.contains('Patatas')) {
      return 'assets/food_icons/potato.svg';
    }
    if (name.contains('Tomate')) {
      return 'assets/food_icons/tomato.svg';
    }
    if (name.contains('Plátanos')) {
      return 'assets/food_icons/banana.svg';
    }
    if (name.contains('Bananas')) {
      return 'assets/food_icons/banana.svg';
    }
    if (name.contains('Cerveza')) {
      return 'assets/food_icons/beermug.svg';
    }
    if (name.contains('Vino')) {
      return 'assets/food_icons/wineglass.svg';
    }
    if (name.contains('Huevos')) {
      return 'assets/food_icons/egg.svg';
    }
    if (name.contains('Piña')) {
      return 'assets/food_icons/pineapple.svg';
    }
    return 'assets/food_icons/generic.svg';
  }