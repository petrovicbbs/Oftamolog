# Oftamolog

Oftamolog je Windows Form desktop aplikacija namenjena oftamološkoj ili 
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

************************************************************************************************
#  Oftamolog DB 
************************************************************************************************

Kratko uputsvo za kreiranje DB Oftamolog v1.2 na vasem racunaru.

Postoje 2 izvršna fajl:
1. CREATE DB.bat
2. DROP DB.bat


# CREATE DB.bat
- Na početku, odmah nakon pokretanja tražiće vam "Server name" Vašeg SQL Servera.
- Nakon unosa Vašeg SQL Servera, program će Vas pitati "Gde želite da izvršite backUp baze:"

  *NAPOMENA: Inicijalni backUp baze se izvršava iz sigurnostnih razloga jer nakon tog momenta, 
  svaka izmena baze sa sobom povlači backup baze.
             
# DROP DB.bat
- Na pocetku, odmah nakon pokretanja tražiće vam "Server name" vašeg SQL Servera.
- Nakon unosa "server name"-a program će sam obrisati sve tragove Oftamolog baze.
  
************************************************************************************************
************************************ SRETNO KORIŠCENJE *****************************************
************************************************************************************************
************************************************************************************************
# Oftamolog - Windows Form desktop aplikacija za ordinacije
Program je završen ali zbog eventualnih zainteresovanih strana nisam u mogućnosti da podelim kod.
Hvala na razumevanju.
************************************************************************************************
