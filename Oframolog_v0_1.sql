--v0_2
/*
CREATE DATABASE Oftamolog_v0_1

USE master	DROP DATABASE Oftamolog_v0_1
*/

/* ************** RELACIONI MODEL ****************
Tip_Korisnika(ID,Naziv)
Grad(ID,Naziv,PTT)
Korisnik(ID,korisnickoIme,Sifra,Ime,Prezime,Adresa,GradID,Tel,Email,MB,Tip_KorisnikaID)
Pregled(ID,LekarID,PacijentID,Datum,Nalaz)
-- ***********************************************
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓LEGENDA▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
--/ - Blok naredbi od tekuće tabele
--▓ - Kreiranje i postavljanje FK
--  - Svako naredno postavljanje FK
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓*/
USE Oftamolog_v0_1
/*
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓CREATE▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓*/
/* ////////////////KatArt//////////////////////////// */
CREATE TABLE Tip_Korisnika(
ID INT IDENTITY(1,1),
Naziv nvarchar(30) NOT NULL,
CONSTRAINT PK_Tip_KorisnikaID PRIMARY KEY (ID))		--/ PK: Tip_KorisnikaID		--/ CREATE: Tip_Korisnika
/* ////////////////Grad//////////////////////////// */
CREATE TABLE Grad(
ID INT IDENTITY(1,1),
Naziv nvarchar(50),
PTT varchar(10),
CONSTRAINT PK_GradID PRIMARY KEY (ID))			--/ PK: GradID			--/ CREATE: Grad
/* //////////////////Korisnik////////////////////////// */
CREATE TABLE Korisnik(
ID INT IDENTITY(1,1),
korisnickoIme varchar(30) UNIQUE NOT NULL,
Sifra varchar(30) MASKED WITH (FUNCTION = 'default()') NOT NULL,
Ime nvarchar(30) NOT NULL,
Prezime nvarchar(30) NOT NULL,
Adresa nvarchar(50) NOT NULL,
GradID INT NOT NULL,
Tel varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
MB varchar(20) NOT NULL,
Tip_KorisnikaID INT NOT NULL,
CONSTRAINT PK_MedicinariID PRIMARY KEY (ID),			
FOREIGN KEY (GradID) REFERENCES Grad(ID),			
FOREIGN KEY (Tip_KorisnikaID) REFERENCES Tip_Korisnika(ID))	--/ PK: KorisnikID		-- FK: GradID	-- FK: Tip_KorisnikaID		--/ CREATE: Korisnik
/* ////////////////Pregled//////////////////////////// */
CREATE TABLE Pregled(
ID INT IDENTITY(1,1),
LekarID INT NOT NULL,
PacijentID INT NOT NULL,
Datum date NOT NULL,
Nalaz nvarchar(250) NOT NULL,
CONSTRAINT PK_PregledID PRIMARY KEY (ID),
FOREIGN KEY (LekarID) REFERENCES Korisnik(ID),			
FOREIGN KEY (PacijentID) REFERENCES Korisnik(ID))	--/ PK: PregledID	-- FK: LekarID	-- FK: PacijentID		--/ CREATE: Pregled
/*
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓INSERT▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓*/
/* ************** RELACIONI MODEL ****************
Tip_Korisnika(ID,Naziv)
Grad(ID,Naziv,PTT)
Korisnik(ID,korisnickoIme,Sifra,Ime,Prezime,Adresa,GradID,Tel,Email,MB,Tip_KorisnikaID)
Pregled(ID,LekarID,PacijentID,Datum,Nalaz)
************************************************** */
/*▓//////////////// Tip_Korisnika(ID,Naziv) //////////////////////// */
INSERT INTO Tip_Korisnika VALUES ('Administrator'),('Doktor'),('Medicinsko osoblje'),('Pacijent');			-- Tip_Korisnika
/*▓//////////////// Grad(ID,Naziv,PTT) ////////////////////// */
INSERT INTO Grad VALUES (N'Ada','24430'),(N'Adaševci','22244'),(N'Adorjan','24425'),(N'Adrani','36203'),(N'Aleksinački Rudnik','18226'),(N'Aleksa Šantić','25212'),(N'Aleksandrovac (Kruševački)','37230'),(N'Aleksandrovac (Požarevački)','12370'),(N'Aleksandrovo','23217'),(N'Aleksinac','18220'),(N'Alibunar','26310'),(N'Aljinovici','31307'),(N'Apatin','25260'),(N'Aradac','23207'),(N'Aranđelovac','34300'),(N'Arilje','31230'),(N'Ašanja','22418'),(N'Azanja','11423'),(N'Babin Kal','18315'),(N'Babušnica','18330'),(N'Bač','21420'),(N'Bačevci','31258'),(N'Bačina','37265'),(N'Bačinci','22225'),(N'Bačka Palanka','21400'),(N'Bačka Topola','24300'),(N'Bački Breg','25275'),(N'Bački Brestovac','25242'),(N'Bački Gracac','25252'),(N'Bački Jarak','21234'),(N'Bački Monoštor','25272'),(N'Bački Petrovac','21470'),(N'Bački Sokolac','24343'),(N'Bački Vinogradi','24415'),(N'Bačko Dobro Polje','21465'),(N'Bačko Gradište','21217'),(N'Backo Novo Selo','21429'),(N'Backo Petrovo Selo','21226'),(N'Badnjevac','34226'),(N'Badovinci','15358'),(N'Bagrdan','35204'),(N'Bajina Bašta','31250'),(N'Bajmok','24210'),(N'Bajsa','24331'),(N'Balajinac','18257'),(N'Baljevac Na Ibru','36344'),(N'Banatska Palanka','26324'),(N'Banatsko Aranđelovo','23332'),(N'Banatski Brestovac','26234'),(N'Banatski Despotovac','23242'),(N'Banatsko Karađorđevo','23216'),(N'Banatsko Novo Selo','26314'),(N'Banatska Subotica','26327'),(N'Banatsko Visnjicevo','23237'),(N'Banatska Dubica','23251'),(N'Banatska Topola','23315'),(N'Banatski Dvor','23213'),(N'Banatski Karlovac','26320'),(N'Banatsko Veliko Selo','23312'),(N'Banicina','11424'),(N'Banja','34304'),(N'Banja Kod Priboja','31337'),(N'Banja Koviljaca','15316'),(N'Banjani','14214'),(N'Banjska','38216'),(N'Banostor','21312'),(N'Banovci Dunav','22303'),(N'Banovo Polje','15362'),(N'Barajevo','11460'),(N'Baranda','26205'),(N'Barbatovac','18426'),(N'Bare','34205'),(N'Baric','11504'),(N'Barice','26367'),(N'Barlovo','18432'),(N'Barosevac','11565'),(N'Basaid','23316'),(N'Batocina','34227'),(N'Batrovci','22251'),(N'Bavaniste','26222'),(N'Bečej','21220'),(N'Becmen','11279'),(N'Begaljica','11308'),(N'Begeč','21411'),(N'Begejci','23232'),(N'Bela Crkva','26340'),(N'Bela Crkva (kod Krupnja)','15313'),(N'Bela Palanka','18310'),(N'Bela Voda','37253'),(N'Bela Zemlja','31311'),(N'Belanovica','14246'),(N'Bele Vode','32259'),(N'Belegiš','22306'),(N'Beli Potok','11223'),(N'Beli Potok (kod Svrljiga)','19366'),(N'Beljina','11461'),(N'Belo Blato','23205'),(N'Beloljin','18424'),(N'Belosavci','34312'),(N'Belotinac','18411'),(N'Belusic','35263'),(N'Beocin','21300'),(N'Beograd','11000'),(N'Berkasovo','22242'),(N'Beršići','32305'),(N'Besenovo','22212'),(N'Beška','22324'),(N'Bezdan','25270'),(N'Bigrenica','35238'),(N'Bikic Do','22254'),(N'Bikovo','24206'),(N'Biljaca','17522'),(N'Bingula','22253'),(N'Bioska','31241'),(N'Bistar','17546'),(N'Bistrica','31325'),(N'Blace','18420'),(N'Blazevo','37226'),(N'Bobovo','35217'),(N'Bocar','23274'),(N'Bođani','21427'),(N'Bogaraš','24408'),(N'Bogatić','15350'),(N'Bogojevo','25245'),(N'Bogovađa','14225'),(N'Bogovina','19372'),(N'Bogutovac','36341'),(N'Bojnik','16205'),(N'Boka','23252'),(N'Boleč','11307'),(N'Boljevac','19370'),(N'Boljevci','11275'),(N'Boljkovci','32312'),(N'Bor','19210'),(N'Borča','11211'),(N'Borski Brestovac','19229'),(N'Borsko Bucje','19231'),(N'Bosilegrad','17540'),(N'Bošnjace','16232'),(N'Bošnjane','37262'),(N'Bosut','22217'),(N'Botoš','23243'),(N'Božetići','31322'),(N'Boževac','12313'),(N'Božica','17537'),(N'Braćevac','19315'),(N'Bradarac','12206'),(N'Braničevo','12222'),(N'Brankovina','14201'),(N'Bratinac','12225'),(N'Bratljevo','32256'),(N'Brđani','32303'),(N'Brekovo','31234'),(N'Bresnica','32213'),(N'Brestac','22415'),(N'Brestovacka Banja','19216'),(N'Brestovac','16253'),(N'Brezane','12205'),(N'Brezde','14244'),(N'Brezjak','15309'),(N'Brezna','32307'),(N'Brezova','32253'),(N'Brezovica','38157'),(N'Brgule','14212'),(N'Brnjica','12230'),(N'Brodarevo','31305'),(N'Brus','37220'),(N'Brusnik','19313'),(N'Brvenik','36346'),(N'Brza Palanka','19323'),(N'Brzan','34228'),(N'Brzeće','37225'),(N'Bučje','19369'),(N'Buđanovci','22421'),(N'Budisava','21242'),(N'Bujanovac','17520'),(N'Bukovac','21209'),(N'Bukovica','32251'),(N'Bukovik','34301'),(N'Bukurovac','34217'),(N'Bumbarevo Brdo','34242'),(N'Bunar','35273'),(N'Burdimo','18368'),(N'Burovac','12307'),(N'Busilovac','35249'),(N'Cerovac','15224'),(N'Crepaja','26213'),(N'Crkvine','36321'),(N'Crna Bara','23328'),(N'Crna Bara','15355'),(N'Crna Trava','16215'),(N'Crnoklište','18304'),(N'Crvena Crkva','26323'),(N'Crvena Reka','18313'),(N'Crvenka','25220'),(N'Čačak','32000'),(N'Čajetina','31310'),(N'Čalma','22231'),(N'Čantavir','24220'),(N'Čecina','18417'),(N'Čelarevo','21413'),(N'Čenej','21233'),(N'Čenta','23266'),(N'Čerević','21311'),(N'Čestereg','23215'),(N'Čitluk (kod Kruševca)','37208'),(N'Čitluk (kod Soko Banje)','18232'),(N'Čoka','23320'),(N'Čonoplja','25210'),(N'Čortanovci','22326'),(N'Čurug','21238'),(N'Čukojevac','36220'),(N'Čumić','34322'),(N'Ćićevac','37210'),(N'Ćuprija','35230'),(N'Darosava','34305'),(N'Dasnica','37271'),(N'Debeljača','26214'),(N'Debrc','15214'),(N'Deč','22441'),(N'Deliblato','26225'),(N'Delimede','36307'),(N'Deronje','25254'),(N'Desimirovac','34321'),(N'Despotovac','35213'),(N'Despotovo','21468'),(N'Devojački Bunar','26316'),(N'Deževa','36305'),(N'Dimitrovgrad','18320'),(N'Divci','14222'),(N'Divčibare','14204'),(N'Divljaka','31236'),(N'Divoš','22232'),(N'Divostin','34204'),(N'Dobanovci','11272'),(N'Dobra','12224'),(N'Dobri Do','18408'),(N'Dobrić','15235'),(N'Dobrica','26354'),(N'Dobrinci','22412'),(N'Dolac','18314'),(N'Doljevac','18410'),(N'Dolovo','26227'),(N'Donja Bela Reka','19213'),(N'Donja Borina','15317'),(N'Donja Kamenica','19352'),(N'Donja Livadica','11326'),(N'Donja Ljubata','17544'),(N'Donja Mutnica','35255'),(N'Donja Orovica','15323'),(N'Donja Rečica','18404'),(N'Donja Šatornja','34314'),(N'Donja Trnava','18421'),(N'Donje Vidovo','35258'),(N'Donje Crnatovo','18414'),(N'Donje Crniljevo','15227'),(N'Donje Medurovo','18254'),(N'Donje Tlamino','17547'),(N'Donje Zuniče','19345'),(N'Donji Dušnik','18242'),(N'Donji Krčin','37258'),(N'Donji Milanovac','19220'),(N'Donji Stajevac','17526'),(N'Doroslovo','25243'),(N'Dračić','14203'),(N'Draginac','15311'),(N'Draginje','15226'),(N'Draglica','31317'),(N'Dragobraca','34231'),(N'Dragocvet','35272'),(N'Dragoševac','35262'),(N'Dragovo','35265'),(N'Drajkovce','38239'),(N'Draževac','11506'),(N'Draževac (kod Aleksinca)','18223'),(N'Drenovac','15212'),(N'Drenovac (kod Paraćina)','35257'),(N'Drlače','15324'),(N'Drugovac','11432'),(N'Dublje','15359'),(N'Duboka','12255'),(N'Dubovac','26224'),(N'Dubovo','18406'),(N'Dubravica','12207'),(N'Dudovica','11561'),(N'Duga Poljana','36312'),(N'Dugo Polje','18237'),(N'Dušanovac','19335'),(N'Dupljaja','26328'),(N'Dvorane','37206'),(N'Džep','17514'),(N'Džigolj','18405'),(N'Đala','23335'),(N'Đeneral Janković','38238'),(N'Đunis','37202'),(N'Đurđevo','21239'),(N'Đurđevo (kod Kragujevca)','34215'),(N'Đurđin','24213'),(N'Ečka','23203'),(N'Elemir','23208'),(N'Erdeč','34207'),(N'Erdevik','22230'),(N'Farkaždin','23264'),(N'Feketić','24323'),(N'Futog','21410'),(N'Gadžin Han','18240'),(N'Gaj','26223'),(N'Gajdobra','21432'),(N'Gakovo','25282'),(N'Gamzigradska Banja','19228'),(N'Gardinovci','21247'),(N'Gibarac','22258'),(N'Glavinci','35261'),(N'Globoder','37251'),(N'Glogonj','26202'),(N'Glogovac','35222'),(N'Gložan','21412'),(N'Glušci','15356'),(N'Golobok','11316'),(N'Golubac','12223'),(N'Golubinci','22308'),(N'Goračići','32232'),(N'Goričani','32225'),(N'Gornja Dobrinja','31214'),(N'Gornja Draguša','18425'),(N'Gornja Lisina','17538'),(N'Gornja Sabanta','34206'),(N'Gornja Toplica','14243'),(N'Gornja Toponica','18202'),(N'Gornja Trepča','32215'),(N'Gornji Banjani','32306'),(N'Gornji Barbeš','18241'),(N'Gornji Breg','24406'),(N'Gornji Brestovac','16244'),(N'Gornji Milanovac','32300'),(N'Gornji Matejevac','18204'),(N'Gornji Stepos','37221'),(N'Gornji Stupanj','37234'),(N'Gospođinci','21237'),(N'Gostilje','31313'),(N'Grabovac','11508'),(N'Grabovci','22423'),(N'Gracanica','38205'),(N'Gradina','18321'),(N'Gradskovo','19205'),(N'Graševci','37229'),(N'Grdelica','16220'),(N'Grebenac','26347'),(N'Gredetin','18213'),(N'Grejač','18219'),(N'Grgurevci','22213'),(N'Grlište','19342'),(N'Grljan','19341'),(N'Grocka','11306'),(N'Grošnica','34202'),(N'Gruža','34230'),(N'Guberevac','34232'),(N'Guča','32230'),(N'Gudurica','26335'),(N'Gunaroš','24312'),(N'Guševac','18208'),(N'Gušterica','38209'),(N'Hajdučica','26370'),(N'Hajdukovo','24414'),(N'Halovo','19236'),(N'Hetin','23235'),(N'Horgoš','24410'),(N'Horgoš Granični Prelaz','24411'),(N'Hrtkovci','22427'),(N'Iđoš','23323'),(N'Idvor','26207'),(N'Ilandža','26352'),(N'Ilićevo','34203'),(N'Ilinci','22250'),(N'Inđija','22320'),(N'Irig','22406'),(N'Iriški Venac','22407'),(N'Ivanjica','32250'),(N'Ivanovo','26233'),(N'Izbište','26343'),(N'Jablanica','31314'),(N'Jabučje','14226'),(N'Jabuka','31306'),(N'Jabukovac','19304'),(N'Jadranska Lešnica','15308'),(N'Jagnjilo','11412'),(N'Jagodina','35000'),(N'Jakovo','11276'),(N'Jamena','22248'),(N'Janošik','26362'),(N'Jarak','22426'),(N'Jarkovac','23250'),(N'Jarmenovci','34318'),(N'Jaša Tomić','23230'),(N'Jasenovo','26346'),(N'Jasenovo (kod Nove Varoši)','31319'),(N'Jasenovo (kod Despotovca)','35241'),(N'Jasika','37252'),(N'Jazak','22409'),(N'Jazovo','23327'),(N'Jelašnica','18206'),(N'Jelašnica','17531'),(N'Jelen Do','31215'),(N'Jelovik','34309'),(N'Jermenovci','26363'),(N'Ježevica','32222'),(N'Ježevica (Užička)','31213'),(N'Jošanica','18234'),(N'Jošanicka Banja','36345'),(N'Jovac','35205'),(N'Jugbogdanovac','18253'),(N'Junkovac','11562'),(N'Kać','21241'),(N'Kačarevo','26212'),(N'Kajtasovo','26329'),(N'Kalna','19353'),(N'Kaluđerske Bare','31257'),(N'Kaluđerica','11130'),(N'Kamenica (kod Čačka)','32206'),(N'Kamenica (kod Dimitrovgrada)','18324'),(N'Kamenica (Valjevska)','14252'),(N'Kanjiža','24420'),(N'Kaona','32234'),(N'Kaonik','37256'),(N'Karađorđevo','21421'),(N'Karan','31204'),(N'Karavukovo','25255'),(N'Karlovčić','22443'),(N'Katun','18225'),(N'Kelebija','24104'),(N'Kelebija Granični Prelaz','24205'),(N'Kevi','24407'),(N'Kikinda','23300'),(N'Kisač','21211'),(N'Kladovo','19320'),(N'Klek','23211'),(N'Klenak','22424'),(N'Klenike','17524'),(N'Klenje','15357'),(N'Klenje (kod Golubca)','12258'),(N'Kličevac','12209'),(N'Klisura','17535'),(N'Kljajićevo','25221'),(N'Klokočevac','19222'),(N'Knić','34240'),(N'Knićanin','23265'),(N'Knjaževac','19350'),(N'Kobišnica','19316'),(N'Koceljeva','15220'),(N'Kokin Brod','31318'),(N'Kolare','35242'),(N'Kolari','11431'),(N'Kolut','25274'),(N'Komirić','14254'),(N'Konak','23253'),(N'Konarevo','36340'),(N'Končarevo','35219'),(N'Konjuh','37254'),(N'Kopaonik','36354'),(N'Koprivnica','19223'),(N'Koračica','11415'),(N'Korbevac','17545'),(N'Korbovo','19329'),(N'Korenita','15302'),(N'Korman','18216'),(N'Korman (Kragujevački)','34224'),(N'Kosovska Mitrovica','38220'),(N'Kosančić','16206'),(N'Kosjerić','31260'),(N'Kosovo Polje','38210'),(N'Kostojevići','31254'),(N'Kostolac','12208'),(N'Kotraža','32235'),(N'Kovačevac','11409'),(N'Kovačica','26210'),(N'Kovilj','21243'),(N'Kovilje','32257'),(N'Kovin','26220'),(N'Kragujevac','34000'),(N'Krajišnik','23231'),(N'Kraljevci','22411'),(N'Kraljevo','36000'),(N'Krčedin','22325'),(N'Kremna','31242'),(N'Krepoljin','12316'),(N'Kriva Feja','17543'),(N'Kriva Reka','37282'),(N'Krivaja','24341'),(N'Krivelj','19219'),(N'Krivi Vir','19375'),(N'Krnješevci','22314'),(N'Krnjevo','11319'),(N'Krupac','18307'),(N'Krupanj','15314'),(N'Krušar','35227'),(N'Kruščić','25225'),(N'Kruščica','31233'),(N'Krušedol','22328'),(N'Kruševac','37000'),(N'Kruševica','18409'),(N'Kučevo','12240'),(N'Kucura','21466'),(N'Kukljin','37255'),(N'Kukujevci','22224'),(N'Kula','25230'),(N'Kulina','18214'),(N'Kulpin','21472'),(N'Kumane','23271'),(N'Kupci','37222'),(N'Kupinik','26368'),(N'Kupinovo','22419'),(N'Kupusina','25262'),(N'Kuršumlija','18430'),(N'Kuršumlijska Banja','18435'),(N'Kusadak','11425'),(N'Kusić','26349'),(N'Kušići','32258'),(N'Kušiljevo','35226'),(N'Kuštilj','26336'),(N'Kuzmin','22223'),(N'Laćarak','22221'),(N'Laćisled','37232'),(N'Lađevci','36204'),(N'Lajkovac','14224'),(N'Lalić','25234'),(N'Lalinac','18201'),(N'Lapovo','34220'),(N'Lapovo Selo','34223'),(N'Lazarevac','11550'),(N'Lazarevo','23241'),(N'Laznica','12321'),(N'Lebane','16230'),(N'Lece','16248'),(N'Ledinci','21207'),(N'Lelić','14205'),(N'Lenovac','19343'),(N'Lepenac','37224'),(N'Lepenica','17513'),(N'Leposavić','38218'),(N'Lesak','38219'),(N'Leskovac','16000'),(N'Lešnica','15307'),(N'Leštane','11309'),(N'Lezimir','22207'),(N'Lički Hanovi','18245'),(N'Lipar','25232'),(N'Lipe','11310'),(N'Lipolist','15305'),(N'Loćika','35274'),(N'Lok','21248'),(N'Lokve','26361'),(N'Lovćenac','24322'),(N'Loznica','15300'),(N'Lozovik','11317'),(N'Lubnica','19208'),(N'Lučani','32240'),(N'Lug','21315'),(N'Lugavčina','11321'),(N'Luka','19234'),(N'Lukare','36306'),(N'Lukićevo','23261'),(N'Lukino Selo','23224'),(N'Lukovo','19371'),(N'Lukovo (kod Kuršumlije)','18437'),(N'Lunovo Selo','31203'),(N'Lužane','18228'),(N'Lužnice','34325'),(N'Ljig','14240'),(N'Ljuba','22255'),(N'Ljuberađa','18217'),(N'Ljubiš','31209'),(N'Ljubovija','15320'),(N'Ljukovo','22321'),(N'Ljutovo','24215'),(N'Mala Moštanica','11261'),(N'Mačkat','31312'),(N'Mačvanska Mitrovica','22202'),(N'Mačvanski Pričinović','15211'),(N'Maglić','21473'),(N'Majdan','23333'),(N'Majdanpek','19250'),(N'Majilovac','12221'),(N'Majur','15353'),(N'Majur (kod Jagodine)','35270'),(N'Mala Bosna','24217'),(N'Mala Krsna','11313'),(N'Mala Plana','18423'),(N'Malča','18207'),(N'Male Pčelice','34216'),(N'Male Pijace','24416'),(N'Mali Beograd','24309'),(N'Mali Iđoš','24321'),(N'Mali Izvor','19347'),(N'Mali Jasenovac','19209'),(N'Mali Požarevac','11235'),(N'Mali Zvornik','15318'),(N'Malo Crniće','12311'),(N'Malo Krčmare','34212'),(N'Malošište','18415'),(N'Manđelos','22208'),(N'Manojlovce','16201'),(N'Maradik','22327'),(N'Margita','26364'),(N'Markovac','11325'),(N'Markovica','32243'),(N'Maršić','34209'),(N'Martinci','22222'),(N'Martonoš','24417'),(N'Mataruška Banja','36201'),(N'Međa','23234'),(N'Medoševac','18209'),(N'Međurečje','32255'),(N'Medveđa','16240'),(N'Medveđa (kod Despotovca)','35224'),(N'Medveđa (kod Trstenika)','37244'),(N'Melenci','23270'),(N'Meljak','11426'),(N'Melnica','12305');
INSERT INTO Grad VALUES (N'Merćez','18436'),(N'Merdare','18445'),(N'Merošina','18252'),(N'Metlić','15233'),(N'Metovnica','19204'),(N'Mihajlovac (kod Smedereva)','11312'),(N'Mihajlovac (Krajinski)','19322'),(N'Mihajlovo','23202'),(N'Mijatovac','35236'),(N'Milentija','37227'),(N'Mileševo','21227'),(N'Miletićevo','26373'),(N'Miloševac','11318'),(N'Miloševo','35268'),(N'Milutovac','37246'),(N'Minićevo','19340'),(N'Mionica','14242'),(N'Mirosaljci','11567'),(N'Miroševce','16204'),(N'Mišićevo','24211'),(N'Mitrovac','31251'),(N'Mladenovac','11400'),(N'Mladenovo','21422'),(N'Mojsinje','32211'),(N'Mokra Gora','31243'),(N'Mokranja','19317'),(N'Mokrin','23305'),(N'Mol','24435'),(N'Molovin','22256'),(N'Morović','22245'),(N'Mošorin','21245'),(N'Mozgovo','18229'),(N'Mramor','18251'),(N'Mramorak','26226'),(N'Mrčajevci','32210'),(N'Muhovac','17529'),(N'Mužlja','23206'),(N'Nadalj','21216'),(N'Nakovo','23311'),(N'Natalinci','34313'),(N'Negotin','19300'),(N'Neresnica','12242'),(N'Neštin','21314'),(N'Neuzina','23245'),(N'Nikinci','22422'),(N'Nikolićevo','19311'),(N'Nikolinci','26322'),(N'Niš','18000'),(N'Niševac','18366'),(N'Niška Banja','18205'),(N'Noćaj','22203'),(N'Nova Crnja','23218'),(N'Nova Crvenka','25224'),(N'Nova Gajdobra','21431'),(N'Nova Pazova','22330'),(N'Nova Varoš','31320'),(N'Novi Banovci','22304'),(N'Novi Bečej','23272'),(N'Novi Itebej','23236'),(N'Novi Karlovci','22322'),(N'Novi Kneževac','23330'),(N'Novi Kozarci','23313'),(N'Novi Kozjak','26353'),(N'Novi Pazar','36300'),(N'Novi Sad','21000'),(N'Novi Slankamen','22323'),(N'Novi Žednik','24223'),(N'Novo Lanište','35271'),(N'Novo Miloševo','23273'),(N'Novo Orahovo','24351'),(N'Novo Selo','18250'),(N'Njegoševo','24311'),(N'Obrenovac','11500'),(N'Obrež','37266'),(N'Obrež (Srem)','22417'),(N'Obrovac','21423'),(N'Odžaci','25250'),(N'Ogar','22416'),(N'Omoljica','26230'),(N'Oparić','35267'),(N'Opovo','26204'),(N'Orane','16233'),(N'Oraovica','17557'),(N'Orašac','34308'),(N'Orešković','24344'),(N'Oreškovica','12308'),(N'Orid','15213'),(N'Orlovat','23263'),(N'Orom','24207'),(N'Osaonica','12317'),(N'Osečina','14253'),(N'Osipaonica','11314'),(N'Osnić','19378'),(N'Ostojićevo','23326'),(N'Ostrovica','18312'),(N'Ostružnica','11251'),(N'Ovča','11212'),(N'Ovčar Banja','32242'),(N'Pačir','24342'),(N'Padinska Skela','11213'),(N'Padej','23325'),(N'Padež','37257'),(N'Padina','26215'),(N'Palić','24413'),(N'Palilula','18363'),(N'Pambukovica','14213'),(N'Pančevo','26000'),(N'Panonija','24330'),(N'Paraćin','35250'),(N'Parage','21434'),(N'Parunovac','37201'),(N'Pasjane','38266'),(N'Pavliš','26333'),(N'Pečanjevce','16251'),(N'Pećinci','22410'),(N'Pecka','14207'),(N'Pejkovac','18413'),(N'Pepeljevac','37231'),(N'Perlez','23260'),(N'Perućac','31256'),(N'Petlovača','15304'),(N'Petrovac Na Mlavi','12300'),(N'Petrovaradin','21131'),(N'Pinosava','11226'),(N'Pirot','18300'),(N'Pivnice','21469'),(N'Plana','35247'),(N'Plandište','26360'),(N'Planinica','19207'),(N'Platičevo','22420'),(N'Plavna','21428'),(N'Plažane','35212'),(N'Pleš','37238'),(N'Ploča','37237'),(N'Pločica','26229'),(N'Pobeda','24313'),(N'Počekovina','37243'),(N'Poćuta','14206'),(N'Podunavci','36215'),(N'Podvis','19362'),(N'Podvrška','19321'),(N'Poganovo','18326'),(N'Pojate','37214'),(N'Poljana','12372'),(N'Popinci','22428'),(N'Popovac','18260'),(N'Popovac (kod Paraćina)','35254'),(N'Popučke','14221'),(N'Porodin','12375'),(N'Potočac','35207'),(N'Požarevac','12000'),(N'Požega','31210'),(N'Prahovo','19330'),(N'Pranjani','32308'),(N'Predejane','16222'),(N'Prekonoga','18365'),(N'Preljina','32212'),(N'Preševo','17523'),(N'Prevešt','35264'),(N'Prhovo','22442'),(N'Priboj','31330'),(N'Priboj Vranjski','17511'),(N'Pričević','14251'),(N'Prigrevica','25263'),(N'Prijepolje','31300'),(N'Prilički Kiseljak','32252'),(N'Prilužje','38213'),(N'Privina Glava','22257'),(N'Prnjavor Mačvanski','15306'),(N'Progar','11280'),(N'Prokuplje','18400'),(N'Prolom','18433'),(N'Provo','15215'),(N'Pružatovac','11413'),(N'Pukovac','18255'),(N'Putinci','22404'),(N'Rabrovo','12254'),(N'Rača','18440'),(N'Rača Kragujevačka','34210'),(N'Radalj','15321'),(N'Radenković','22206'),(N'Radičević','21225'),(N'Radinac','11311'),(N'Radljevo','14211'),(N'Radojevo','23221'),(N'Radujevac','19334'),(N'Rajac','19314'),(N'Rajković','14202'),(N'Rakinac','11327'),(N'Rakovac','21299'),(N'Ralja','11233'),(N'Ranilović','34302'),(N'Ranilug','38267'),(N'Ranovac','12304'),(N'Rašanac','12315'),(N'Raševica','35206'),(N'Raška','36350'),(N'Rastina','25283'),(N'Rataje','37236'),(N'Ratari','11411'),(N'Ratina','36212'),(N'Ratkovo','25253'),(N'Ravna Dubrava','18246'),(N'Ravna Reka','35235'),(N'Ravni','31206'),(N'Ravni Topolovac','23212'),(N'Ravnje','22205'),(N'Ravno Selo','21471'),(N'Ražana','31265'),(N'Ražanj','37215'),(N'Razbojna','37223'),(N'Razgojna','16252'),(N'Rekovac','35260'),(N'Reljan','17556'),(N'Resavica','35237'),(N'Resnik','34225'),(N'Rgotina','19214'),(N'Ribare (kod Jagodine)','35220'),(N'Ribari','15310'),(N'Ribarići','36309'),(N'Ribarska Banja','37205'),(N'Riđica','25280'),(N'Ripanj','11232'),(N'Ristovac','17521'),(N'Ritisevo','26331'),(N'Roćevci','36205'),(N'Rogača','11453'),(N'Rogačica','31255'),(N'Roge','31237'),(N'Rogljevo','19318'),(N'Rožanstvo','31208'),(N'Rudna Glava','19257'),(N'Rudnica','36353'),(N'Rudnik','32313'),(N'Rudno','36222'),(N'Rudovci','11566'),(N'Ruma','22400'),(N'Rumenka','21201'),(N'Ruplje','16223'),(N'Rušanj','11194'),(N'Ruski Krstur','25233'),(N'Rusko Selo','23314'),(N'Rutevac','18224'),(N'Sajan','23324'),(N'Sakule','26206'),(N'Salaš','19224'),(N'Salaš Noćajski','22204'),(N'Samaila','36202'),(N'Samoš','26350'),(N'Sanad','23331'),(N'Saraorci','11315'),(N'Sastav Reka','16213'),(N'Sastavci','31335'),(N'Savinac','19377'),(N'Savino Selo','21467'),(N'Seča Reka','31262'),(N'Sečanj','23240'),(N'Sedlare','35211'),(N'Sefkerin','26203'),(N'Selenča','21425'),(N'Seleuš','26351'),(N'Selevac','11407'),(N'Senta','24400'),(N'Senje','35233'),(N'Senjski Rudnik','35234'),(N'Sevojno','31205'),(N'Sibač','22440'),(N'Sibnica','11454'),(N'Sićevo','18311'),(N'Sijarinska Banja','16246'),(N'Sikirica','35256'),(N'Sikole','19225'),(N'Silbaš','21433'),(N'Simićevo','12373'),(N'Siokovac','35203'),(N'Sip','19326'),(N'Sirča','36208'),(N'Sirig','21214'),(N'Sirogojno','31207'),(N'Sivac','25223'),(N'Sjenica','36310'),(N'Skela','11509'),(N'Skobaj','11322'),(N'Skorenovac','26228'),(N'Slankamenački Vinogradi','22318'),(N'Slatina (kod čačka)','32224'),(N'Slavkovica','14245'),(N'Slovac','14223'),(N'Smederevo','11300'),(N'Smederevska Palanka','11420'),(N'Smilovci','18323'),(N'Smoljinac','12312'),(N'Soko Banja','18230'),(N'Sombor','25000'),(N'Sonta','25264'),(N'Sopoćani','36308'),(N'Sopot','11450'),(N'Sot','22243'),(N'Srbobran','21480'),(N'Srednjevo','12253'),(N'Sremčica','11253'),(N'Sremska Kamenica','21208'),(N'Sremska Mitrovica','22000'),(N'Sremska Rača','22247'),(N'Sremski Karlovci','21205'),(N'Sremski Mihaljevci','22413'),(N'Srpska Crnja','23220'),(N'Srpski Itebej','23233'),(N'Srpski Krstur','23334'),(N'Srpski Miletić','25244'),(N'Stajićevo','23204'),(N'Stalać','37212'),(N'Stanišić','25284'),(N'Stapar','25240'),(N'Stara Moravica','24340'),(N'Stara Pazova','22300'),(N'Starčevo','26232'),(N'Stari Banovci','22305'),(N'Stari Lec','26371'),(N'Stari Slankamen','22329'),(N'Stari Žednik','24224'),(N'Staro Selo (kod Velike Plane)','11324'),(N'Stave','14255'),(N'Stejanovci','22405'),(N'Stenjevac','35215'),(N'Stepanovićevo','21212'),(N'Stepojevac','14234'),(N'Stojnik','34307'),(N'Stopanja','37242'),(N'Stragari','34323'),(N'Straža (Banat)','26345'),(N'Strelac','18332'),(N'Strižilo','35269'),(N'Stubline','11507'),(N'Studenica','36343'),(N'Subotica','24000'),(N'Subotica (kod Svilajnca)','35209'),(N'Subotinac','18227'),(N'Subotište','22414'),(N'Sukovo','18322'),(N'Sumrakovac','19376'),(N'Supska','35228'),(N'Surčin','11271'),(N'Surduk','22307'),(N'Surdulica','17530'),(N'Susek','21313'),(N'Sutjeska','23244'),(N'Suvi Do','12322'),(N'Sveti Ilija','17508'),(N'Svetozar MiIetić','25211'),(N'Svilajnac','35210'),(N'Svileuva','15221'),(N'Svilojevo','25265'),(N'Svođe','16212'),(N'Svrljig','18360'),(N'Svojnovo','35259'),(N'Šabac','15000'),(N'Šajkaš','21244'),(N'Šarbanovac','19373'),(N'Šašinci','22425'),(N'Šepšin','11433'),(N'Šetonje','12309'),(N'Šid','22240'),(N'Šilopaj','32311'),(N'Šimanovci','22310'),(N'Šljivovica','31244'),(N'Šljivovo','37239'),(N'Štavalj','36311'),(N'Štitar','15354'),(N'Štubik','19303'),(N'Šurjan','23254'),(N'Takovo','32304'),(N'Taraš','23209'),(N'Tavankut','24214'),(N'Tekeriš','15234'),(N'Tekija','19325'),(N'Telečka','25222'),(N'Temerin','21235'),(N'Temska','18355'),(N'Tešica','18212'),(N'Titel','21240'),(N'Toba','23222'),(N'Tomaševac','23262'),(N'Topola','34310'),(N'Topolovnik','12226'),(N'Toponica','34243'),(N'Torda','23214'),(N'Tornjoš','24352'),(N'Tovariševo','21424'),(N'Trbušani','32205'),(N'Trešnjevac','24426'),(N'Trešnjevica','35248'),(N'Trgovište','17525'),(N'Trnava (kod (čačka)','32221'),(N'Trnavci','37235'),(N'Trnjane','19306'),(N'Trstenik','37240'),(N'Tršić','15303'),(N'Trupale','18211'),(N'Tulare','16247'),(N'Turekovac','16231'),(N'Turija (kod Kučeva)','12257'),(N'Turija','21215'),(N'Tutin','36320'),(N'Ub','14210'),(N'Ugao','36313'),(N'Ugrinovci','32314'),(N'Ugrinovci (kod Batajnice)','11277'),(N'Uljma','26330'),(N'Umčari','11430'),(N'Umka','11260'),(N'Urovica','19305'),(N'Utrine','24437'),(N'Ušće','36342'),(N'Uzdin','26216'),(N'Uzovnica','15319'),(N'Užice','31000'),(N'Vajska','21426'),(N'Valjevo','14000'),(N'Varda 031','31263'),(N'Varna (kod Šapca)','15232'),(N'Varvarin','37260'),(N'Vasilj','19367'),(N'Vatin','26337'),(N'Vašica','22241'),(N'Velesnica','19328'),(N'Velika Drenova','37245'),(N'Velika Grabovica','16221'),(N'Velika Greda','26366'),(N'Velika Ivanča','11414'),(N'Velika Krsna','11408'),(N'Velika Lomnica','37209'),(N'Velika Lukanja','18305'),(N'Velika Moštanica','11206'),(N'Velika Plana','11320'),(N'Velika Plana (Toplička)','18403'),(N'Velika Reka','15322'),(N'Velika Vrbnica','37233'),(N'Velike Livade','23217'),(N'Veliki Borak','11462'),(N'Veliki Crljeni','14233'),(N'Veliki Gaj','26365'),(N'Veliki lzvor','19206'),(N'Veliki Popović','35223'),(N'Veliki Radinci','22211'),(N'Veliki Šiljegovac','37204'),(N'Veliko Bonjince','18217'),(N'Veliko Gradište','12220'),(N'Veliko Laole','12306'),(N'Veliko Orašje','11323'),(N'Veliko Selo','12314'),(N'Veliko Središte','26334'),(N'Venčane','34306'),(N'Veternik','21203'),(N'Viča','32233'),(N'Vilovo','21246'),(N'Vina','19368'),(N'Vinarce','16207'),(N'Vionica','32254'),(N'Visočka Ržana','18306'),(N'Višnjevac','24222'),(N'Višnjićevo','22246'),(N'Vitanovac','36206'),(N'Vitkavac','36207'),(N'Vitojevci','22431'),(N'Vitoševac','37213'),(N'Vladičin Han','17510'),(N'Vladimirci','15225'),(N'Vladimirovac','26315'),(N'Vlajkovac','26332'),(N'Vlase','17507'),(N'Vlasina Okruglica','17532'),(N'Vlasina Rid','17533'),(N'Vlasina Stojkovićeva','17534'),(N'Vlasotince','16210'),(N'Vlaška','11406'),(N'Vlaški Do','12371'),(N'Vodanj','11328'),(N'Voganj','22429'),(N'Vojka','22313'),(N'Vojska','35208'),(N'Vojvoda Stepa','23219'),(N'Voluja','12256'),(N'Vraćevšnica','32315'),(N'Vračev Gaj','26348'),(N'Vranić','11427'),(N'Vranovo','11329'),(N'Vranje','17000'),(N'Vranjska Banja','17542'),(N'Vratamica','19344'),(N'Vražogrnac','19312'),(N'Vrba','36214'),(N'Vrbas','21460'),(N'Vrbica','23329'),(N'Vrčin','11224'),(N'Vrdnik','22408'),(N'Vreoci','14230'),(N'Vrnjačka Banja','36210'),(N'Vrnjci','36217'),(N'Vršac','26300'),(N'Vučje','16203'),(N'Zablaće','32223'),(N'Zabojnica','34244'),(N'Zabrežje','11505'),(N'Zagaljica','26344'),(N'Zajača','15315'),(N'Zaječar','19000'),(N'Zasavica','22201'),(N'Zavlaka','15312'),(N'Zdravinje','37203'),(N'Zemun','11080'),(N'Zlatibor','31315'),(N'Zlodol','31253'),(N'Zlot','19215'),(N'Zmajevo','21213'),(N'Zrenjanin','23000'),(N'Zuce','11225'),(N'Zvezdan','19227'),(N'Zvonce','18333'),(N'Žabalj','21230'),(N'Žabari','12374'),(N'Žagubica','12320'),(N'Železnik','11250'),(N'Žitište','23210'),(N'Žitkovac','18210'),(N'Žitni Potok','18407'),(N'Žitorađa','18412'),(N'Žuć','18348');
/*▓//////////////// Medicinar(ID,korisnickoIme,Sifra,Ime,Prezime,Adresa,GradID,Tel,Email,MB,Tip_KorisnikaID) ////////////////////// */
INSERT INTO Korisnik VALUES
('admin','admin',N'Vladimir',N'Petrović',N'Bačka 55',103,'011/321-34-54','petrovicbbs@yahoo.com','2510987710131',1),
('dr.Zeus','admin2',N'Doktor',N'Zeus',N'Filmska 52',103,'011/789-45-61','bruske.ojska@yahoo.com','1234567890123',2),
('Dule91','dule91bgk',N'Dušan',N'Mandrapa',N'Požeška 666',103,'011/387-14-76','dusan.mandrapa@yahoo.com','0330991710009',3),
('Alex93','GummyBears',N'Aleksandra',N'Vukadinović',N'Cara Dušana 43',103,'011/915-23-93','aleksandra.vuk@yahoo.com','1805993715009',4),
('Maruska','Marija123',N'Marija',N'Jelić',N'Kačanička 41b',33,'011/123-34-45','marija.maruska@yahoo.com','0509986715123',4)
/*▓///////// Pregled(ID,LekarID,PacijentID,Datum,Nalaz) ///// */
INSERT INTO Pregled VALUES
(2,4, '20190201' ,'VOD: sc = 0,5 cc - 2,00 Dsph - 1,00 Dcyl ax 180 = 1,0'),
(2,4, '20200111' ,'VOD: 0,5 -2,00 -1,00 x 180 = 1,0'),
(3,4, '20190201' ,'BMS o. dex: uredan nalaz prednjeg segmenta oka, spojnica nepodražena, rožnica fl. neg,, prednja sobica bez upalnih stanica, leća bistra.'),
(2,5, '20190201' ,'Fundus o. dex: PNO, vaskularij i makule urednog izgleda.')
/*▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓*/
/*▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ PROCEDURE ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓*/
/*▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓*/
	USE Oftamolog_v0_1
	GO
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ APLIKACIJA ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ logovanje ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE logovanje @korisnickoIme varchar(30), @sifra varchar(30)
	AS
	DECLARE @korisnickaSifra varchar(30) = (SELECT Sifra FROM Korisnik WHERE korisnickoIme=@korisnickoIme)
	IF (@sifra = @korisnickaSifra)
	BEGIN
		SELECT Korisnik.ID,korisnickoIme,Sifra,Ime,Prezime,Adresa,Grad.Naziv AS Grad,Tel,Email,MB,Tip_Korisnika.Naziv AS Tip_Korisnika FROM Korisnik 
		INNER JOIN Grad ON GradID=Grad.ID
		INNER JOIN Tip_Korisnika ON Tip_KorisnikaID=Tip_Korisnika.ID
		WHERE korisnickoIme=@korisnickoIme
	END
	GO

	--DROP PROCEDURE logovanje
	--EXECUTE logovanje 'Dule91','dule91bgk'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ getUsers ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE getUsers
	AS
		SELECT P.ID,K.Ime AS Ime_Lekara,K.Prezime AS Prezime_Lekara, K1.Ime AS Ime_Pacijenta,K1.Prezime AS Prezime_Pacijenta,Datum FROM Pregled AS P
		INNER JOIN Korisnik AS K ON K.ID = P.LekarID
		INNER JOIN Korisnik AS K1 ON K1.ID = P.PacijentID
	GO

	--DROP PROCEDURE getUsers
	--EXECUTE getUsers
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ getTypes ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE getTypes
	AS
		SELECT * FROM Tip_Korisnika
	GO

	--DROP PROCEDURE getTypes
	--EXECUTE getTypes
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ getCities ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE getCities
	AS
		SELECT * FROM Grad
	GO

	--DROP PROCEDURE getCities
	--EXECUTE getCities
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ getReports ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE getReports
	AS
		SELECT P.ID,(Dr.Ime + ' ' + Dr.Prezime) AS Doktor,(Pacijent.Ime + ' ' + Pacijent.Prezime) AS Pacijent,Nalaz,Datum FROM Pregled AS P
		INNER JOIN Korisnik AS Dr ON LekarID = Dr.ID 
		INNER JOIN Korisnik AS Pacijent ON PacijentID = Pacijent.ID
	GO

	--DROP PROCEDURE getReports
	--EXECUTE getReports
--▓▓▓▓▓▓▓▓▓▓ svi pregledi Lekara▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE allExamsBy @lekarId INT
	AS
		SELECT P.ID,K.Ime AS Ime_Lekara,K.Prezime AS Prezime_Lekara, K1.Ime AS Ime_Pacijenta,K1.Prezime AS Prezime_Pacijenta,Datum,Nalaz FROM Pregled AS P
		INNER JOIN Korisnik AS K ON K.ID = P.LekarID
		INNER JOIN Korisnik AS K1 ON K1.ID = P.PacijentID
		WHERE LekarID=@lekarId
	GO

	--DROP PROCEDURE allExamsBy
	--EXECUTE allExamsBy 2
--▓▓▓▓▓▓▓▓▓▓ svi pregledi Pacijenta▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
	CREATE PROCEDURE allExamsOf @patientID INT
	AS
		SELECT P.ID, K1.Ime AS Ime_Pacijenta,K1.Prezime AS Prezime_Pacijenta, K.Ime AS Ime_Lekara,K.Prezime AS Prezime_Lekara,Datum,Nalaz FROM Pregled AS P
		INNER JOIN Korisnik AS K ON K.ID = P.LekarID
		INNER JOIN Korisnik AS K1 ON K1.ID = P.PacijentID
		WHERE PacijentID=@patientID
	GO

	--DROP PROCEDURE allExamsOf
	--EXECUTE allExamsOf 4
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ NEW, UPD, DEL ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
/* ************** RELACIONI MODEL ****************
Tip_Korisnika(ID,Naziv)
Grad(ID,Naziv,PTT)
Korisnik(ID,korisnickoIme,Sifra,Ime,Prezime,Adresa,GradID,Tel,Email,MB,Tip_KorisnikaID)
Pregled(ID,LekarID,PacijentID,Datum,Nalaz)
************************************************** */
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ Tip_Korisnika ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ NEW - novi Tip_Korisnika ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE newUserType @userType nvarchar(50)
	AS
		IF NOT EXISTS (SELECT * FROM Tip_Korisnika WHERE Naziv=@userType)
		BEGIN
			INSERT INTO Tip_Korisnika VALUES (@userType)
		END
	GO

	--DROP PROCEDURE newUserType
	--EXECUTE newUserType 'domar'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ UPD - update Tip_Korisnika ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE updUserType @userTypeID INT, @userType nvarchar(50)
	AS
		IF EXISTS (SELECT * FROM Tip_Korisnika WHERE Id=@userTypeID)
		BEGIN
			UPDATE Tip_Korisnika SET Naziv = @userType WHERE ID=@userTypeID
		END
	GO

	--DROP PROCEDURE updUserType
	--EXECUTE updUserType 2,'Lekar'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ DEL - delete Tip_Korisnika ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE delUserType @userTypeID INT
	AS
		IF EXISTS (SELECT * FROM Tip_Korisnika WHERE Id=@userTypeID)
		BEGIN
			DELETE Tip_Korisnika WHERE ID=@userTypeID
		END
	GO

	--DROP PROCEDURE delUserType
	--EXECUTE delUserType 5
--*************************************************************************************************************
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ Grad ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ NEW - novi Grad ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE newCity @cityName nvarchar(50), @ptt varchar(10)
	AS
		IF NOT EXISTS (SELECT * FROM Grad WHERE Naziv=@cityName AND PTT=@ptt)
		BEGIN
			INSERT INTO Grad VALUES (@cityName,@ptt)
		END
	GO

	--DROP PROCEDURE newCity
	--EXECUTE newCity 'Zemun','11080'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ UPD - update Grad ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE updCity @cityID INT, @cityName nvarchar(50), @ptt varchar(10)
	AS
		IF EXISTS (SELECT * FROM Grad WHERE Id=@cityID)
		BEGIN
			UPDATE Grad SET Naziv = @cityName WHERE ID=@cityID
			UPDATE Grad SET PTT = @ptt WHERE ID=@cityID
		END
	GO

	--DROP PROCEDURE updCity
	--EXECUTE updCity 2,'Zemun','11080'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ DEL - delete Grad ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE delCity @cityID INT
	AS
		IF EXISTS (SELECT * FROM Grad WHERE Id=@cityID)
		BEGIN
			DELETE Grad WHERE ID=@cityID
		END
	GO

	--DROP PROCEDURE delCity
	--EXECUTE delCity 5
--*************************************************************************************************************
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ User ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ NEW - novi User ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE newUser @userName nvarchar(30), @userPass nvarchar(30), @firstName nvarchar(30),@lastName nvarchar(30),@adress nvarchar(50), @cityID INT,@tel varchar(50), @email varchar(50), @MB varchar(20),@userTypeID INT
	AS
		IF NOT EXISTS (SELECT * FROM Korisnik WHERE korisnickoIme=@userName)
		BEGIN
			INSERT INTO Korisnik VALUES (@userName, @userPass, @firstName,@lastName,@adress, @cityID,@tel, @email, @MB,@userTypeID)
		END
	GO

	--DROP PROCEDURE newUser
	--EXECUTE newUser 'admin2','admin2',N'Vladisav',N'Đurović',N'Prvomajska 33c/đ',103,'011/37-33-33','petrovicbbs@gmail.com','2530321187456',2
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ UPD - update User ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE updUser @UserID INT, @userName nvarchar(30), @userPass nvarchar(30), @firstName nvarchar(30),@lastName nvarchar(30),@adress nvarchar(50), @cityID INT,@tel varchar(50), @email varchar(50), @MB varchar(20),@userTypeID INT
	AS
		IF EXISTS (SELECT * FROM Korisnik WHERE Id=@UserID)
		BEGIN
			UPDATE Korisnik SET korisnickoIme = @userName,Sifra = @userPass,Ime = @firstName,Prezime = @lastName,Adresa = @adress,GradID = @cityID,Tel = @tel,Email = @email,MB = @MB,Tip_KorisnikaID = @userTypeID WHERE ID = @UserID 
		END
	GO
	
	--DROP PROCEDURE updUser
	--EXECUTE updUser 6,'Djura','Djurko3', N'Vladimir', N'Vladimirovski', N'Požeška 333',103,'011/222-333','bruske.ojska@yahoo.com','1111111111111',3
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ DEL - delete User ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE delUser @UserID INT
	AS
		IF EXISTS (SELECT * FROM Korisnik WHERE Id=@UserID)
		BEGIN
			DELETE Korisnik WHERE ID=@UserID
		END
	GO

	--DROP PROCEDURE delUser
	--EXECUTE delUser 6
--*************************************************************************************************************
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ Report ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ NEW - novi Report ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE newReport @docID INT, @patientID INT, @date DATE, @medicalReport nvarchar(250)
	AS
		INSERT INTO Pregled VALUES (@docID,@patientID,@date,@medicalReport)
	GO

	--DROP PROCEDURE newReport
	--EXECUTE newReport 2,4,'20190108','Sve i svasta'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ UPD - update Report ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE updReport @reportID INT, @docID INT, @patientID INT, @date DATE, @medicalReport nvarchar(250)
	AS
		IF EXISTS (SELECT * FROM Pregled WHERE Id=@reportID)
		BEGIN
			UPDATE Pregled SET LekarID = @docID, PacijentID=@patientID, Datum=@date, Nalaz=@medicalReport WHERE ID=@reportID
		END
	GO

	--DROP PROCEDURE updReport
	--EXECUTE updReport 2,3,4,'20190505','Jos 5...4...3'
--▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ DEL - delete Report ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓--
CREATE PROCEDURE delReport @reportID INT
	AS
		IF EXISTS (SELECT * FROM Pregled WHERE Id=@reportID)
		BEGIN
			DELETE Pregled WHERE ID=@reportID
		END
	GO

	--DROP PROCEDURE delReport
	--EXECUTE delReport 5
--*************************************************************************************************************