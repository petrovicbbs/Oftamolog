OftamologKG je Windows Form desktop aplikacija namenjena oftamološkoj ili 
bilo kojoj ordinaciji koja treba omogućiti logovanje sledećih rola:

- Lekarskog osoblja(Ordinacija):
	* kreiranje korisnika;
	* izmena korisnika;
		OBAVEZNO: Sa izuzećem korisničkog imena.
	* pretraga pacijenta prema imenu i/ili prezimenu i/ili JMBG-u;
	* pregled istorije svih pacijenta(pri čemu se vide i ustavljeno stanje i terapija);
	* štampanje izveštaja starog pregleda;
	* otvaranje novog pregled pacijenta;
	* čuvanje novog pregleda;
	* štampanje novog pregleda.

- Ostalo osoblje(radnici za pultom):
	* kreiranje korisnika;
	* izmena korisnika;
		OBAVEZNO: Sa izuzećem korisničkog imena.
	* pretraga pacijenta prema imenu i/ili prezimenu i/ili JMBG-u;
	* pregled istorije svih pacijenta(pri čemu se vidi samo terapija);
		OBAVEZNO: Zabrana pregleda(ustanovljenog stanja).
	* štampanje izveštaja starog pregleda.

- Pacijent:
	* izmena sopstvenih podataka;
		OBAVEZNO: Sa izuzećem korisničkog imena.
	* pregled istorije pacijenta(pri čemu se vidi samo terapija);
		OBAVEZNO: Zabrana pregleda svih pacijenata tj. može videti samo svoje preglede.
	* štampanje izveštaja starog pregleda.

- Administrator:
	OBAVEZNO: zabrana pregleda svih pacijenata i svih njihovihpregleda;
	* kreiranje novog korisnika, grada i tipa korisnika;
	* izmena korisnika, grada i tipa korisnika;
	* brisanje korisnika, grada i tipa korisnika;
	* menjanje connection string-a tj. servera i baze;
		NAPOMENA: Postoji i menjanje servera za master DB zbog određenih pozadinskih, 
		sigurnosnih procedura, koje služe za automatsko backup/restore-ovanje.
	* testiranje konekcije;
	* backup-ovanje baza;
		NAPOMENA: Backup-uje se gde odredi administrator.
	* restore-ovanje baze;
		NAPOMENA: Restore-ovanje omogućava i restore-ovanje sa drugih izvora poput externe memorije i dr., 
		nakon čega se vrši i inicijalni backup na lokaciji gde odredi administrator.

NAPOMENA: Odmah nakon instalacije, dok još ne postoji baza, da bi se program podesio na radne parametre, 
moguće je ulogovati se kao korisnik sa rolom Administrator uz pomoć enkriptovanih kredencijali, 
koje instalater dobija samo i samo neposredno pre instalacije programa na medijumu koji je zaštićen od 
kopiranja i za koju je lično odgovoran.
Fajl sa šifrom se ne sme kopirati, kao ni slati putem interneta.
