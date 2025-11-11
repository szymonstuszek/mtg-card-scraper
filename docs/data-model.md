You are a Postgres database design expert.

# I want to recap spring boot data and relations between entities
# I'm building a Magic the Gathering API that will expose some endpoints to retrieve data
- I want to practice the following:
  - OneToOne relations
  - OneToMany relations
  - ManyToMany relations

I also want to go in depth into relations, different parameters etc - at a later point

Below I will provide a draft of some SQL tables for Postgresql - analyze them,
provide suggestions or if something is not clear ask questions.
Once I clearly tell you, prepare DDL statements for the tables.
I want to use liquibase/flyaway at some point - ignore for now.

# PLAYERS
ID | NAME 

# PLAYER_PROFILE
PLAYER_ID | NICKNAME | AGE | COUNTRY | POINTS

# CARDS
ID | MTG_ID | NAME | IMAGE_URI | MANA_COST | TYPE | RULES | POWER | TOUGHNESS | SET_NAME | RARITY

# CARD_PRICES
ID | MTG_ID | DATE | PRICE_USD

# COLLECTIONS
ID | PLAYER_ID | CARD_MTG_ID | QUANTITY

# DECKS
ID | PLAYER_ID | NAME | COLORS | FORMAT

# DECK_CARDS
ID | DECK_ID | CARD_MTG_ID | QUANTITY

# GAMES
ID | TYPE | DATE | PLACE | COUNTRY | STATUS

# GAME_MATCHES
ID | ROUND | GAME_ID | PLAYER_1_ID | PLAYER_2_ID |  RESULT | TIME_TAKEN

# GAME_RESULTS
ID | GAME_ID | PLAYER | PLAYER_RANK | SCORES

Prepare DML statements to insert data into the tables.
For IMAGE_URI consider the value of image_uris.normal for each card.
For TYPE consider type_line. 
For RULES consider oracle_text. 
For PRICE_USD consider prices.usd 


