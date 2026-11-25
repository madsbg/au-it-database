# Praktisk eksamensopgave (SQL/MariaDB) — **MiniBibliotek**

**Kontekst**
Du arbejder som udvikler på et lille biblioteksystem. Biblioteket vil kunne registrere medlemmer, bøger, forfattere og udlån, så personalet kan finde overblik og lave simple rapporter.

Du skal designe en lille database og vise, at den kan besvare bibliotekets spørgsmål.

---

## Aflevering (det du skal levere)

1. **ER-model (KRAV)**
   - En ER-diagramfil (PDF/PNG/JPG) der viser dine entiteter, attributter, nøgler og relationer
   - Relationer skal have **kardinalitet og optionalitet** (fx 0..*, 1..1 osv.)
2. **SQL-script** (én fil) som kan køres fra tom MariaDB
   - Opretter database + tabeller + constraints
   - Indsætter testdata
   - Indeholder dine forespørgsler (queries) med kommentarer
3. **Kort README** (kan være nederst i denne fil eller en separat fil)
   - Hvordan man kører dit SQL-script i DBeaver (hvilken database, hvilken rækkefølge)

> **Formatkrav**: Alle SQL-svar skal være i samme `.sql` fil, og hver opgave skal have en kort kommentarlinje lige over SQL’en, der beskriver hvad den gør.

---

## Rammer og regler

- DBMS: **MariaDB**
- Værktøj: **DBeaver**
- Du må gerne bruge noter, men løsningen skal være din egen.
- Antag at biblioteket vil kunne udvide databasen senere — navngivning og struktur skal være konsistent.

---

## Case-krav (funktionelle krav)

Biblioteket skal kunne:

- Oprette **medlemmer** (navn, kontaktinfo, oprettelsesdato, aktiv/inaktiv)
- Registrere **bøger** (titel, udgivelsesår, evt. ISBN/identifikator)
- Registrere **forfattere**
- Kunne håndtere at **en bog kan have flere forfattere**, og at **en forfatter kan have flere bøger**
- Registrere **udlån** af bøger til medlemmer med:
  - udlånsdato
  - forfaldsdato
  - retur-dato (kan være tom hvis bogen ikke er afleveret)

---

## Del A — ER-model (KRAV)

Lav en ER-model der opfylder case-kravene.

**Minimum forventes** (du må gerne udvide):
- Medlem
- Bog
- Forfatter
- En løsning på “flere forfattere pr. bog”
- Udlån (som binder medlem og bog sammen)

**I din ER-model skal du:**
- Markere **primærnøgler** tydeligt
- Vise **kardinalitet/optionality** på relationer
- Vise hvordan “flere forfattere pr. bog” er modelleret

---

## Del B — Implementér databasen (SQL)

Skriv SQL der:

1. Opretter en database (fx `minibibliotek`)
2. Opretter tabeller og relevante constraints (fx nøgler og relationer)
3. Indsætter testdata, så dine forespørgsler giver meningsfulde resultater

**Testdata minimum (vejledende)**
- Mindst 10 medlemmer
- Mindst 15 bøger
- Mindst 6 forfattere
- Mindst 25 udlån (blandede: afleveret / ikke afleveret / forfald overskredet)

> Tip: Brug realistiske datoer (nogle lån skal være for gamle, så “for sen” kan demonstreres).

---

## Del C — Bibliotekets spørgsmål (SQL-forespørgsler)

Besvar nedenstående spørgsmål med SQL.
(Spørgsmålene er formuleret som forretningens behov — du vælger selv den konkrete SQL-løsning.)

### 1) Aktive udlån med tydelig visning
Lav en liste over udlån der **ikke er afleveret endnu**, med:
- medlem (fx fuldt navn)
- bogtitel
- udlånsdato og forfaldsdato
- en ekstra kolonne der tydeligt viser om udlånet er **for sent** pr. i dag (ja/nej eller 0/1)

### 2) Overblik over medlemmer med for mange forsinkelser
Find medlemmer der har **mindst 2** udlån som er **for sent** (og endnu ikke afleveret).
Returnér medlem og antal for sene udlån.

### 3) “Hvem bruger aldrig biblioteket?”
Find medlemmer der **aldrig har lånt en bog**.
Returnér medlem og oprettelsesdato (så personalet kan kontakte dem).

### 4) Mest populære bøger
Vis en top-liste over de **5 mest udlånte bøger** (i hele datasættet), med:
- bogtitel
- antal udlån

### 5) Forfatter-overblik
Lav en liste over forfattere med:
- forfatter-navn
- antal **forskellige** bøger de har i kataloget
Vis kun forfattere med mere end 1 bog.

### 6) “Statusliste” for bøger (til personalet)
Lav en liste over alle bøger i kataloget, med en kolonne der viser en tydelig status:
- “Udlånt” hvis bogen lige nu er på aktivt udlån
- ellers “Ledig”

> Bemærk: Hvis du har modelleret flere eksemplarer pr. bog, så tilpas statuslogikken. Hvis ikke, antag at der findes ét eksemplar pr. bog.

### 7) Historik for ét medlem
Lav en forespørgsel der kan bruges til at slå **ét medlem op** (fx via email eller medlemsnummer) og vise:
- alle deres udlån (og om de er afleveret/ikke afleveret)
- en samlet total (fx antal udlån eller antal aktive udlån)

### 8) Datakvalitet: oprydning i tekstfelter
Biblioteket opdager at nogle emails/navne har blandet store/små bogstaver og ekstra mellemrum.
Lav én eller flere SQL-kommandoer der retter dette i dine testdata (fx trim og ensret casing), så output bliver mere ensartet.

### 9) Ekstra (valgfri, men giver bonus ved vurdering)
Skriv en kort sektion i din `.sql` fil (kommenteret), hvor du:
- viser hvordan man sikkert kan rette en fejlindtastning i et udlån (fx forkert retur-dato) på en måde hvor man kan fortryde ændringen, hvis man opdager fejl.

---

## Del D — Kort refleksion (maks 10 linjer)
Skriv kort (i README eller som SQL-kommentarer):

- Hvilke nøgler valgte du, og hvorfor?
- Hvordan kan dit design udvides uden at skabe modstridende data (fx samme forfatter stavet forskelligt, samme bog duplikeret, osv.)?

---

## Vurderingskriterier (hvad der tæller)

- **ER-model**: korrekt relationer + kardinalitet/optionality, og en tydelig løsning på “flere forfattere pr. bog”
- **Database-design**: struktur og constraints giver mening, og kan genbruges/udvides
- **SQL-svar**: svarer på spørgsmålet, giver korrekt output, og er læsbart (aliaser/navne)
- **Testdata**: nok og varieret til at demonstrere alle spørgsmål
- **Klarhed**: kommentarer og navngivning gør det let at forstå

---

## Praktisk hint til DBeaver (valgfrit at inkludere i README)
- Kør dit script i én session mod din database
- Hvis du bruger `DROP DATABASE IF EXISTS ...` så kan læreren genkøre hurtigt
- Sørg for at `USE minibibliotek;` er med før dine queries
