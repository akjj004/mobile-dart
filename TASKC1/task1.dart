// Antoni Kijjaroentorn NST Group 2
// create class lamp and bulb

// Lamp has attributes
// isLight which indicates the state of the lamp
// intensity 1...10
//
class Lamp {
  bool isLight = false;
  int intensity = 0;
  // declare class buld
  Bulb bulb;
  //
  Lamp(this.bulb);

  // func turn on
  void turn_on() {
    if (!bulb.isFried) {
      isLight = true;
    }

    bulb.light();
  }

  // func turn off
  void turn_off() {
    isLight = false;
    intensity = 0;
    bulb.off();
  }

  // func light Up Lamp
  void light_up(int degrees) {
    intensity += degrees;

    if (intensity > 10) {
      bulb.isFried = true;
      bulb.isLitUp = false;
      isLight = false;
    }
  }

  // func dim Lamp
  void dim(int degrees) {
    intensity -= degrees;

    if (intensity <= 0) {
      bulb.off();
      isLight = false;

      intensity = 0;
    }
  }

  // change the bulb
  bool change_bulb() {
    if (intensity > 0) {
      return false;
    }

    bulb.isFried = false;
    bulb.isLitUp = false;

    return true;
  }

  // check is lamp is turn on
  String lampOn() {
    return "Lamp is ${isLight ? 'Lit up' : 'Not Lit up'}";
  }

  // check is lamp shines
  String lampLitUp() {
    return "Lamp ${intensity > 0 ? 'is' : 'not'} on";
  }

  // check is Bulb is Fried
  String isBulbFried() {
    return bulb.isBulbFried();
  }
}

// Bulb has to attributes
// isLitUp to check state
// isFried to check state
class Bulb {
  bool isLitUp = false;
  bool isFried = false;

  // initate Bulb class
  Bulb();

  // Turn on the Bulb!
  void light() {}

  // Turn off Bulb
  void off() {}

  // is Bulb turn on ?
  // tenary is used
  String isBulbLitUp() {
    return "Zarowka ${isLitUp ? 'swieci' : 'nie swieci'}";
  }

  // is Bulb is Fried
  // tenary is used
  String isBulbFried() {
    return "Zarowka ${isFried ? 'jest' : 'nie jest'} spalona";
  }
}

// check state of the Lamp
void stateOfLamp(Lamp lamp) {
  print(">>> Lamp State <<<");
  print('Intensity: ${lamp.intensity}');
  print(lamp.lampOn());
  print('-');
  print(lamp.lampLitUp());
  print('-');
  print(lamp.isBulbFried());
  print('-');
}

// Load main body
void main() {
  var bulb = Bulb();
  var lamp = Lamp(bulb);

  // default state
  print('Default state: \n');
  stateOfLamp(lamp);

  print('Changing the intensity below 10 and turning on the light: \n');
  lamp.turn_on();
  lamp.light_up(5);

  stateOfLamp(lamp);

  print('Change the intensity to 0: \n');
  lamp.dim(5);

  stateOfLamp(lamp);

  print('Switching on the lamp and changing the intensity above 10: \n');
  lamp.turn_on();
  lamp.light_up(11);

  stateOfLamp(lamp);

  print('An attempt to illuminate the lamp next to a burnt bulb: \n');
  lamp.turn_on();

  stateOfLamp(lamp);

  print('Wymiana zarowki przy wlaczonej lampie: \n');

  bool change_bulb = lamp.change_bulb();
  print('Lamp ${change_bulb ? 'is' : 'not '} replaced \n');

  stateOfLamp(lamp);

  print('Bulb replacement with lamp off: \n');

  lamp.turn_on();
  change_bulb = lamp.change_bulb();

  print('Lamp ${change_bulb ? 'is' : 'not '} replaced \n');
  stateOfLamp(lamp);
}
