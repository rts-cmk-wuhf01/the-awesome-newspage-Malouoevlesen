# The Awesome Newspage

## Installation

Klon repository til din computer, og åben mappen i VSCode.

Kør kommandoen:  `npm install` for at installere de nødvendige modules

Hvis du ikke har `nodemon` installeret på din computer, kør også kommandoen: `npm install -g nodemon` for at installere nodemon på computeren, det modul sørger for at genstarte serveren hver gang en server-fil ændres, det er smart!

For at teste alt er installeret og sat op som det skal, køres kommandoen `npm start` og derefter burde siden være tilgængelig på http://localhost:3000


## Opgave Beskrivelse

Opgaven går ud på at få oprettet routes og templates for de sider der er med i det udleverede design.
dvs, de html sider der findes i `public` mappen.

Sørg for at have en `views` mappe som indeholder en `partials` mappe.

Hver side skal have sin egen `GET` route, som kalder en `.ejs`  template. 
Der er en del elementer på hjemmesiden som går igen på alle siderne, dem skal du trække ud i individuelle `.ejs` filer som placeres i `partials` mappen og inkluderes efter behov.

Udfordringen ligger i at splitte designet op i fornuftige og logiske dele, samt at gennemskue hvilke elementer der gentages på flere sider.

Det vil også være ok at oprette templates for elementer der kun benyttes på en side, da siderne indeholder mange linjer kode... det kan være lettere at vedligeholde hvis siderne brydes op i elementer.

Det kan anbefales at bibeholde den overordnede html struktur på den overordnede `.ejs` template, da strukturene ellers kan blive meget uoverskueligt hvis der blot står en samling includes på siden. 

## Notes for assignment

Using mySQL to make our own database. We have created a database for a news paper website.
So far we have been putting/creating data into the database. (Example articles, author, topic, comments etc).
We have then been pulling data out of the database so far.

Monday 17/6 started on new topic. Instead of taking data from the database, we can also put data into it. 

## MySQL Notes:

What is MySQL?
Database system used on web and a system that runs on a server. Ideal for both small and large applications. Uses standard SQL. 
Compiles on a number of platforms. 

## Database queries

A query is a question or a request.
We can query a database for specific information and have a recordset returned.


