class Wypozyczalnia {
  // lista garaz
  List<Garaz> garaze = [];
  // lista pojazdy
  List<Pojazd> pojazdy = [];

  Wypozyczalnia(int liczbaGarazy) {
    for (int i = 0; i < liczbaGarazy; i++) {
      garaze.add(Garaz());
    }
  }

  void dodajPojazd(Pojazd p) {
    pojazdy.add(p);
  }

  void usunPojazd(int id) {
    Pojazd pojazd = pojazdy.where((p) => p.id == id).first;
    pojazdy.remove(pojazd);
  }

  void wypiszPojazdy() {
    print("Pojazdy w wypozyczalni");

    pojazdy.forEach((p) => {print(p.toString())});
  }
}

class Garaz {
  // czy pojazd jest parkowalny
  PojazdParkowalny? pojazd;

  // wywoalj garaz
  Garaz();

  zaparkujPojazd(PojazdParkowalny p) {
    pojazd = p;
    print("------");
    print("Pojazd zaparkowano");
    print(p);
    print("------");
    p.zaparkujPojazd(this);
  }
}

abstract class Pojazd {
  // globalne id
  static int globalID = 0;
  int id = 0;
  String nazwa = "";

  @override
  String toString();
}

abstract class PojazdSpalinowy implements Pojazd {
  // bitwise operator artm
  late var rodzajPaliwa = 0x00;
  int iloscPaliwa = 0;

  void tankujPojazd(int ilosc, var rodzaj);
}

abstract class PojazdParkowalny implements Pojazd {
  late Garaz? garaz;

  void zaparkujPojazd(Garaz g);
}

class Samochod implements PojazdSpalinowy, PojazdParkowalny {
  @override
  int id = -1;
  @override
  String nazwa = "";
  @override
  // bitwise operator artm
  var rodzajPaliwa = 0x00;
  @override
  int iloscPaliwa = 0;
  @override
  // tenary
  Garaz? garaz;

  @override
  void zaparkujPojazd(Garaz g) {
    garaz = g;
  }

  @override
  void tankujPojazd(int ilosc, var rodzaj) {
    iloscPaliwa += ilosc;
  }

  @override
  String toString() {
    return 'Samochod <Id> $id, marka $nazwa, rodzaj paliwa $rodzajPaliwa';
  }

  Samochod(this.nazwa, this.rodzajPaliwa) {
    // globalne id
    id = Pojazd.globalID++;
  }
}

class Rower implements PojazdParkowalny {
  @override
  String nazwa = "";
  @override
  int id = -1;

  Rower(this.nazwa) {
    id = Pojazd.globalID++;
  }

  @override
  Garaz? garaz;

  @override
  void zaparkujPojazd(Garaz g) {
    garaz = g;
  }

  @override
  String toString() {
    return 'Rower <Id> $id, nazwa $nazwa';
  }
}

class Motorowka implements PojazdSpalinowy {
  @override
  int id = -1;

  @override
  String nazwa = "";
  @override
  // bitwise operator artm
  var rodzajPaliwa = 0x00;
  @override
  int iloscPaliwa = 0;

  @override
  void tankujPojazd(int ilosc, var rodzaj) {
    iloscPaliwa += ilosc;
  }

  @override
  String toString() {
    return 'Motorowka <Id> $id, marka $nazwa, rodzaj paliwa $rodzajPaliwa';
  }

  Motorowka(this.nazwa, this.rodzajPaliwa) {
    // globalne id
    id = Pojazd.globalID++;
  }
}

class Hulajnoga implements Pojazd {
  @override
  int id = -1;

  @override
  String nazwa = "";

  @override
  String toString() {
    return 'Hulajnoga <Id> $id, nazwa $nazwa';
  }

  Hulajnoga(this.nazwa) {
    // globalne id
    id = Pojazd.globalID++;
  }
}

void main() {
  // okreslanie miejsc w garazu w wypozyczalni
  Wypozyczalnia w = Wypozyczalnia(5);

  Samochod s1 = Samochod("Honda Civic", 0x011);
  Motorowka m1 = Motorowka("Super motorowka", 0x000);
  Samochod s2 = Samochod("Mercedes CLK", 0x100);
  Rower r1 = Rower("Giant");
  Hulajnoga h1 = Hulajnoga("Najfajniejsza hulajnoga");

  // dodawanie pojzadow
  w.dodajPojazd(s1);
  w.dodajPojazd(m1);
  w.dodajPojazd(s2);
  w.dodajPojazd(r1);
  w.dodajPojazd(h1);

  // wypisz pojazdy
  w.wypiszPojazdy();

  // parkuj pojazd
  w.garaze[0].zaparkujPojazd(s1);

  // usun pojazd s1
  w.usunPojazd(0);
  // wypisz
  w.wypiszPojazdy();
}
