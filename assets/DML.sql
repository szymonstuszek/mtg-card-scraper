-- TODO review to have meaningful data

-- ============================================
-- Magic the Gathering API - Database Data
-- PostgreSQL DML Statements (INSERT)
-- ============================================

-- cleanup before insert
TRUNCATE TABLE game_results, game_matches, games,
               deck_cards, decks, collections,
               card_prices, cards,
               player_profile, players
RESTART IDENTITY CASCADE;

-- ============================================
-- PLAYERS DATA
-- ============================================

INSERT INTO PLAYERS (NAME)
VALUES ('Alice Johnson'),
       ('Bob Smith'),
       ('Charlie Davis'),
       ('Diana Martinez'),
       ('Ethan Brown');

-- ============================================
-- PLAYER_PROFILE DATA (OneToOne with PLAYERS)
-- ============================================

INSERT INTO PLAYER_PROFILE (PLAYER_ID, NICKNAME, AGE, COUNTRY, POINTS)
VALUES (1, 'AliceTheArcane', 28, 'USA', 1250),
       (2, 'BobTheBold', 32, 'Canada', 890),
       (3, 'CharlieCaster', 24, 'UK', 2100),
       (4, 'DianaDragon', 29, 'Spain', 1580),
       (5, 'EthanEnchanter', 35, 'Germany', 950);

-- ============================================
-- CARDS DATA (from example-cards.json)
-- ALL 175 cards from the set
-- ============================================

INSERT INTO CARDS (MTG_ID, NAME, IMAGE_URI, MANA_COST, TYPE, RULES, POWER, TOUGHNESS, SET_NAME, RARITY)
VALUES ('66555946-e747-46fa-b1ac-b103a8edcd93', 'Abzan Devotee',
        'https://cards.scryfall.io/normal/front/6/6/66555946-e747-46fa-b1ac-b103a8edcd93.jpg?1743204231', '{1}{B}',
        'Creature — Dog Cleric', '{1}: Add {W}, {B}, or {G}. Activate only once each turn.
{2}{B}: Return this card from your graveyard to your hand.', 2, 1, 'Tarkir: Dragonstorm', 'common'),
       ('d2da9024-3b58-4a57-8f7d-4094c193daee', 'Abzan Monument',
        'https://cards.scryfall.io/normal/front/d/2/d2da9024-3b58-4a57-8f7d-4094c193daee.jpg?1743204940', '{2}',
        'Artifact', 'When this artifact enters, search your library for a basic Plains, Swamp, or Forest card, reveal it, put it into your hand, then shuffle.
{1}{W}{B}{G}, {T}, Sacrifice this artifact: Create an X/X white Spirit creature token, where X is the greatest toughness among creatures you control. Activate only as a sorcery.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('058da414-1f05-45a0-8938-2fbc1050e17e', 'A-Cori-Steel Cutter',
        'https://cards.scryfall.io/normal/front/0/5/058da414-1f05-45a0-8938-2fbc1050e17e.jpg?1760672780', '{1}{R}',
        'Artifact — Equipment', 'Equipped creature has haste.
Flurry — Whenever you cast your second spell each turn, create a 1/1 white Monk creature token with prowess. You may attach this Equipment to it.
Equip {1}{R}', NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('bb13a34b-6ac8-47cb-9e91-47106a585fc1', 'Adorned Crocodile',
        'https://cards.scryfall.io/normal/front/b/b/bb13a34b-6ac8-47cb-9e91-47106a585fc1.jpg?1743697510', '{4}{B}',
        'Creature — Crocodile', 'When this creature dies, create a 2/2 black Zombie Druid creature token.
Renew — {B}, Exile this card from your graveyard: Put a +1/+1 counter on target creature. Activate only as a sorcery.',
        5, 3, 'Tarkir: Dragonstorm', 'common'),
       ('19c1417a-9719-46f6-8749-d92b93ce0529', 'Aegis Sculptor',
        'https://cards.scryfall.io/normal/front/1/9/19c1417a-9719-46f6-8749-d92b93ce0529.jpg?1743204100', '{3}{U}',
        'Creature — Bird Wizard', 'Flying
Ward {2} (Whenever this creature becomes the target of a spell or ability an opponent controls, counter it unless that player pays {2}.)
At the beginning of your upkeep, you may exile two cards from your graveyard. If you do, put a +1/+1 counter on this creature.',
        2, 3, 'Tarkir: Dragonstorm', 'uncommon'),
       ('812d0462-0158-467f-951d-a7a121188a10', 'Agent of Kotis',
        'https://cards.scryfall.io/normal/front/8/1/812d0462-0158-467f-951d-a7a121188a10.jpg?1743204105', '{1}{U}',
        'Creature — Human Rogue',
        'Renew — {3}{U}, Exile this card from your graveyard: Put two +1/+1 counters on target creature. Activate only as a sorcery.',
        2, 1, 'Tarkir: Dragonstorm', 'common'),
       ('993ade84-031f-4a3e-bd68-55f61b559248', 'Aggressive Negotiations',
        'https://cards.scryfall.io/normal/front/9/9/993ade84-031f-4a3e-bd68-55f61b559248.jpg?1743204240', '{2}{B}',
        'Sorcery',
        'Target opponent reveals their hand. You choose a nonland card from it and exile that card. Put a +1/+1 counter on up to one target creature you control.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('57695a9b-8f72-4ccc-a946-5d5037b09b8f', 'Ainok Wayfarer',
        'https://cards.scryfall.io/normal/front/5/7/57695a9b-8f72-4ccc-a946-5d5037b09b8f.jpg?1743204503', '{1}{G}',
        'Creature — Dog Scout',
        'When this creature enters, mill three cards. You may put a land card from among them into your hand. If you don''t, put a +1/+1 counter on this creature. (To mill three cards, put the top three cards of your library into your graveyard.)',
        1, 1, 'Tarkir: Dragonstorm', 'common'),
       ('4d305609-64f8-4f3f-bf67-cd5257f0d01e', 'Alchemist''s Assistant',
        'https://cards.scryfall.io/normal/front/4/d/4d305609-64f8-4f3f-bf67-cd5257f0d01e.jpg?1743204244', '{1}{B}',
        'Creature — Monkey', 'Lifelink
Renew — {1}{B}, Exile this card from your graveyard: Put a lifelink counter on target creature. Activate only as a sorcery.',
        2, 1, 'Tarkir: Dragonstorm', 'uncommon'),
       ('a9262bf6-df6a-446c-ba70-18270a09842d', 'Alesha''s Legacy',
        'https://cards.scryfall.io/normal/front/a/9/a9262bf6-df6a-446c-ba70-18270a09842d.jpg?1743204249', '{1}{B}',
        'Instant',
        'Target creature you control gains deathtouch and indestructible until end of turn. (Damage and effects that say "destroy" don''t destroy it.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('b74876d8-f6a6-4b47-b960-b01a331bab01', 'All-Out Assault',
        'https://cards.scryfall.io/normal/front/b/7/b74876d8-f6a6-4b47-b960-b01a331bab01.jpg?1743204636',
        '{2}{R}{W}{B}', 'Enchantment', 'Creatures you control get +1/+1 and have deathtouch.
When this enchantment enters, if it''s your main phase, there is an additional combat phase after this phase followed by an additional main phase. When you next attack this turn, untap each creature you control.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'mythic'),
       ('c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 'Ambling Stormshell',
        'https://cards.scryfall.io/normal/front/c/7/c74d4a57-0f66-4965-9ed7-f88a08aa1d15.jpg?1743204109', '{3}{U}{U}',
        'Creature — Turtle', 'Ward {2}
Whenever this creature attacks, put three stun counters on it and draw three cards. (If a permanent with a stun counter would become untapped, remove one from it instead.)
Whenever you cast a Turtle spell, untap this creature.', 5, 9, 'Tarkir: Dragonstorm', 'rare'),
       ('29957f49-9a6b-42f6-b2fb-b48f653ab725', 'Anafenza, Unyielding Lineage',
        'https://cards.scryfall.io/normal/front/2/9/29957f49-9a6b-42f6-b2fb-b48f653ab725.jpg?1743203958', '{2}{W}',
        'Legendary Creature — Spirit Soldier', 'Flash
First strike
Whenever another nontoken creature you control dies, Anafenza endures 2. (Put two +1/+1 counters on it or create a 2/2 white Spirit creature token.)',
        2, 2, 'Tarkir: Dragonstorm', 'rare'),
       ('dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 'Arashin Sunshield',
        'https://cards.scryfall.io/normal/front/d/d/dd7102d8-90b3-45a1-b66d-dcca469b1fb6.jpg?1743697519', '{3}{W}',
        'Creature — Human Warrior', 'When this creature enters, exile up to two target cards from a single graveyard.
{W}, {T}: Tap target creature.', 3, 4, 'Tarkir: Dragonstorm', 'common'),
       ('17f61c01-0a41-4fa1-ac34-ffa83baad989', 'Armament Dragon',
        'https://cards.scryfall.io/normal/front/1/7/17f61c01-0a41-4fa1-ac34-ffa83baad989.jpg?1743204643',
        '{3}{W}{B}{G}', 'Creature — Dragon', 'Flying
When this creature enters, distribute three +1/+1 counters among one, two, or three target creatures you control.', 3,
        4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('d1a4f502-86a9-49fb-9cb9-7918d13c5313', 'Attuned Hunter',
        'https://cards.scryfall.io/normal/front/d/1/d1a4f502-86a9-49fb-9cb9-7918d13c5313.jpg?1743204506', '{2}{G}',
        'Creature — Human Ranger', 'Trample
Whenever one or more cards leave your graveyard during your turn, put a +1/+1 counter on this creature.', 3, 3,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('672f94ad-65d6-4c7d-925d-165ef264626f', 'Auroral Procession',
        'https://cards.scryfall.io/normal/front/6/7/672f94ad-65d6-4c7d-925d-165ef264626f.jpg?1743204647', '{G}{U}',
        'Instant', 'Return target card from your graveyard to your hand.', NULL, NULL, 'Tarkir: Dragonstorm',
        'uncommon'),
       ('d5397366-151f-46b0-b9b2-fa4d5bd892d8', 'Avenger of the Fallen',
        'https://cards.scryfall.io/normal/front/d/5/d5397366-151f-46b0-b9b2-fa4d5bd892d8.jpg?1743204251', '{2}{B}',
        'Creature — Human Warrior', 'Deathtouch
Mobilize X, where X is the number of creature cards in your graveyard. (Whenever this creature attacks, create X tapped and attacking 1/1 red Warrior creature tokens. Sacrifice them at the beginning of the next end step.)',
        2, 4, 'Tarkir: Dragonstorm', 'rare'),
       ('14078a49-2230-4ad7-aea0-0c253813c646', 'Awaken the Honored Dead',
        'https://cards.scryfall.io/normal/front/1/4/14078a49-2230-4ad7-aea0-0c253813c646.jpg?1743204653', '{B}{G}{U}',
        'Enchantment — Saga', '(As this Saga enters and after your draw step, add a lore counter. Sacrifice after III.)
I — Destroy target nonland permanent.
II — Mill three cards.
III — You may discard a card. When you do, return target creature or land card from your graveyard to your hand.', NULL,
        NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('2556a35b-2229-42c7-8cb3-c8c668403dd2', 'Barrensteppe Siege',
        'https://cards.scryfall.io/normal/front/2/5/2556a35b-2229-42c7-8cb3-c8c668403dd2.jpg?1743204657', '{2}{W}{B}',
        'Enchantment', 'As this enchantment enters, choose Abzan or Mardu.
• Abzan — At the beginning of your end step, put a +1/+1 counter on each creature you control.
• Mardu — At the beginning of your end step, if a creature died under your control this turn, each opponent sacrifices a creature of their choice.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('d6d91e42-43db-428d-a4dd-ef9d40306314', 'Bearer of Glory',
        'https://cards.scryfall.io/normal/front/d/6/d6d91e42-43db-428d-a4dd-ef9d40306314.jpg?1743203967', '{1}{W}',
        'Creature — Human Soldier', 'During your turn, this creature has first strike.
{4}{W}: Creatures you control get +1/+1 until end of turn.', 2, 1, 'Tarkir: Dragonstorm', 'common'),
       ('b475b071-5545-483e-a397-89451f258602', 'Betor, Kin to All',
        'https://cards.scryfall.io/normal/front/b/4/b475b071-5545-483e-a397-89451f258602.jpg?1743204665',
        '{2}{W}{B}{G}', 'Legendary Creature — Spirit Dragon', 'Flying
At the beginning of your end step, if creatures you control have total toughness 10 or greater, draw a card. Then if creatures you control have total toughness 20 or greater, untap each creature you control. Then if creatures you control have total toughness 40 or greater, each opponent loses half their life, rounded up.',
        5, 7, 'Tarkir: Dragonstorm', 'mythic'),
       ('91b25843-1aa0-484a-b6c7-0c284fe7214a', 'Bewildering Blizzard',
        'https://cards.scryfall.io/normal/front/9/1/91b25843-1aa0-484a-b6c7-0c284fe7214a.jpg?1743204112', '{4}{U}{U}',
        'Instant', 'Draw three cards. Creatures your opponents control get -3/-0 until end of turn.', NULL, NULL,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 'Bloodfell Caves',
        'https://cards.scryfall.io/normal/front/1/d/1dde3c68-6f29-4c00-b668-c25ac9e3e13b.jpg?1743204990', '', 'Land', 'This land enters tapped.
When this land enters, you gain 1 life.
{T}: Add {B} or {R}.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('10e0a9a3-f63a-4f92-a083-9d181580e498', 'Bloomvine Regent // Claim Territory',
        'https://cards.scryfall.io/normal/front/1/0/10e0a9a3-f63a-4f92-a083-9d181580e498.jpg?1754359377',
        '{3}{G}{G} // {2}{G}', 'Creature — Dragon // Sorcery — Omen', '', 4, 5, 'Tarkir: Dragonstorm', 'rare'),
       ('0a9df994-e0f4-4919-af99-4f643eb9199c', 'Blossoming Sands',
        'https://cards.scryfall.io/normal/front/0/a/0a9df994-e0f4-4919-af99-4f643eb9199c.jpg?1743204991', '', 'Land', 'This land enters tapped.
When this land enters, you gain 1 life.
{T}: Add {G} or {W}.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('78bf36bc-6702-4c5d-b52d-ab7217cc8787', 'Bone-Cairn Butcher',
        'https://cards.scryfall.io/normal/front/7/8/78bf36bc-6702-4c5d-b52d-ab7217cc8787.jpg?1743204667',
        '{1}{R}{W}{B}', 'Creature — Demon', 'Mobilize 2 (Whenever this creature attacks, create two tapped and attacking 1/1 red Warrior creature tokens. Sacrifice them at the beginning of the next end step.)
Attacking tokens you control have deathtouch.', 4, 4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('50c6e815-bfe7-4599-9227-d36504a3640f', 'Boulderborn Dragon',
        'https://cards.scryfall.io/normal/front/5/0/50c6e815-bfe7-4599-9227-d36504a3640f.jpg?1743204948', '{5}',
        'Artifact Creature — Dragon', 'Flying, vigilance
Whenever this creature attacks, surveil 1. (Look at the top card of your library. You may put it into your graveyard.)',
        3, 3, 'Tarkir: Dragonstorm', 'common'),
       ('e2c2a069-7553-4879-abfb-b2aa3349e4b8', 'Breaching Dragonstorm',
        'https://cards.scryfall.io/normal/front/e/2/e2c2a069-7553-4879-abfb-b2aa3349e4b8.jpg?1743204368', '{4}{R}',
        'Enchantment', 'When this enchantment enters, exile cards from the top of your library until you exile a nonland card. You may cast it without paying its mana cost if that spell''s mana value is 8 or less. If you don''t, put that card into your hand.
When a Dragon you control enters, return this enchantment to its owner''s hand.', NULL, NULL, 'Tarkir: Dragonstorm',
        'uncommon'),
       ('b1ad91db-5f16-4392-baf1-f8400ec11e0a', 'Call the Spirit Dragons',
        'https://cards.scryfall.io/normal/front/b/1/b1ad91db-5f16-4392-baf1-f8400ec11e0a.jpg?1743204672',
        '{W}{U}{B}{R}{G}', 'Enchantment', 'Dragons you control have indestructible.
At the beginning of your upkeep, for each color, put a +1/+1 counter on a Dragon you control of that color. If you put +1/+1 counters on five Dragons this way, you win the game.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'mythic'),
       ('488152ce-2048-4ccb-b2d6-b9628958286f', 'Caustic Exhale',
        'https://cards.scryfall.io/normal/front/4/8/488152ce-2048-4ccb-b2d6-b9628958286f.jpg?1743204258', '{B}',
        'Instant', 'As an additional cost to cast this spell, behold a Dragon or pay {1}. (To behold a Dragon, choose a Dragon you control or reveal a Dragon card from your hand.)
Target creature gets -3/-3 until end of turn.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('c51dcdab-38ee-4804-8859-09adc353c182', 'Champion of Dusan',
        'https://cards.scryfall.io/normal/front/c/5/c51dcdab-38ee-4804-8859-09adc353c182.jpg?1743204513', '{2}{G}',
        'Creature — Human Warrior', 'Trample
Renew — {1}{G}, Exile this card from your graveyard: Put a +1/+1 counter and a trample counter on target creature. Activate only as a sorcery.',
        4, 2, 'Tarkir: Dragonstorm', 'common'),
       ('24204881-690c-4043-8771-20cb93385072', 'Channeled Dragonfire',
        'https://cards.scryfall.io/normal/front/2/4/24204881-690c-4043-8771-20cb93385072.jpg?1743258630', '{R}',
        'Sorcery', 'Channeled Dragonfire deals 2 damage to any target.
Harmonize {5}{R}{R} (You may cast this card from your graveyard for its harmonize cost. You may tap a creature you control to reduce that cost by {X}, where X is its power. Then exile this spell.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('f892d156-371c-4391-8ae6-25513c5032b0', 'Clarion Conqueror',
        'https://cards.scryfall.io/normal/front/f/8/f892d156-371c-4391-8ae6-25513c5032b0.jpg?1761770058', '{2}{W}',
        'Creature — Dragon', 'Flying
Activated abilities of artifacts, creatures, and planeswalkers can''t be activated.', 3, 3, 'Tarkir: Dragonstorm',
        'rare'),
       ('b2f160d7-c832-4b83-8f2e-aaeb190add3f', 'Constrictor Sage',
        'https://cards.scryfall.io/normal/front/b/2/b2f160d7-c832-4b83-8f2e-aaeb190add3f.jpg?1743233749', '{4}{U}',
        'Creature — Snake Wizard', 'When this creature enters, tap target creature an opponent controls and put a stun counter on it. (If a permanent with a stun counter would become untapped, remove one from it instead.)
Renew — {2}{U}, Exile this card from your graveyard: Tap target creature an opponent controls and put a stun counter on it. Activate only as a sorcery.',
        4, 4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('c6569487-53c5-4b91-877d-e4e31bfa90c0', 'Coordinated Maneuver',
        'https://cards.scryfall.io/normal/front/c/6/c6569487-53c5-4b91-877d-e4e31bfa90c0.jpg?1743203976', '{1}{W}',
        'Instant', 'Choose one —
• Coordinated Maneuver deals damage equal to the number of creatures you control to target creature or planeswalker.
• Destroy target enchantment.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('9312821a-2059-4f44-9b20-c9522b827e38', 'Cori Mountain Monastery',
        'https://cards.scryfall.io/normal/front/9/3/9312821a-2059-4f44-9b20-c9522b827e38.jpg?1743204997', '', 'Land', 'This land enters tapped unless you control a Plains or an Island.
{T}: Add {R}.
{3}{R}, {T}: Exile the top card of your library. Until the end of your next turn, you may play that card.', NULL, NULL,
        'Tarkir: Dragonstorm', 'rare'),
       ('b6cbf54e-f30e-4e7b-b17c-217fa424971c', 'Cori Mountain Stalwart',
        'https://cards.scryfall.io/normal/front/b/6/b6cbf54e-f30e-4e7b-b17c-217fa424971c.jpg?1743204677', '{1}{R}{W}',
        'Creature — Human Monk',
        'Flurry — Whenever you cast your second spell each turn, this creature deals 2 damage to each opponent and you gain 2 life.',
        3, 3, 'Tarkir: Dragonstorm', 'uncommon'),
       ('490eb213-9ae2-4b45-abec-6f1dfc83792a', 'Cori-Steel Cutter',
        'https://cards.scryfall.io/normal/front/4/9/490eb213-9ae2-4b45-abec-6f1dfc83792a.jpg?1752091352', '{1}{R}',
        'Artifact — Equipment', 'Equipped creature gets +1/+1 and has trample and haste.
Flurry — Whenever you cast your second spell each turn, create a 1/1 white Monk creature token with prowess. You may attach this Equipment to it. (Whenever you cast a noncreature spell, the token gets +1/+1 until end of turn.)
Equip {1}{R}', NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('e2a2d395-26d6-4eb2-9e8c-ed7dbbd3a8f5', 'Corroding Dragonstorm',
        'https://cards.scryfall.io/normal/front/e/2/e2a2d395-26d6-4eb2-9e8c-ed7dbbd3a8f5.jpg?1743204259', '{1}{B}',
        'Enchantment', 'When this enchantment enters, each opponent loses 2 life and you gain 2 life. Surveil 2. (Look at the top two cards of your library, then put any number of them into your graveyard and the rest on top of your library in any order.)
When a Dragon you control enters, return this enchantment to its owner''s hand.', NULL, NULL, 'Tarkir: Dragonstorm',
        'uncommon'),
       ('276f5cee-a501-4658-bd4d-7a044bf1ccbc', 'Craterhoof Behemoth',
        'https://cards.scryfall.io/normal/front/2/7/276f5cee-a501-4658-bd4d-7a044bf1ccbc.jpg?1743204520',
        '{5}{G}{G}{G}', 'Creature — Beast', 'Haste
When this creature enters, creatures you control gain trample and get +X/+X until end of turn, where X is the number of creatures you control.',
        5, 5, 'Tarkir: Dragonstorm', 'mythic'),
       ('6852b4d5-74e0-44ba-ba44-20aa91e3c4c8', 'Cruel Truths',
        'https://cards.scryfall.io/normal/front/6/8/6852b4d5-74e0-44ba-ba44-20aa91e3c4c8.jpg?1743204266', '{3}{B}',
        'Instant',
        'Surveil 2, then draw two cards. You lose 2 life. (To surveil 2, look at the top two cards of your library, then put any number of them into your graveyard and the rest on top of your library in any order.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('98ad5f0c-8775-4e89-8e92-84a6ade93e35', 'Dalkovan Encampment',
        'https://cards.scryfall.io/normal/front/9/8/98ad5f0c-8775-4e89-8e92-84a6ade93e35.jpg?1743205000', '', 'Land', 'This land enters tapped unless you control a Swamp or a Mountain.
{T}: Add {W}.
{2}{W}, {T}: Whenever you attack this turn, create two 1/1 red Warrior creature tokens that are tapped and attacking. Sacrifice them at the beginning of the next end step.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('4df7b253-6107-47d6-b650-cb4d3e0aec6b', 'Dalkovan Packbeasts',
        'https://cards.scryfall.io/normal/front/4/d/4df7b253-6107-47d6-b650-cb4d3e0aec6b.jpg?1743203980', '{2}{W}',
        'Creature — Ox', 'Vigilance
Mobilize 3 (Whenever this creature attacks, create three tapped and attacking 1/1 red Warrior creature tokens. Sacrifice them at the beginning of the next end step.)',
        NULL, 4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('1faab43d-587d-44f6-9516-c8e3965bbc20', 'Death Begets Life',
        'https://cards.scryfall.io/normal/front/1/f/1faab43d-587d-44f6-9516-c8e3965bbc20.jpg?1743204680',
        '{5}{B}{G}{U}', 'Sorcery',
        'Destroy all creatures and enchantments. Draw a card for each permanent destroyed this way.', NULL, NULL,
        'Tarkir: Dragonstorm', 'mythic'),
       ('bf3a18cf-03db-4eb0-8d53-0c1a71e184da', 'Defibrillating Current',
        'https://cards.scryfall.io/normal/front/b/f/bf3a18cf-03db-4eb0-8d53-0c1a71e184da.jpg?1743204687',
        '{2/R}{2/W}{2/B}', 'Sorcery',
        'Defibrillating Current deals 4 damage to target creature or planeswalker and you gain 2 life.', NULL, NULL,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('119bb72d-aed9-47dc-9285-7bc836cc3776', 'Delta Bloodflies',
        'https://cards.scryfall.io/normal/front/1/1/119bb72d-aed9-47dc-9285-7bc836cc3776.jpg?1743204268', '{1}{B}',
        'Creature — Insect', 'Flying
Whenever this creature attacks, if you control a creature with a counter on it, each opponent loses 1 life.', 1, 2,
        'Tarkir: Dragonstorm', 'common'),
       ('f632be90-9e7f-41f8-a52e-a2952354d730', 'Descendant of Storms',
        'https://cards.scryfall.io/normal/front/f/6/f632be90-9e7f-41f8-a52e-a2952354d730.jpg?1743203984', '{W}',
        'Creature — Human Soldier',
        'Whenever this creature attacks, you may pay {1}{W}. If you do, it endures 1. (Put a +1/+1 counter on it or create a 1/1 white Spirit creature token.)',
        2, 1, 'Tarkir: Dragonstorm', 'uncommon'),
       ('ccbc6fd0-42bc-4e8b-96bc-69a631ba7106', 'Desperate Measures',
        'https://cards.scryfall.io/normal/front/c/c/ccbc6fd0-42bc-4e8b-96bc-69a631ba7106.jpg?1743204274', '{B}',
        'Instant',
        'Target creature gets +1/-1 until end of turn. When it dies under your control this turn, draw two cards.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('bbf9c673-37b4-48ed-a9ea-13f8e3e6c47b', 'Devoted Duelist',
        'https://cards.scryfall.io/normal/front/b/b/bbf9c673-37b4-48ed-a9ea-13f8e3e6c47b.jpg?1743204378', '{1}{R}',
        'Creature — Goblin Monk', 'Haste
Flurry — Whenever you cast your second spell each turn, this creature deals 1 damage to each opponent.', 2, 1,
        'Tarkir: Dragonstorm', 'common'),
       ('b1d21a9a-6b0c-4fbc-a427-81be885d326b', 'Dirgur Island Dragon // Skimming Strike',
        'https://cards.scryfall.io/normal/front/b/1/b1d21a9a-6b0c-4fbc-a427-81be885d326b.jpg?1743204119',
        '{5}{U} // {1}{U}', 'Creature — Dragon // Instant — Omen', '', 4, 4, 'Tarkir: Dragonstorm', 'common'),
       ('082b52c9-c46e-44d3-b723-546ba528e07b', 'Dismal Backwater',
        'https://cards.scryfall.io/normal/front/0/8/082b52c9-c46e-44d3-b723-546ba528e07b.jpg?1743697562', '', 'Land', 'This land enters tapped.
When this land enters, you gain 1 life.
{T}: Add {U} or {B}.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('1c9af3f1-711e-42ae-803a-1100eba3fb13', 'Dispelling Exhale',
        'https://cards.scryfall.io/normal/front/1/c/1c9af3f1-711e-42ae-803a-1100eba3fb13.jpg?1743204126', '{1}{U}',
        'Instant', 'As an additional cost to cast this spell, you may behold a Dragon. (You may choose a Dragon you control or reveal a Dragon card from your hand.)
Counter target spell unless its controller pays {2}. If a Dragon was beheld, counter that spell unless its controller pays {4} instead.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('bd78e8ae-e927-40e7-9580-966c5e81f53c', 'Disruptive Stormbrood // Petty Revenge',
        'https://cards.scryfall.io/normal/front/b/d/bd78e8ae-e927-40e7-9580-966c5e81f53c.jpg?1743204689',
        '{4}{G} // {1}{B}', 'Creature — Dragon // Sorcery — Omen', '', 3, 3, 'Tarkir: Dragonstorm', 'uncommon'),
       ('0d5674f9-22b2-45f9-902d-4fd245485c60', 'Dracogenesis',
        'https://cards.scryfall.io/normal/front/0/d/0d5674f9-22b2-45f9-902d-4fd245485c60.jpg?1743204385', '{6}{R}{R}',
        'Enchantment', 'You may cast Dragon spells without paying their mana costs.', NULL, NULL, 'Tarkir: Dragonstorm',
        'mythic'),
       ('d54cc838-d79d-433a-99fb-d6e4d1c1431d', 'Dragonback Assault',
        'https://cards.scryfall.io/normal/front/d/5/d54cc838-d79d-433a-99fb-d6e4d1c1431d.jpg?1743204697',
        '{3}{G}{U}{R}', 'Enchantment', 'When this enchantment enters, it deals 3 damage to each creature and each planeswalker.
Landfall — Whenever a land you control enters, create a 4/4 red Dragon creature token with flying.', NULL, NULL,
        'Tarkir: Dragonstorm', 'mythic'),
       ('0200a8c5-3293-48d0-a523-ba148680f588', 'Dragonback Lancer',
        'https://cards.scryfall.io/normal/front/0/2/0200a8c5-3293-48d0-a523-ba148680f588.jpg?1743203987', '{3}{W}',
        'Creature — Human Soldier', 'Flying
Mobilize 1 (Whenever this creature attacks, create a tapped and attacking 1/1 red Warrior creature token. Sacrifice it at the beginning of the next end step.)',
        3, 3, 'Tarkir: Dragonstorm', 'common'),
       ('3d634087-77ba-4543-aa7a-8a3774d69cd7', 'Dragonbroods'' Relic',
        'https://cards.scryfall.io/normal/front/3/d/3d634087-77ba-4543-aa7a-8a3774d69cd7.jpg?1743204527', '{1}{G}',
        'Artifact', '{T}, Tap an untapped creature you control: Add one mana of any color.
{3}{W}{U}{B}{R}{G}, Sacrifice this artifact: Create a 4/4 Dragon creature token named Reliquary Dragon that''s all colors. It has flying, lifelink, and "When this token enters, it deals 3 damage to any target." Activate only as a sorcery.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('bc7692ef-7091-4365-85a8-1edbd374f279', 'Dragonclaw Strike',
        'https://cards.scryfall.io/normal/front/b/c/bc7692ef-7091-4365-85a8-1edbd374f279.jpg?1744577243',
        '{2/G}{2/U}{2/R}', 'Sorcery',
        'Double the power and toughness of target creature you control until end of turn. Then it fights up to one target creature an opponent controls. (Each deals damage equal to its power to the other.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('031afea3-fbfb-4663-a8cc-9b7eb7b16020', 'Dragonfire Blade',
        'https://cards.scryfall.io/normal/front/0/3/031afea3-fbfb-4663-a8cc-9b7eb7b16020.jpg?1743204949', '{1}',
        'Artifact — Equipment', 'Equipped creature gets +2/+2 and has hexproof from monocolored.
Equip {4}. This ability costs {1} less to activate for each color of the creature it targets.', NULL, NULL,
        'Tarkir: Dragonstorm', 'rare'),
       ('8810ebb4-9e51-46f0-a54a-a0b4d77b762a', 'Dragonologist',
        'https://cards.scryfall.io/normal/front/8/8/8810ebb4-9e51-46f0-a54a-a0b4d77b762a.jpg?1743204126', '{2}{U}',
        'Creature — Human Wizard', 'When this creature enters, look at the top six cards of your library. You may reveal an instant, sorcery, or Dragon card from among them and put it into your hand. Put the rest on the bottom of your library in a random order.
Untapped Dragons you control have hexproof.', 1, 3, 'Tarkir: Dragonstorm', 'rare'),
       ('074b1e00-45bb-4436-8f5e-058512b2d08a', 'Dragon Sniper',
        'https://cards.scryfall.io/normal/front/0/7/074b1e00-45bb-4436-8f5e-058512b2d08a.jpg?1743204520', '{G}',
        'Creature — Human Archer', 'Vigilance, reach, deathtouch', 1, 1, 'Tarkir: Dragonstorm', 'uncommon'),
       ('7a6004ff-4180-4332-8b51-960f8c7521d9', 'Dragon''s Prey',
        'https://cards.scryfall.io/normal/front/7/a/7a6004ff-4180-4332-8b51-960f8c7521d9.jpg?1743204277', '{2}{B}',
        'Instant', 'This spell costs {2} more to cast if it targets a Dragon.
Destroy target creature.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('75ec7a31-1893-493c-926b-dc3a8a770e72', 'Dragonstorm Forecaster',
        'https://cards.scryfall.io/normal/front/7/5/75ec7a31-1893-493c-926b-dc3a8a770e72.jpg?1743204133', '{U}',
        'Creature — Human Scout',
        '{2}, {T}: Search your library for a card named Dragonstorm Globe or Boulderborn Dragon, reveal it, put it into your hand, then shuffle.',
        NULL, 3, 'Tarkir: Dragonstorm', 'uncommon'),
       ('7f50aa6e-ce6a-4479-9725-202926245f2c', 'Dragonstorm Globe',
        'https://cards.scryfall.io/normal/front/7/f/7f50aa6e-ce6a-4479-9725-202926245f2c.jpg?1743204954', '{3}',
        'Artifact', 'Each Dragon you control enters with an additional +1/+1 counter on it.
{T}: Add one mana of any color.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('b98ecc96-f557-479a-8685-2b5487d5b407', 'Dusyut Earthcarver',
        'https://cards.scryfall.io/normal/front/b/9/b98ecc96-f557-479a-8685-2b5487d5b407.jpg?1743204529', '{5}{G}',
        'Creature — Elephant Druid', 'Reach
When this creature enters, it endures 3. (Put three +1/+1 counters on it or create a 3/3 white Spirit creature token.)',
        4, 4, 'Tarkir: Dragonstorm', 'common'),
       ('2e92640d-768b-4357-905f-bea017d351cc', 'Duty Beyond Death',
        'https://cards.scryfall.io/normal/front/2/e/2e92640d-768b-4357-905f-bea017d351cc.jpg?1743203993', '{1}{W}',
        'Instant', 'As an additional cost to cast this spell, sacrifice a creature.
Creatures you control gain indestructible until end of turn. Put a +1/+1 counter on each creature you control. (Damage and effects that say "destroy" don''t destroy those creatures.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('0ae03ca5-cd4b-42b7-8cd5-3f7e753b4147', 'Effortless Master',
        'https://cards.scryfall.io/normal/front/0/a/0ae03ca5-cd4b-42b7-8cd5-3f7e753b4147.jpg?1743204705', '{2}{U}{R}',
        'Creature — Orc Monk', 'Vigilance
Menace (This creature can''t be blocked except by two or more creatures.)
This creature enters with two +1/+1 counters on it if you''ve cast two or more spells this turn.', 4, 3,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('73a065e3-b530-4e62-ab3c-4f6f908184ec', 'Elspeth, Storm Slayer',
        'https://cards.scryfall.io/normal/front/7/3/73a065e3-b530-4e62-ab3c-4f6f908184ec.jpg?1743203994', '{3}{W}{W}',
        'Legendary Planeswalker — Elspeth', 'If one or more tokens would be created under your control, twice that many of those tokens are created instead.
+1: Create a 1/1 white Soldier creature token.
0: Put a +1/+1 counter on each creature you control. Those creatures gain flying until your next turn.
−3: Destroy target creature an opponent controls with mana value 3 or greater.', NULL, NULL, 'Tarkir: Dragonstorm',
        'mythic'),
       ('485f75d5-da5b-4605-885a-561ccd999cc6', 'Embermouth Sentinel',
        'https://cards.scryfall.io/normal/front/4/8/485f75d5-da5b-4605-885a-561ccd999cc6.jpg?1743204957', '{2}',
        'Artifact Creature — Chimera',
        'When this creature enters, you may search your library for a basic land card, reveal it, then shuffle and put that card on top. If you control a Dragon, put that card onto the battlefield tapped instead.',
        2, 1, 'Tarkir: Dragonstorm', 'common'),
       ('4ddd4477-f8c9-4d05-9177-f8344ba8f40b', 'Encroaching Dragonstorm',
        'https://cards.scryfall.io/normal/front/4/d/4ddd4477-f8c9-4d05-9177-f8344ba8f40b.jpg?1743204535', '{3}{G}',
        'Enchantment', 'When this enchantment enters, search your library for up to two basic land cards, put them onto the battlefield tapped, then shuffle.
When a Dragon you control enters, return this enchantment to its owner''s hand.', NULL, NULL, 'Tarkir: Dragonstorm',
        'uncommon'),
       ('a4ba6d74-c6be-4a5e-8859-b791bb6b8f51', 'Equilibrium Adept',
        'https://cards.scryfall.io/normal/front/a/4/a4ba6d74-c6be-4a5e-8859-b791bb6b8f51.jpg?1743204387', '{3}{R}',
        'Creature — Dog Monk', 'When this creature enters, exile the top card of your library. Until the end of your next turn, you may play that card.
Flurry — Whenever you cast your second spell each turn, this creature gains double strike until end of turn.', 2, 4,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('0d369c44-78ee-4f3c-bf2b-cddba7fe26d4', 'Eshki Dragonclaw',
        'https://cards.scryfall.io/normal/front/0/d/0d369c44-78ee-4f3c-bf2b-cddba7fe26d4.jpg?1743204706',
        '{1}{G}{U}{R}', 'Legendary Creature — Human Warrior', 'Vigilance, trample, ward {1}
At the beginning of combat on your turn, if you''ve cast both a creature spell and a noncreature spell this turn, draw a card and put two +1/+1 counters on Eshki Dragonclaw.',
        4, 4, 'Tarkir: Dragonstorm', 'rare'),
       ('e91c4509-918e-44ba-aa13-1991199fee9f', 'Essence Anchor',
        'https://cards.scryfall.io/normal/front/e/9/e91c4509-918e-44ba-aa13-1991199fee9f.jpg?1743204135', '{2}{U}',
        'Artifact', 'At the beginning of your upkeep, surveil 1. (Look at the top card of your library. You may put it into your graveyard.)
{T}: Create a 2/2 black Zombie Druid creature token. Activate only during your turn and only if a card left your graveyard this turn.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('62209251-4118-4843-895b-46afb7284c75', 'Evolving Wilds',
        'https://cards.scryfall.io/normal/front/6/2/62209251-4118-4843-895b-46afb7284c75.jpg?1743205007', '', 'Land',
        '{T}, Sacrifice this land: Search your library for a basic land card, put it onto the battlefield tapped, then shuffle.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('655fa2e1-3e1c-424c-b17a-daa7b8fface4', 'Fangkeeper''s Familiar',
        'https://cards.scryfall.io/normal/front/6/5/655fa2e1-3e1c-424c-b17a-daa7b8fface4.jpg?1743204714',
        '{1}{B}{G}{U}', 'Creature — Snake', 'Flash
When this creature enters, choose one —
• You gain 3 life and surveil 3. (Look at the top three cards of your library, then put any number of them into your graveyard and the rest on top of your library in any order.)
• Destroy target enchantment.
• Counter target creature spell.', 3, 3, 'Tarkir: Dragonstorm', 'rare'),
       ('83e11f20-6524-4fba-9603-0b97e2d69aac', 'Felothar, Dawn of the Abzan',
        'https://cards.scryfall.io/normal/front/8/3/83e11f20-6524-4fba-9603-0b97e2d69aac.jpg?1743697572', '{W}{B}{G}',
        'Legendary Creature — Human Warrior', 'Trample
Whenever Felothar enters or attacks, you may sacrifice a nonland permanent. When you do, put a +1/+1 counter on each creature you control.',
        3, 3, 'Tarkir: Dragonstorm', 'rare'),
       ('a147b94f-dfcf-44ce-8a73-b2fe6c4efc0e', 'Feral Deathgorger // Dusk Sight',
        'https://cards.scryfall.io/normal/front/a/1/a147b94f-dfcf-44ce-8a73-b2fe6c4efc0e.jpg?1743204282',
        '{5}{B} // {1}{B}', 'Creature — Dragon // Sorcery — Omen', '', 3, 5, 'Tarkir: Dragonstorm', 'common'),
       ('32dc1bf4-a135-449f-848f-361a5360fae1', 'Fire-Rim Form',
        'https://cards.scryfall.io/normal/front/3/2/32dc1bf4-a135-449f-848f-361a5360fae1.jpg?1743204392', '{1}{R}',
        'Enchantment — Aura', 'Flash
Enchant creature
When this Aura enters, enchanted creature gains first strike until end of turn.
Enchanted creature gets +2/+0.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('cc8443a6-282f-4218-9dc8-144b5570d891', 'Flamehold Grappler',
        'https://cards.scryfall.io/normal/front/c/c/cc8443a6-282f-4218-9dc8-144b5570d891.jpg?1743204722', '{U}{R}{W}',
        'Creature — Human Monk', 'First strike
When this creature enters, copy the next spell you cast this turn when you cast it. You may choose new targets for the copy. (A copy of a permanent spell becomes a token.)',
        3, 3, 'Tarkir: Dragonstorm', 'rare'),
       ('1971fd6c-0a1c-41b2-93a6-886a176fbb73', 'Fleeting Effigy',
        'https://cards.scryfall.io/normal/front/1/9/1971fd6c-0a1c-41b2-93a6-886a176fbb73.jpg?1743697583', '{R}',
        'Creature — Elemental', 'Haste
At the beginning of your end step, return this creature to its owner''s hand. (Return it only if it''s on the battlefield.)
{2}{R}: This creature gets +2/+0 until end of turn.', 2, 2, 'Tarkir: Dragonstorm', 'uncommon'),
       ('abb0ba34-6904-4c17-a04d-ea4f12c7cf21', 'Focus the Mind',
        'https://cards.scryfall.io/normal/front/a/b/abb0ba34-6904-4c17-a04d-ea4f12c7cf21.jpg?1743204141', '{4}{U}',
        'Instant', 'This spell costs {2} less to cast if you''ve cast another spell this turn.
Draw three cards, then discard a card.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('8100bceb-ffba-487a-bb45-4fe2a156a8dc', 'Forest',
        'https://cards.scryfall.io/normal/front/8/1/8100bceb-ffba-487a-bb45-4fe2a156a8dc.jpg?1743205126', '',
        'Basic Land — Forest', '({T}: Add {G}.)', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('67ab8e8f-3ef6-4339-8c66-68c5aca4867a', 'Formation Breaker',
        'https://cards.scryfall.io/normal/front/6/7/67ab8e8f-3ef6-4339-8c66-68c5aca4867a.jpg?1743207531', '{1}{G}',
        'Creature — Beast', 'Creatures with power less than this creature''s power can''t block it.
As long as you control a creature with a counter on it, this creature gets +1/+2.', 2, 1, 'Tarkir: Dragonstorm',
        'uncommon'),
       ('b647a018-1d70-43a1-a265-928bcd863689', 'Fortress Kin-Guard',
        'https://cards.scryfall.io/normal/front/b/6/b647a018-1d70-43a1-a265-928bcd863689.jpg?1743204000', '{1}{W}',
        'Creature — Dog Soldier',
        'When this creature enters, it endures 1. (Put a +1/+1 counter on it or create a 1/1 white Spirit creature token.)',
        1, 2, 'Tarkir: Dragonstorm', 'common'),
       ('96f7af08-ac05-45d0-979f-282943130c61', 'Fresh Start',
        'https://cards.scryfall.io/normal/front/9/6/96f7af08-ac05-45d0-979f-282943130c61.jpg?1743204145', '{1}{U}',
        'Enchantment — Aura', 'Flash
Enchant creature
Enchanted creature gets -5/-0 and loses all abilities.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('679fff07-4796-4d91-8dd6-4e294383ce88', 'Frontier Bivouac',
        'https://cards.scryfall.io/normal/front/6/7/679fff07-4796-4d91-8dd6-4e294383ce88.jpg?1743205011', '', 'Land', 'This land enters tapped.
{T}: Add {G}, {U}, or {R}.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('2ce8a205-99d6-4a9c-83a7-18b7220177d3', 'Frontline Rush',
        'https://cards.scryfall.io/normal/front/2/c/2ce8a205-99d6-4a9c-83a7-18b7220177d3.jpg?1743204723', '{R}{W}',
        'Instant', 'Choose one —
• Create two 1/1 red Goblin creature tokens.
• Target creature gets +X/+X until end of turn, where X is the number of creatures you control.', NULL, NULL,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('a750aabb-9788-494a-841f-bf75717970a7', 'Frostcliff Siege',
        'https://cards.scryfall.io/normal/front/a/7/a750aabb-9788-494a-841f-bf75717970a7.jpg?1743204732', '{1}{U}{R}',
        'Enchantment', 'As this enchantment enters, choose Jeskai or Temur.
• Jeskai — Whenever one or more creatures you control deal combat damage to a player, draw a card.
• Temur — Creatures you control get +1/+0 and have trample and haste.', NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('a4f247b6-8212-4e78-a452-d2d3be228d8e', 'Furious Forebear',
        'https://cards.scryfall.io/normal/front/a/4/a4f247b6-8212-4e78-a452-d2d3be228d8e.jpg?1743204001', '{1}{W}',
        'Creature — Spirit Warrior',
        'Whenever a creature you control dies while this card is in your graveyard, you may pay {1}{W}. If you do, return this card from your graveyard to your hand.',
        3, 1, 'Tarkir: Dragonstorm', 'uncommon'),
       ('95994c88-e404-4a4f-8be6-b99d703d4609', 'Glacial Dragonhunt',
        'https://cards.scryfall.io/normal/front/9/5/95994c88-e404-4a4f-8be6-b99d703d4609.jpg?1743204732', '{U}{R}',
        'Sorcery', 'Draw a card, then you may discard a card. When you discard a nonland card this way, Glacial Dragonhunt deals 3 damage to target creature.
Harmonize {4}{U}{R} (You may cast this card from your graveyard for its harmonize cost. You may tap a creature you control to reduce that cost by {X}, where X is its power. Then exile this spell.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('0f37fad7-2385-409b-8375-fa5dfbcad833', 'Glacierwood Siege',
        'https://cards.scryfall.io/normal/front/0/f/0f37fad7-2385-409b-8375-fa5dfbcad833.jpg?1743204739', '{1}{G}{U}',
        'Enchantment', 'As this enchantment enters, choose Temur or Sultai.
• Temur — Whenever you cast an instant or sorcery spell, target player mills four cards.
• Sultai — You may play lands from your graveyard.', NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('ecba23b6-9f3a-431e-bc22-f1fb04d27b68', 'Great Arashin City',
        'https://cards.scryfall.io/normal/front/e/c/ecba23b6-9f3a-431e-bc22-f1fb04d27b68.jpg?1743205015', '', 'Land', 'This land enters tapped unless you control a Forest or a Plains.
{T}: Add {B}.
{1}{B}, {T}, Exile a creature card from your graveyard: Create a 1/1 white Spirit creature token.', NULL, NULL,
        'Tarkir: Dragonstorm', 'rare'),
       ('de731430-6bbf-4782-953e-b69c46353959', 'Gurmag Nightwatch',
        'https://cards.scryfall.io/normal/front/d/e/de731430-6bbf-4782-953e-b69c46353959.jpg?1743204741',
        '{2/B}{2/G}{2/U}', 'Creature — Human Ranger',
        'When this creature enters, look at the top three cards of your library. You may put one of those cards back on top of your library. Put the rest into your graveyard.',
        3, 3, 'Tarkir: Dragonstorm', 'common'),
       ('f05ad909-8860-473b-9a30-a322f7670b32', 'Gurmag Rakshasa',
        'https://cards.scryfall.io/normal/front/f/0/f05ad909-8860-473b-9a30-a322f7670b32.jpg?1743204286', '{4}{B}{B}',
        'Creature — Demon', 'Menace (This creature can''t be blocked except by two or more creatures.)
When this creature enters, target creature an opponent controls gets -2/-2 until end of turn and target creature you control gets +2/+2 until end of turn.',
        5, 5, 'Tarkir: Dragonstorm', 'uncommon'),
       ('86b225cb-5c45-4da1-a64e-b04091e483e8', 'Hardened Tactician',
        'https://cards.scryfall.io/normal/front/8/6/86b225cb-5c45-4da1-a64e-b04091e483e8.jpg?1743204747', '{1}{W}{B}',
        'Creature — Human Warrior', '{1}, Sacrifice a token: Draw a card.', 2, 4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('a88c7713-b3a9-4685-b1d3-623d35b62365', 'Herd Heirloom',
        'https://cards.scryfall.io/normal/front/a/8/a88c7713-b3a9-4685-b1d3-623d35b62365.jpg?1743204542', '{1}{G}',
        'Artifact', '{T}: Add one mana of any color. Spend this mana only to cast a creature spell.
{T}: Until end of turn, target creature you control with power 4 or greater gains trample and "Whenever this creature deals combat damage to a player, draw a card."',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('4f8fee37-a050-4329-8b10-46d150e7a95e', 'Heritage Reclamation',
        'https://cards.scryfall.io/normal/front/4/f/4f8fee37-a050-4329-8b10-46d150e7a95e.jpg?1743204546', '{1}{G}',
        'Instant', 'Choose one —
• Destroy target artifact.
• Destroy target enchantment.
• Exile up to one target card from a graveyard. Draw a card.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('e75dccf7-2894-4c4a-b516-3eee73acddd3', 'Highspire Bell-Ringer',
        'https://cards.scryfall.io/normal/front/e/7/e75dccf7-2894-4c4a-b516-3eee73acddd3.jpg?1743204148', '{2}{U}',
        'Creature — Djinn Monk', 'Flying
The second spell you cast each turn costs {1} less to cast.', 1, 4, 'Tarkir: Dragonstorm', 'common'),
       ('5ac0e136-8877-4bfc-a831-2bf7b7b5ad1e', 'Hollowmurk Siege',
        'https://cards.scryfall.io/normal/front/5/a/5ac0e136-8877-4bfc-a831-2bf7b7b5ad1e.jpg?1743204751', '{B}{G}',
        'Enchantment', 'As this enchantment enters, choose Sultai or Abzan.
• Sultai — Whenever a counter is put on a creature you control, draw a card. This ability triggers only once each turn.
• Abzan — Whenever you attack, put a +1/+1 counter on target attacking creature. It gains menace until end of turn.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('0f182957-8133-45a7-80a3-1944bead4d43', 'Host of the Hereafter',
        'https://cards.scryfall.io/normal/front/0/f/0f182957-8133-45a7-80a3-1944bead4d43.jpg?1743204755', '{2}{B}{G}',
        'Creature — Zombie Warlock', 'This creature enters with two +1/+1 counters on it.
Whenever this creature or another creature you control dies, if it had counters on it, put its counters on up to one target creature you control.',
        2, 2, 'Tarkir: Dragonstorm', 'uncommon'),
       ('3a84c3f8-0030-4653-880e-b2d19272f5fa', 'Humbling Elder',
        'https://cards.scryfall.io/normal/front/3/a/3a84c3f8-0030-4653-880e-b2d19272f5fa.jpg?1743697602', '{U}',
        'Creature — Human Monk', 'Flash
When this creature enters, target creature an opponent controls gets -2/-0 until end of turn.', 1, 2,
        'Tarkir: Dragonstorm', 'common'),
       ('e53adf93-2db5-4087-a2dc-c8f53401d700', 'Hundred-Battle Veteran',
        'https://cards.scryfall.io/normal/front/e/5/e53adf93-2db5-4087-a2dc-c8f53401d700.jpg?1743204289', '{3}{B}',
        'Creature — Zombie Warrior', 'As long as there are three or more different kinds of counters among creatures you control, this creature gets +2/+4.
You may cast this card from your graveyard. If you do, it enters with a finality counter on it. (If a creature with a finality counter on it would die, exile it instead.)',
        4, 2, 'Tarkir: Dragonstorm', 'uncommon'),
       ('d13f117b-b8e4-48db-8ce9-5da9c7ce23a5', 'Iceridge Serpent',
        'https://cards.scryfall.io/normal/front/d/1/d13f117b-b8e4-48db-8ce9-5da9c7ce23a5.jpg?1743204156', '{4}{U}',
        'Creature — Serpent',
        'When this creature enters, return target creature an opponent controls to its owner''s hand.', 3, 3,
        'Tarkir: Dragonstorm', 'common'),
       ('9d677980-b608-407e-9f17-790a81263f15', 'Inevitable Defeat',
        'https://cards.scryfall.io/normal/front/9/d/9d677980-b608-407e-9f17-790a81263f15.jpg?1743204760',
        '{1}{R}{W}{B}', 'Instant', 'This spell can''t be countered.
Exile target nonland permanent. Its controller loses 3 life and you gain 3 life.', NULL, NULL, 'Tarkir: Dragonstorm',
        'rare'),
       ('c642d6ac-f0f0-4b4c-a7ee-50631531f6d1', 'Inspirited Vanguard',
        'https://cards.scryfall.io/normal/front/c/6/c642d6ac-f0f0-4b4c-a7ee-50631531f6d1.jpg?1743204549', '{4}{G}',
        'Creature — Human Soldier',
        'Whenever this creature enters or attacks, it endures 2. (Put two +1/+1 counters on it or create a 2/2 white Spirit creature token.)',
        3, 2, 'Tarkir: Dragonstorm', 'uncommon'),
       ('e3abbc8b-2bf8-478e-a541-f8019d150054', 'Iridescent Tiger',
        'https://cards.scryfall.io/normal/front/e/3/e3abbc8b-2bf8-478e-a541-f8019d150054.jpg?1743213469', '{4}{R}',
        'Creature — Cat', 'When this creature enters, if you cast it, add {W}{U}{B}{R}{G}.', 3, 4,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('1ff6acc9-581c-468f-894d-41f725da7f33', 'Island',
        'https://cards.scryfall.io/normal/front/1/f/1ff6acc9-581c-468f-894d-41f725da7f33.jpg?1743205101', '',
        'Basic Land — Island', '({T}: Add {U}.)', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('516ce5fa-bd00-429b-ba22-b38c7dd9306c', 'Jade-Cast Sentinel',
        'https://cards.scryfall.io/normal/front/5/1/516ce5fa-bd00-429b-ba22-b38c7dd9306c.jpg?1743204961', '{4}',
        'Artifact Creature — Ape Snake', 'Reach
{2}, {T}: Put target card from a graveyard on the bottom of its owner''s library.', 1, 5, 'Tarkir: Dragonstorm',
        'common'),
       ('2eb06c36-cf7e-47a9-819e-adfc54284153', 'Jeskai Brushmaster',
        'https://cards.scryfall.io/normal/front/2/e/2eb06c36-cf7e-47a9-819e-adfc54284153.jpg?1743204763',
        '{1}{U}{R}{W}', 'Creature — Orc Monk', 'Double strike
Prowess (Whenever you cast a noncreature spell, this creature gets +1/+1 until end of turn.)', 2, 4,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('27f31f9c-7149-4608-9b18-b3530a2efd4a', 'Jeskai Devotee',
        'https://cards.scryfall.io/normal/front/2/7/27f31f9c-7149-4608-9b18-b3530a2efd4a.jpg?1743204404', '{1}{R}',
        'Creature — Orc Monk', 'Flurry — Whenever you cast your second spell each turn, this creature gets +1/+1 until end of turn.
{1}: Add {U}, {R}, or {W}. Activate only once each turn.', 2, 2, 'Tarkir: Dragonstorm', 'common'),
       ('d0193ad6-39b7-4558-bd3e-36f809332ea2', 'Jeskai Monument',
        'https://cards.scryfall.io/normal/front/d/0/d0193ad6-39b7-4558-bd3e-36f809332ea2.jpg?1743204966', '{2}',
        'Artifact', 'When this artifact enters, search your library for a basic Island, Mountain, or Plains card, reveal it, put it into your hand, then shuffle.
{1}{U}{R}{W}, {T}, Sacrifice this artifact: Create two 1/1 white Bird creature tokens with flying. Activate only as a sorcery.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('3cac0ad3-5107-4ed6-a688-d44bbd65e407', 'Jeskai Revelation',
        'https://cards.scryfall.io/normal/front/3/c/3cac0ad3-5107-4ed6-a688-d44bbd65e407.jpg?1743204770',
        '{4}{U}{R}{W}', 'Instant',
        'Return target spell or permanent to its owner''s hand. Jeskai Revelation deals 4 damage to any target. Create two 1/1 white Monk creature tokens with prowess. Draw two cards. You gain 4 life.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'mythic'),
       ('6ec8fa0b-c695-4326-aebd-042cb1974925', 'Jeskai Shrinekeeper',
        'https://cards.scryfall.io/normal/front/6/e/6ec8fa0b-c695-4326-aebd-042cb1974925.jpg?1743204771',
        '{2}{U}{R}{W}', 'Creature — Dragon', 'Flying, haste
Whenever this creature deals combat damage to a player, you gain 1 life and draw a card.', 3, 3, 'Tarkir: Dragonstorm',
        'uncommon'),
       ('ea13440b-3f7b-4182-9541-27c1fa3121e5', 'Jungle Hollow',
        'https://cards.scryfall.io/normal/front/e/a/ea13440b-3f7b-4182-9541-27c1fa3121e5.jpg?1743205019', '', 'Land', 'This land enters tapped.
When this land enters, you gain 1 life.
{T}: Add {B} or {G}.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('a4c77b08-c3f6-4458-8636-f226f9843b6d', 'Karakyk Guardian',
        'https://cards.scryfall.io/normal/front/a/4/a4c77b08-c3f6-4458-8636-f226f9843b6d.jpg?1743233806',
        '{3}{G}{U}{R}', 'Creature — Dragon', 'Flying, vigilance, trample
This creature has hexproof if it hasn''t dealt damage yet. (It can''t be the target of spells or abilities your opponents control.)',
        6, 5, 'Tarkir: Dragonstorm', 'uncommon'),
       ('8d11183a-57f5-4ddb-8a6e-15fff704b114', 'Kheru Goldkeeper',
        'https://cards.scryfall.io/normal/front/8/d/8d11183a-57f5-4ddb-8a6e-15fff704b114.jpg?1743204780',
        '{1}{B}{G}{U}', 'Creature — Dragon', 'Flying
Whenever one or more cards leave your graveyard during your turn, create a Treasure token. (It''s an artifact with "{T}, Sacrifice this token: Add one mana of any color.")
Renew — {2}{B}{G}{U}, Exile this card from your graveyard: Put two +1/+1 counters and a flying counter on target creature. Activate only as a sorcery.',
        3, 3, 'Tarkir: Dragonstorm', 'uncommon'),
       ('2177ef64-28bf-4acf-b1f1-c1408f03c411', 'Kin-Tree Nurturer',
        'https://cards.scryfall.io/normal/front/2/1/2177ef64-28bf-4acf-b1f1-c1408f03c411.jpg?1743204295', '{2}{B}',
        'Creature — Human Druid', 'Lifelink
When this creature enters, it endures 1. (Put a +1/+1 counter on it or create a 1/1 white Spirit creature token.)', 2,
        1, 'Tarkir: Dragonstorm', 'common'),
       ('b577e246-3377-42aa-856e-b9fa89f3603a', 'Kin-Tree Severance',
        'https://cards.scryfall.io/normal/front/b/5/b577e246-3377-42aa-856e-b9fa89f3603a.jpg?1743204786',
        '{2/W}{2/B}{2/G}', 'Instant', 'Exile target permanent with mana value 3 or greater.', NULL, NULL,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('b5f1acb0-d73e-4814-8158-3645daf5c4cc', 'Kishla Skimmer',
        'https://cards.scryfall.io/normal/front/b/5/b5f1acb0-d73e-4814-8158-3645daf5c4cc.jpg?1743204788', '{G}{U}',
        'Creature — Bird Scout', 'Flying
Whenever a card leaves your graveyard during your turn, draw a card. This ability triggers only once each turn.', 2, 2,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('190fbc55-e8e9-4077-9532-1de7406baabf', 'Kishla Trawlers',
        'https://cards.scryfall.io/normal/front/1/9/190fbc55-e8e9-4077-9532-1de7406baabf.jpg?1743204163', '{2}{U}',
        'Creature — Human Citizen',
        'When this creature enters, you may exile a creature card from your graveyard. When you do, return target instant or sorcery card from your graveyard to your hand.',
        3, 2, 'Tarkir: Dragonstorm', 'uncommon'),
       ('9f0ff90d-7312-44df-afc5-29c768fa7758', 'Kishla Village',
        'https://cards.scryfall.io/normal/front/9/f/9f0ff90d-7312-44df-afc5-29c768fa7758.jpg?1743205023', '', 'Land', 'This land enters tapped unless you control an Island or a Swamp.
{T}: Add {G}.
{3}{G}, {T}: Surveil 2. (Look at the top two cards of your library, then put any number of them into your graveyard and the rest on top of your library in any order.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('9d218831-2a41-46a3-8e9d-93462cae5cab', 'Knockout Maneuver',
        'https://cards.scryfall.io/normal/front/9/d/9d218831-2a41-46a3-8e9d-93462cae5cab.jpg?1743204555', '{2}{G}',
        'Sorcery',
        'Put a +1/+1 counter on target creature you control, then it deals damage equal to its power to target creature an opponent controls.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('d3736f17-f80b-4b2c-b919-2c963bc14682', 'Kotis, the Fangkeeper',
        'https://cards.scryfall.io/normal/front/d/3/d3736f17-f80b-4b2c-b919-2c963bc14682.jpg?1743204793',
        '{1}{B}{G}{U}', 'Legendary Creature — Zombie Warrior', 'Indestructible
Whenever Kotis deals combat damage to a player, exile the top X cards of their library, where X is the amount of damage dealt. You may cast any number of spells with mana value X or less from among them without paying their mana costs.',
        2, 1, 'Tarkir: Dragonstorm', 'rare'),
       ('a5d0a9fb-1068-478d-a78c-6fd77cc313f0', 'Krotiq Nestguard',
        'https://cards.scryfall.io/normal/front/a/5/a5d0a9fb-1068-478d-a78c-6fd77cc313f0.jpg?1743204557', '{2}{G}',
        'Creature — Insect', 'Defender
{2}{G}: This creature can attack this turn as though it didn''t have defender.', 4, 4, 'Tarkir: Dragonstorm', 'common'),
       ('bc66680f-24ab-433a-8197-feac3a174075', 'Krumar Initiate',
        'https://cards.scryfall.io/normal/front/b/c/bc66680f-24ab-433a-8197-feac3a174075.jpg?1743204296', '{1}{B}',
        'Creature — Human Cleric',
        '{X}{B}, {T}, Pay X life: This creature endures X. Activate only as a sorcery. (Put X +1/+1 counters on it or create an X/X white Spirit creature token.)',
        2, 2, 'Tarkir: Dragonstorm', 'uncommon'),
       ('c7f5c8ef-8e9e-4264-a7d2-126a30a5d341', 'Lasyd Prowler',
        'https://cards.scryfall.io/normal/front/c/7/c7f5c8ef-8e9e-4264-a7d2-126a30a5d341.jpg?1743204564', '{2}{G}{G}',
        'Creature — Snake Ranger', 'When this creature enters, you may mill cards equal to the number of lands you control.
Renew — {1}{G}, Exile this card from your graveyard: Put X +1/+1 counters on target creature, where X is the number of land cards in your graveyard. Activate only as a sorcery.',
        5, 5, 'Tarkir: Dragonstorm', 'rare'),
       ('96fff22c-282b-4849-82ce-890013b53262', 'Lie in Wait',
        'https://cards.scryfall.io/normal/front/9/6/96fff22c-282b-4849-82ce-890013b53262.jpg?1743204797', '{B}{G}{U}',
        'Sorcery',
        'Return target creature card from your graveyard to your hand. Lie in Wait deals damage equal to that card''s power to target creature.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('baac1a41-d44d-4184-9147-b4233e73de65', 'Lightfoot Technique',
        'https://cards.scryfall.io/normal/front/b/a/baac1a41-d44d-4184-9147-b4233e73de65.jpg?1743204007', '{1}{W}',
        'Instant',
        'Put a +1/+1 counter on target creature. It gains flying and indestructible until end of turn. (Damage and effects that say "destroy" don''t destroy it.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('82aa2593-4a79-46f1-a2bd-b71fb504d0ab', 'Lotuslight Dancers',
        'https://cards.scryfall.io/normal/front/8/2/82aa2593-4a79-46f1-a2bd-b71fb504d0ab.jpg?1743204801',
        '{2}{B}{G}{U}', 'Creature — Zombie Bard', 'Lifelink
When this creature enters, search your library for a black card, a green card, and a blue card. Put those cards into your graveyard, then shuffle.',
        3, 6, 'Tarkir: Dragonstorm', 'rare'),
       ('a527cdb0-f54a-4b53-83a0-6b3e8cafa45e', 'Loxodon Battle Priest',
        'https://cards.scryfall.io/normal/front/a/5/a527cdb0-f54a-4b53-83a0-6b3e8cafa45e.jpg?1743204012', '{4}{W}',
        'Creature — Elephant Cleric',
        'At the beginning of combat on your turn, put a +1/+1 counter on another target creature you control.', 3, 5,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('c4e90bfb-d9a5-48a9-9ff9-b0f50a813eee', 'Maelstrom of the Spirit Dragon',
        'https://cards.scryfall.io/normal/front/c/4/c4e90bfb-d9a5-48a9-9ff9-b0f50a813eee.jpg?1743205026', '', 'Land', '{T}: Add {C}.
{T}: Add one mana of any color. Spend this mana only to cast a Dragon spell or an Omen spell.
{4}, {T}, Sacrifice this land: Search your library for a Dragon card, reveal it, put it into your hand, then shuffle.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('b3b3aec8-d931-4c7f-86b5-1e7dfb717b59', 'Magmatic Hellkite',
        'https://cards.scryfall.io/normal/front/b/3/b3b3aec8-d931-4c7f-86b5-1e7dfb717b59.jpg?1743204407', '{2}{R}{R}',
        'Creature — Dragon', 'Flying
When this creature enters, destroy target nonbasic land an opponent controls. Its controller searches their library for a basic land card, puts it onto the battlefield tapped with a stun counter on it, then shuffles. (If a permanent with a stun counter would become untapped, remove one from it instead.)',
        4, 5, 'Tarkir: Dragonstorm', 'rare'),
       ('468b17b4-79ce-4dfa-8873-a9cfc347e38f', 'Mammoth Bellow',
        'https://cards.scryfall.io/normal/front/4/6/468b17b4-79ce-4dfa-8873-a9cfc347e38f.jpg?1743204808',
        '{2}{G}{U}{R}', 'Sorcery', 'Create a 5/5 green Elephant creature token.
Harmonize {5}{G}{U}{R} (You may cast this card from your graveyard for its harmonize cost. You may tap a creature you control to reduce that cost by {X}, where X is its power. Then exile this spell.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('f890bdc7-32e6-4492-bac7-7cabf54a8bfd', 'Marang River Regent // Coil and Catch',
        'https://cards.scryfall.io/normal/front/f/8/f890bdc7-32e6-4492-bac7-7cabf54a8bfd.jpg?1744554271',
        '{4}{U}{U} // {3}{U}', 'Creature — Dragon // Instant — Omen', '', 6, 7, 'Tarkir: Dragonstorm', 'rare'),
       ('da45e9b0-a4f6-413b-9e62-666c511eb5b0', 'Mardu Devotee',
        'https://cards.scryfall.io/normal/front/d/a/da45e9b0-a4f6-413b-9e62-666c511eb5b0.jpg?1743204014', '{W}',
        'Creature — Human Scout', 'When this creature enters, scry 2. (Look at the top two cards of your library, then put any number of them on the bottom and the rest on top in any order.)
{1}: Add {R}, {W}, or {B}. Activate only once each turn.', 1, 2, 'Tarkir: Dragonstorm', 'common'),
       ('9bd0c794-77bc-4d4a-a769-3829e2ce4bdf', 'Mardu Monument',
        'https://cards.scryfall.io/normal/front/9/b/9bd0c794-77bc-4d4a-a769-3829e2ce4bdf.jpg?1743204968', '{2}',
        'Artifact', 'When this artifact enters, search your library for a basic Mountain, Plains, or Swamp card, reveal it, put it into your hand, then shuffle.
{2}{R}{W}{B}, {T}, Sacrifice this artifact: Create three 1/1 red Warrior creature tokens. They gain menace and haste until end of turn. Activate only as a sorcery. (A creature with menace can''t be blocked except by two or more creatures.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('3044b232-edf4-4000-9273-cc4653ad653a', 'Mardu Siegebreaker',
        'https://cards.scryfall.io/normal/front/3/0/3044b232-edf4-4000-9273-cc4653ad653a.jpg?1743204809',
        '{1}{R}{W}{B}', 'Creature — Human Warrior', 'Deathtouch, haste
When this creature enters, exile up to one other target creature you control until this creature leaves the battlefield.
Whenever this creature attacks, for each opponent, create a tapped token that''s a copy of the exiled card attacking that opponent. At the beginning of your next end step, sacrifice those tokens.',
        4, 4, 'Tarkir: Dragonstorm', 'rare'),
       ('64fbaa16-67c3-4ed2-9545-39abbbde61dc', 'Marshal of the Lost',
        'https://cards.scryfall.io/normal/front/6/4/64fbaa16-67c3-4ed2-9545-39abbbde61dc.jpg?1743204817', '{2}{W}{B}',
        'Creature — Orc Warrior', 'Deathtouch
Whenever you attack, target creature gets +X/+X until end of turn, where X is the number of attacking creatures.', 3, 3,
        'Tarkir: Dragonstorm', 'uncommon'),
       ('baf4c9dd-0546-41ac-a7ba-0bc312fef31e', 'Meticulous Artisan',
        'https://cards.scryfall.io/normal/front/b/a/baf4c9dd-0546-41ac-a7ba-0bc312fef31e.jpg?1743204413', '{3}{R}',
        'Creature — Djinn Artificer', 'Prowess (Whenever you cast a noncreature spell, this creature gets +1/+1 until end of turn.)
When this creature enters, create a Treasure token. (It''s an artifact with "{T}, Sacrifice this token: Add one mana of any color.")',
        3, 3, 'Tarkir: Dragonstorm', 'common'),
       ('d44bccbf-6fab-46e4-8ddb-6577e27ec6e8', 'Mistrise Village',
        'https://cards.scryfall.io/normal/front/d/4/d44bccbf-6fab-46e4-8ddb-6577e27ec6e8.jpg?1743205033', '', 'Land', 'This land enters tapped unless you control a Mountain or a Forest.
{T}: Add {U}.
{U}, {T}: The next spell you cast this turn can''t be countered.', NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('0ab95aab-a4bf-4131-83a0-2c138b6f20c3', 'Molten Exhale',
        'https://cards.scryfall.io/normal/front/0/a/0ab95aab-a4bf-4131-83a0-2c138b6f20c3.jpg?1743204414', '{1}{R}',
        'Sorcery', 'You may cast this spell as though it had flash if you behold a Dragon as an additional cost to cast it. (To behold a Dragon, choose a Dragon you control or reveal a Dragon card from your hand.)
Molten Exhale deals 4 damage to target creature or planeswalker.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('0c9eeced-6464-41f0-bbea-05b3af4cc005', 'Monastery Messenger',
        'https://cards.scryfall.io/normal/front/0/c/0c9eeced-6464-41f0-bbea-05b3af4cc005.jpg?1743204819',
        '{2/U}{2/R}{2/W}', 'Creature — Bird Scout', 'Flying, vigilance
When this creature enters, put up to one target noncreature, nonland card from your graveyard on top of your library.',
        2, 3, 'Tarkir: Dragonstorm', 'common'),
       ('bfa10a88-12e0-4b79-80bb-6f4620277e20', 'Mountain',
        'https://cards.scryfall.io/normal/front/b/f/bfa10a88-12e0-4b79-80bb-6f4620277e20.jpg?1743205117', '',
        'Basic Land — Mountain', '({T}: Add {R}.)', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('a851d2d3-7e93-4887-bee5-4d6c9aaf9419', 'Mox Jasper',
        'https://cards.scryfall.io/normal/front/a/8/a851d2d3-7e93-4887-bee5-4d6c9aaf9419.jpg?1743204975', '{0}',
        'Legendary Artifact', '{T}: Add one mana of any color. Activate only if you control a Dragon.', NULL, NULL,
        'Tarkir: Dragonstorm', 'mythic'),
       ('c7b8a01c-c400-47c7-8270-78902efe850e', 'Mystic Monastery',
        'https://cards.scryfall.io/normal/front/c/7/c7b8a01c-c400-47c7-8270-78902efe850e.jpg?1743205034', '', 'Land', 'This land enters tapped.
{T}: Add {U}, {R}, or {W}.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('5df17423-9fdd-4432-8660-1d267c685595', 'Naga Fleshcrafter',
        'https://cards.scryfall.io/normal/front/5/d/5df17423-9fdd-4432-8660-1d267c685595.jpg?1743204171', '{3}{U}',
        'Creature — Snake Shapeshifter', 'You may have this creature enter as a copy of any creature on the battlefield.
Renew — {2}{U}, Exile this card from your graveyard: Put a +1/+1 counter on target nonlegendary creature you control. Each other creature you control becomes a copy of that creature until end of turn. Activate only as a sorcery.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('6b77cbc1-dbc8-44d9-aa29-15cbb19afecd', 'Narset, Jeskai Waymaster',
        'https://cards.scryfall.io/normal/front/6/b/6b77cbc1-dbc8-44d9-aa29-15cbb19afecd.jpg?1743204826', '{U}{R}{W}',
        'Legendary Creature — Human Monk',
        'At the beginning of your end step, you may discard your hand. If you do, draw cards equal to the number of spells you''ve cast this turn.',
        3, 4, 'Tarkir: Dragonstorm', 'rare'),
       ('5098bd73-d51c-4db4-bf06-fd4854089d37', 'Narset''s Rebuke',
        'https://cards.scryfall.io/normal/front/5/0/5098bd73-d51c-4db4-bf06-fd4854089d37.jpg?1743204422', '{4}{R}',
        'Instant',
        'Narset''s Rebuke deals 5 damage to target creature. Add {U}{R}{W}. If that creature would die this turn, exile it instead.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('1397d904-c51d-451e-8505-7f3118acc1f6', 'Nature''s Rhythm',
        'https://cards.scryfall.io/normal/front/1/3/1397d904-c51d-451e-8505-7f3118acc1f6.jpg?1743204565', '{X}{G}{G}',
        'Sorcery', 'Search your library for a creature card with mana value X or less, put it onto the battlefield, then shuffle.
Harmonize {X}{G}{G}{G}{G} (You may cast this card from your graveyard for its harmonize cost. You may tap a creature you control to reduce that cost by an amount of generic mana equal to its power. Then exile this spell.)',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('b58112b0-a05c-4b98-b650-fd27ad97789f', 'Neriv, Heart of the Storm',
        'https://cards.scryfall.io/normal/front/b/5/b58112b0-a05c-4b98-b650-fd27ad97789f.jpg?1743204826',
        '{1}{R}{W}{B}', 'Legendary Creature — Spirit Dragon', 'Flying
If a creature you control that entered this turn would deal damage, it deals twice that much damage instead.', 4, 5,
        'Tarkir: Dragonstorm', 'mythic'),
       ('d9d48f9e-79f0-478c-9db0-ff7ac4a8f401', 'New Way Forward',
        'https://cards.scryfall.io/normal/front/d/9/d9d48f9e-79f0-478c-9db0-ff7ac4a8f401.jpg?1743204834',
        '{2}{U}{R}{W}', 'Instant',
        'The next time a source of your choice would deal damage to you this turn, prevent that damage. When damage is prevented this way, New Way Forward deals that much damage to that source''s controller and you draw that many cards.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('648debd9-d4cf-4788-8882-f1601a3d87f5', 'Nightblade Brigade',
        'https://cards.scryfall.io/normal/front/6/4/648debd9-d4cf-4788-8882-f1601a3d87f5.jpg?1743204303', '{2}{B}',
        'Creature — Goblin Soldier', 'Deathtouch
Mobilize 1 (Whenever this creature attacks, create a tapped and attacking 1/1 red Warrior creature token. Sacrifice it at the beginning of the next end step.)
When this creature enters, surveil 1. (Look at the top card of your library. You may put it into your graveyard.)', 1,
        3, 'Tarkir: Dragonstorm', 'common'),
       ('a68fbeaa-941f-4d53-becd-f93ed22b9a54', 'Nomad Outpost',
        'https://cards.scryfall.io/normal/front/a/6/a68fbeaa-941f-4d53-becd-f93ed22b9a54.jpg?1743205041', '', 'Land', 'This land enters tapped.
{T}: Add {R}, {W}, or {B}.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('21cb3b3b-0738-4c2e-a3fc-927fd6b9d3fb', 'Opulent Palace',
        'https://cards.scryfall.io/normal/front/2/1/21cb3b3b-0738-4c2e-a3fc-927fd6b9d3fb.jpg?1743205041', '', 'Land', 'This land enters tapped.
{T}: Add {B}, {G}, or {U}.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('2300da2f-2297-4c2f-90c1-11ce2b42d91f', 'Osseous Exhale',
        'https://cards.scryfall.io/normal/front/2/3/2300da2f-2297-4c2f-90c1-11ce2b42d91f.jpg?1743204021', '{1}{W}',
        'Instant', 'As an additional cost to cast this spell, you may behold a Dragon. (You may choose a Dragon you control or reveal a Dragon card from your hand.)
Osseous Exhale deals 5 damage to target attacking or blocking creature. If a Dragon was beheld, you gain 2 life.', NULL,
        NULL, 'Tarkir: Dragonstorm', 'common'),
       ('bd7af85f-354e-468a-990b-bd774e68240f', 'Overwhelming Surge',
        'https://cards.scryfall.io/normal/front/b/d/bd7af85f-354e-468a-990b-bd774e68240f.jpg?1743204422', '{2}{R}',
        'Instant', 'Choose one or both —
• Overwhelming Surge deals 3 damage to target creature.
• Destroy target noncreature artifact.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('ffe7071e-a214-44e8-a571-129f0db44f76', 'Perennation',
        'https://cards.scryfall.io/normal/front/f/f/ffe7071e-a214-44e8-a571-129f0db44f76.jpg?1743204835',
        '{3}{W}{B}{G}', 'Sorcery',
        'Return target permanent card from your graveyard to the battlefield with a hexproof counter and an indestructible counter on it.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'mythic'),
       ('b2a0deb9-5bc3-42d5-9e1e-5f463d176aef', 'Piercing Exhale',
        'https://cards.scryfall.io/normal/front/b/2/b2a0deb9-5bc3-42d5-9e1e-5f463d176aef.jpg?1743204571', '{1}{G}',
        'Instant', 'As an additional cost to cast this spell, you may behold a Dragon. (You may choose a Dragon you control or reveal a Dragon card from your hand.)
Target creature you control deals damage equal to its power to target creature or planeswalker. If a Dragon was beheld, surveil 2.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('12cff32a-a365-43ee-a196-8ce32b3bb9fd', 'Plains',
        'https://cards.scryfall.io/normal/front/1/2/12cff32a-a365-43ee-a196-8ce32b3bb9fd.jpg?1743205092', '',
        'Basic Land — Plains', '({T}: Add {W}.)', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('bb25366d-a647-4c5e-bcc7-7e54659aacbd', 'Poised Practitioner',
        'https://cards.scryfall.io/normal/front/b/b/bb25366d-a647-4c5e-bcc7-7e54659aacbd.jpg?1743204021', '{2}{W}',
        'Creature — Human Monk',
        'Flurry — Whenever you cast your second spell each turn, put a +1/+1 counter on this creature. Scry 1. (Look at the top card of your library. You may put that card on the bottom.)',
        2, 3, 'Tarkir: Dragonstorm', 'common'),
       ('3988dc76-072c-4f43-849d-2e73c6f6ff58', 'Purging Stormbrood // Absorb Essence',
        'https://cards.scryfall.io/normal/front/3/9/3988dc76-072c-4f43-849d-2e73c6f6ff58.jpg?1743204843',
        '{4}{B} // {1}{W}', 'Creature — Dragon // Instant — Omen', '', 4, 4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('8c93a0f6-5e50-4dda-9ff6-da741fb839ff', 'Qarsi Revenant',
        'https://cards.scryfall.io/normal/front/8/c/8c93a0f6-5e50-4dda-9ff6-da741fb839ff.jpg?1743204304', '{1}{B}{B}',
        'Creature — Vampire', 'Flying, deathtouch, lifelink
Renew — {2}{B}, Exile this card from your graveyard: Put a flying counter, a deathtouch counter, and a lifelink counter on target creature. Activate only as a sorcery.',
        3, 3, 'Tarkir: Dragonstorm', 'rare'),
       ('9bc5c316-6a41-48ba-864b-da3030dd3e0e', 'Rainveil Rejuvenator',
        'https://cards.scryfall.io/normal/front/9/b/9bc5c316-6a41-48ba-864b-da3030dd3e0e.jpg?1743204573', '{3}{G}',
        'Creature — Elephant Druid', 'When this creature enters, you may mill three cards. (You may put the top three cards of your library into your graveyard.)
{T}: Add an amount of {G} equal to this creature''s power.', 2, 4, 'Tarkir: Dragonstorm', 'uncommon'),
       ('5c409f4f-3b2c-4c33-b850-55b2a46f51ca', 'Rakshasa''s Bargain',
        'https://cards.scryfall.io/normal/front/5/c/5c409f4f-3b2c-4c33-b850-55b2a46f51ca.jpg?1743204844',
        '{2/B}{2/G}{2/U}', 'Instant',
        'Look at the top four cards of your library. Put two of them into your hand and the rest into your graveyard.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('b56e0037-8143-4c13-83e1-0c3f44e685ea', 'Rally the Monastery',
        'https://cards.scryfall.io/normal/front/b/5/b56e0037-8143-4c13-83e1-0c3f44e685ea.jpg?1743204029', '{3}{W}',
        'Instant', 'This spell costs {2} less to cast if you''ve cast another spell this turn.
Choose one —
• Create two 1/1 white Monk creature tokens with prowess.
• Up to two target creatures you control each get +2/+2 until end of turn.
• Destroy target creature with power 4 or greater.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('c9bafe19-3bd6-4da0-b3e5-e0b89262504c', 'Rebellious Strike',
        'https://cards.scryfall.io/normal/front/c/9/c9bafe19-3bd6-4da0-b3e5-e0b89262504c.jpg?1743204030', '{1}{W}',
        'Instant', 'Target creature gets +3/+0 until end of turn.
Draw a card.', NULL, NULL, 'Tarkir: Dragonstorm', 'common'),
       ('79d6decf-afd5-4e96-b87e-fd7ab7e3c068', 'Rediscover the Way',
        'https://cards.scryfall.io/normal/front/7/9/79d6decf-afd5-4e96-b87e-fd7ab7e3c068.jpg?1743204851', '{U}{R}{W}',
        'Enchantment — Saga', '(As this Saga enters and after your draw step, add a lore counter. Sacrifice after III.)
I, II — Look at the top three cards of your library. Put one of them into your hand and the rest on the bottom of your library in any order.
III — Whenever you cast a noncreature spell this turn, target creature you control gains double strike until end of turn.',
        NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('a394112a-032b-4047-887a-6522cf7b83d5', 'Reigning Victor',
        'https://cards.scryfall.io/normal/front/a/3/a394112a-032b-4047-887a-6522cf7b83d5.jpg?1743204853',
        '{2/R}{2/W}{2/B}', 'Creature — Orc Warrior', 'Mobilize 1 (Whenever this creature attacks, create a tapped and attacking 1/1 red Warrior creature token. Sacrifice it at the beginning of the next end step.)
When this creature enters, target creature gets +1/+0 and gains indestructible until end of turn. (Damage and effects that say "destroy" don''t destroy it.)',
        3, 3, 'Tarkir: Dragonstorm', 'common'),
       ('b7d0591e-7fb7-40ea-ba2a-cfe544d40216', 'Reputable Merchant',
        'https://cards.scryfall.io/normal/front/b/7/b7d0591e-7fb7-40ea-ba2a-cfe544d40216.jpg?1743204858',
        '{2/W}{2/B}{2/G}', 'Creature — Human Citizen',
        'When this creature enters or dies, put a +1/+1 counter on target creature you control.', 2, 2,
        'Tarkir: Dragonstorm', 'common'),
       ('056136a8-84be-477c-b654-63238fb8236e', 'Rescue Leopard',
        'https://cards.scryfall.io/normal/front/0/5/056136a8-84be-477c-b654-63238fb8236e.jpg?1743204430', '{2}{R}',
        'Creature — Cat', 'Whenever this creature becomes tapped, you may discard a card. If you do, draw a card.', 4,
        2, 'Tarkir: Dragonstorm', 'common'),
       ('1af19ce8-bc0c-420c-9e3b-9059b4df32cb', 'Reverberating Summons',
        'https://cards.scryfall.io/normal/front/1/a/1af19ce8-bc0c-420c-9e3b-9059b4df32cb.jpg?1743204431', '{1}{R}',
        'Enchantment', 'At the beginning of each combat, if you''ve cast two or more spells this turn, this enchantment becomes a 3/3 Monk creature with haste in addition to its other types until end of turn.
{1}{R}, Discard your hand, Sacrifice this enchantment: Draw two cards.', NULL, NULL, 'Tarkir: Dragonstorm', 'uncommon'),
       ('fd742ff5-f0ea-4f4b-911e-4c09e2154dba', 'Revival of the Ancestors',
        'https://cards.scryfall.io/normal/front/f/d/fd742ff5-f0ea-4f4b-911e-4c09e2154dba.jpg?1744578010',
        '{1}{W}{B}{G}', 'Enchantment — Saga', '(As this Saga enters and after your draw step, add a lore counter. Sacrifice after III.)
I — Create three 1/1 white Spirit creature tokens.
II — Distribute three +1/+1 counters among one, two, or three target creatures you control.
III — Creatures you control gain trample and lifelink until end of turn.', NULL, NULL, 'Tarkir: Dragonstorm', 'rare'),
       ('312f7072-3bf8-449f-bfb7-93727ef26c66', 'Riling Dawnbreaker // Signaling Roar',
        'https://cards.scryfall.io/normal/front/3/1/312f7072-3bf8-449f-bfb7-93727ef26c66.jpg?1743204036',
        '{4}{W} // {1}{W}', 'Creature — Dragon // Sorcery — Omen', '', 3, 4, 'Tarkir: Dragonstorm', 'common'),
       ('ff4fc7ec-05f5-479a-8fbb-31e12a67b57e', 'Ringing Strike Mastery',
        'https://cards.scryfall.io/normal/front/f/f/ff4fc7ec-05f5-479a-8fbb-31e12a67b57e.jpg?1743204172', '{U}',
        'Enchantment — Aura', 'Enchant creature
When this Aura enters, tap enchanted creature.
Enchanted creature doesn''t untap during its controller''s untap step.
Enchanted creature has "{5}: Untap this creature."', NULL, NULL, 'Tarkir: Dragonstorm', 'common');


-- ============================================
-- COLLECTIONS DATA (ManyToMany: PLAYERS <-> CARDS)
-- Tracks which cards players own and quantity
-- Using some of the cards from the full set
-- ============================================

INSERT INTO COLLECTIONS (PLAYER_ID, CARD_MTG_ID, QUANTITY)
VALUES
-- Alice's collection
(1, '66555946-e747-46fa-b1ac-b103a8edcd93', 4),
(1, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 2),
(1, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 8),
(1, '0a9df994-e0f4-4919-af99-4f643eb9199c', 12),
(1, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 1),

-- Bob's collection
(2, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
(2, 'bfa10a88-12e0-4b79-80bb-6f4620277e20', 25),
(2, '490eb213-9ae2-4b45-abec-6f1dfc83792a', 2),
(2, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 1),

-- Charlie's collection
(3, 'b475b071-5545-483e-a397-89451f258602', 1),
(3, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 2),
(3, '276f5cee-a501-4658-bd4d-7a044bf1ccbc', 1),
(3, '73a065e3-b530-4e62-ab3c-4f6f908184ec', 4),

-- Diana's collection
(4, '8100bceb-ffba-487a-bb45-4fe2a156a8dc', 30),
(4, '0a9df994-e0f4-4919-af99-4f643eb9199c', 20),
(4, '66555946-e747-46fa-b1ac-b103a8edcd93', 8),
(4, 'd1a4f502-86a9-49fb-9cb9-7918d13c5313', 3),

-- Ethan's collection
(5, 'bfa10a88-12e0-4b79-80bb-6f4620277e20', 20),
(5, '490eb213-9ae2-4b45-abec-6f1dfc83792a', 3),
(5, 'ea13440b-3f7b-4182-9541-27c1fa3121e5', 12);

-- ============================================
-- DECKS DATA (OneToMany with PLAYERS)
-- ============================================

INSERT INTO DECKS (PLAYER_ID, NAME, COLORS, FORMAT)
VALUES (1, 'Blue Control', ARRAY['U'], 'STANDARD'),
       (1, 'Abzan Midrange', ARRAY['W', 'B', 'G'], 'STANDARD'),
       (2, 'Red Burn', ARRAY['R'], 'STANDARD'),
       (3, 'Vintage Power', ARRAY['U', 'B', 'R'], 'DRAFT'),
       (4, 'Green White Angels', ARRAY['G', 'W'], 'STANDARD'),
       (5, 'Mono Red Aggro', ARRAY['R'], 'STANDARD');

-- ============================================
-- DECK_CARDS TABLE (ManyToMany: DECKS <-> CARDS)
-- 60 card decks with 20-24 lands each
-- ============================================

INSERT INTO DECK_CARDS (DECK_ID, CARD_MTG_ID, QUANTITY)
VALUES (1, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 4),
       (1, '0a9df994-e0f4-4919-af99-4f643eb9199c', 4),
       (1, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
       (1, '98ad5f0c-8775-4e89-8e92-84a6ade93e35', 4),
       (1, '082b52c9-c46e-44d3-b723-546ba528e07b', 4),
       (1, '62209251-4118-4843-895b-46afb7284c75', 2),
       (1, '66555946-e747-46fa-b1ac-b103a8edcd93', 1),
       (1, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 4),
       (1, '058da414-1f05-45a0-8938-2fbc1050e17e', 1),
       (1, 'bb13a34b-6ac8-47cb-9e91-47106a585fc1', 4),
       (1, '19c1417a-9719-46f6-8749-d92b93ce0529', 4),
       (1, '812d0462-0158-467f-951d-a7a121188a10', 4),
       (1, '993ade84-031f-4a3e-bd68-55f61b559248', 2),
       (1, '57695a9b-8f72-4ccc-a946-5d5037b09b8f', 4),
       (1, '4d305609-64f8-4f3f-bf67-cd5257f0d01e', 1),
       (1, 'a9262bf6-df6a-446c-ba70-18270a09842d', 3),
       (1, 'b74876d8-f6a6-4b47-b960-b01a331bab01', 2),
       (1, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 2),
       (1, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 3),
       (1, 'dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 2),
       (1, '17f61c01-0a41-4fa1-ac34-ffa83baad989', 1),
       (2, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 4),
       (2, '0a9df994-e0f4-4919-af99-4f643eb9199c', 4),
       (2, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
       (2, '98ad5f0c-8775-4e89-8e92-84a6ade93e35', 4),
       (2, '082b52c9-c46e-44d3-b723-546ba528e07b', 4),
       (2, '62209251-4118-4843-895b-46afb7284c75', 4),
       (2, '66555946-e747-46fa-b1ac-b103a8edcd93', 2),
       (2, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 2),
       (2, '058da414-1f05-45a0-8938-2fbc1050e17e', 2),
       (2, 'bb13a34b-6ac8-47cb-9e91-47106a585fc1', 4),
       (2, '19c1417a-9719-46f6-8749-d92b93ce0529', 4),
       (2, '812d0462-0158-467f-951d-a7a121188a10', 1),
       (2, '993ade84-031f-4a3e-bd68-55f61b559248', 1),
       (2, '57695a9b-8f72-4ccc-a946-5d5037b09b8f', 4),
       (2, '4d305609-64f8-4f3f-bf67-cd5257f0d01e', 4),
       (2, 'a9262bf6-df6a-446c-ba70-18270a09842d', 2),
       (2, 'b74876d8-f6a6-4b47-b960-b01a331bab01', 3),
       (2, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 2),
       (2, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 3),
       (2, 'dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 1),
       (2, '17f61c01-0a41-4fa1-ac34-ffa83baad989', 1),
       (3, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 4),
       (3, '0a9df994-e0f4-4919-af99-4f643eb9199c', 4),
       (3, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
       (3, '98ad5f0c-8775-4e89-8e92-84a6ade93e35', 4),
       (3, '082b52c9-c46e-44d3-b723-546ba528e07b', 4),
       (3, '66555946-e747-46fa-b1ac-b103a8edcd93', 4),
       (3, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 2),
       (3, '058da414-1f05-45a0-8938-2fbc1050e17e', 1),
       (3, 'bb13a34b-6ac8-47cb-9e91-47106a585fc1', 2),
       (3, '19c1417a-9719-46f6-8749-d92b93ce0529', 4),
       (3, '812d0462-0158-467f-951d-a7a121188a10', 2),
       (3, '993ade84-031f-4a3e-bd68-55f61b559248', 4),
       (3, '57695a9b-8f72-4ccc-a946-5d5037b09b8f', 4),
       (3, '4d305609-64f8-4f3f-bf67-cd5257f0d01e', 4),
       (3, 'a9262bf6-df6a-446c-ba70-18270a09842d', 3),
       (3, 'b74876d8-f6a6-4b47-b960-b01a331bab01', 2),
       (3, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 2),
       (3, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 3),
       (3, 'dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 3),
       (4, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 4),
       (4, '0a9df994-e0f4-4919-af99-4f643eb9199c', 4),
       (4, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
       (4, '98ad5f0c-8775-4e89-8e92-84a6ade93e35', 4),
       (4, '082b52c9-c46e-44d3-b723-546ba528e07b', 4),
       (4, '66555946-e747-46fa-b1ac-b103a8edcd93', 1),
       (4, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 4),
       (4, '058da414-1f05-45a0-8938-2fbc1050e17e', 2),
       (4, 'bb13a34b-6ac8-47cb-9e91-47106a585fc1', 4),
       (4, '19c1417a-9719-46f6-8749-d92b93ce0529', 2),
       (4, '812d0462-0158-467f-951d-a7a121188a10', 4),
       (4, '993ade84-031f-4a3e-bd68-55f61b559248', 1),
       (4, '57695a9b-8f72-4ccc-a946-5d5037b09b8f', 1),
       (4, '4d305609-64f8-4f3f-bf67-cd5257f0d01e', 2),
       (4, 'a9262bf6-df6a-446c-ba70-18270a09842d', 3),
       (4, 'b74876d8-f6a6-4b47-b960-b01a331bab01', 4),
       (4, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 3),
       (4, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 2),
       (4, 'dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 2),
       (4, '17f61c01-0a41-4fa1-ac34-ffa83baad989', 3),
       (4, 'd1a4f502-86a9-49fb-9cb9-7918d13c5313', 2),
       (5, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 4),
       (5, '0a9df994-e0f4-4919-af99-4f643eb9199c', 4),
       (5, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
       (5, '98ad5f0c-8775-4e89-8e92-84a6ade93e35', 4),
       (5, '082b52c9-c46e-44d3-b723-546ba528e07b', 4),
       (5, '62209251-4118-4843-895b-46afb7284c75', 4),
       (5, '66555946-e747-46fa-b1ac-b103a8edcd93', 4),
       (5, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 3),
       (5, '058da414-1f05-45a0-8938-2fbc1050e17e', 1),
       (5, 'bb13a34b-6ac8-47cb-9e91-47106a585fc1', 4),
       (5, '19c1417a-9719-46f6-8749-d92b93ce0529', 3),
       (5, '812d0462-0158-467f-951d-a7a121188a10', 3),
       (5, '993ade84-031f-4a3e-bd68-55f61b559248', 1),
       (5, '57695a9b-8f72-4ccc-a946-5d5037b09b8f', 3),
       (5, '4d305609-64f8-4f3f-bf67-cd5257f0d01e', 4),
       (5, 'a9262bf6-df6a-446c-ba70-18270a09842d', 3),
       (5, 'b74876d8-f6a6-4b47-b960-b01a331bab01', 2),
       (5, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 3),
       (5, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 1),
       (5, 'dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 1),
       (6, '1dde3c68-6f29-4c00-b668-c25ac9e3e13b', 4),
       (6, '0a9df994-e0f4-4919-af99-4f643eb9199c', 4),
       (6, '9312821a-2059-4f44-9b20-c9522b827e38', 4),
       (6, '98ad5f0c-8775-4e89-8e92-84a6ade93e35', 4),
       (6, '082b52c9-c46e-44d3-b723-546ba528e07b', 4),
       (6, '66555946-e747-46fa-b1ac-b103a8edcd93', 1),
       (6, 'd2da9024-3b58-4a57-8f7d-4094c193daee', 4),
       (6, '058da414-1f05-45a0-8938-2fbc1050e17e', 1),
       (6, 'bb13a34b-6ac8-47cb-9e91-47106a585fc1', 3),
       (6, '19c1417a-9719-46f6-8749-d92b93ce0529', 3),
       (6, '812d0462-0158-467f-951d-a7a121188a10', 3),
       (6, '993ade84-031f-4a3e-bd68-55f61b559248', 3),
       (6, '57695a9b-8f72-4ccc-a946-5d5037b09b8f', 3),
       (6, '4d305609-64f8-4f3f-bf67-cd5257f0d01e', 2),
       (6, 'a9262bf6-df6a-446c-ba70-18270a09842d', 4),
       (6, 'b74876d8-f6a6-4b47-b960-b01a331bab01', 2),
       (6, 'c74d4a57-0f66-4965-9ed7-f88a08aa1d15', 4),
       (6, '29957f49-9a6b-42f6-b2fb-b48f653ab725', 2),
       (6, 'dd7102d8-90b3-45a1-b66d-dcca469b1fb6', 3),
       (6, '17f61c01-0a41-4fa1-ac34-ffa83baad989', 1),
       (6, 'd1a4f502-86a9-49fb-9cb9-7918d13c5313', 1);


-- ============================================
-- GAMES DATA
-- ============================================

INSERT INTO GAMES (TYPE, DATE, PLACE, COUNTRY, STATUS)
VALUES ('STANDARD', '2024-11-01 14:00:00', 'Magic Arena Convention Center', 'USA', 'COMPLETED'),
       ('DRAFT', '2024-11-02 15:00:00', 'Local Game Store', 'Canada', 'COMPLETED'),
       ('STANDARD', '2024-11-08 18:00:00', 'Grand Prix London', 'UK', 'COMPLETED'),
       ('STANDARD', '2024-11-15 10:00:00', 'Friday Night Magic', 'USA', 'SCHEDULED'),
       ('DRAFT', '2024-11-20 19:00:00', 'Gaming Lounge Berlin', 'Germany', 'SCHEDULED');

-- ============================================
-- GAME_MATCHES DATA (OneToMany with GAMES)
-- Records individual matches between two players
-- ============================================

INSERT INTO GAME_MATCHES (GAME_ID, PLAYER_1_ID, PLAYER_2_ID, ROUND, RESULT, TIME_TAKEN)
VALUES
-- Game 1 matches (STANDARD tournament)
(1, 1, 2, 1, 'PLAYER_1_WIN', 45),
(1, 3, 4, 1, 'PLAYER_1_WIN', 38),
(1, 1, 3, 2, 'PLAYER_2_WIN', 52),
(1, 2, 5, 2, 'PLAYER_1_WIN', 35),

-- Game 2 matches (DRAFT tournament)
(2, 2, 3, 1, 'PLAYER_2_WIN', 42),
(2, 1, 5, 1, 'PLAYER_1_WIN', 48),
(2, 3, 1, 2, 'PLAYER_1_WIN', 55),

-- Game 3 matches (STANDARD Grand Prix)
(3, 1, 4, 1, 'PLAYER_1_WIN', 50),
(3, 2, 5, 1, 'PLAYER_2_WIN', 40),
(3, 3, 4, 1, 'PLAYER_1_WIN', 47),
(3, 1, 5, 2, 'PLAYER_2_WIN', 58),
(3, 3, 2, 2, 'PLAYER_1_WIN', 43);

-- ============================================
-- GAME_RESULTS DATA (Aggregated results)
-- OneToOne relationship with GAMES
-- Stores final rankings and scores for each player in a game
-- ============================================

INSERT INTO GAME_RESULTS (GAME_ID, PLAYER_ID, PLAYER_RANK, SCORES)
VALUES
-- Game 1 results
(1, 3, 1, 2),
(1, 1, 2, 1),
(1, 2, 3, 1),
(1, 4, 4, 0),
(1, 5, 5, 0),

-- Game 2 results
(2, 3, 1, 2),
(2, 1, 2, 1),
(2, 2, 3, 0),
(2, 5, 4, 0),

-- Game 3 results
(3, 5, 1, 2),
(3, 3, 2, 2),
(3, 1, 3, 1),
(3, 2, 4, 0),
(3, 4, 5, 0);

-- ============================================
-- VERIFICATION QUERIES
-- Run these to verify the data was inserted correctly
-- ============================================

-- Count records in each table
-- SELECT 'PLAYERS' as table_name, COUNT(*) as count FROM PLAYERS
-- UNION ALL
-- SELECT 'PLAYER_PROFILE', COUNT(*) FROM PLAYER_PROFILE
-- UNION ALL
-- SELECT 'CARDS', COUNT(*) FROM CARDS
-- UNION ALL
-- SELECT 'COLLECTIONS', COUNT(*) FROM COLLECTIONS
-- UNION ALL
-- SELECT 'DECKS', COUNT(*) FROM DECKS
-- UNION ALL
-- SELECT 'DECK_CARDS', COUNT(*) FROM DECK_CARDS
-- UNION ALL
-- SELECT 'GAMES', COUNT(*) FROM GAMES
-- UNION ALL
-- SELECT 'GAME_MATCHES', COUNT(*) FROM GAME_MATCHES
-- UNION ALL
-- SELECT 'GAME_RESULTS', COUNT(*) FROM GAME_RESULTS;

-- ============================================
-- EXAMPLE QUERIES TO TEST RELATIONSHIPS
-- ============================================

-- OneToOne: Get player with their profile
-- SELECT p.NAME, pp.NICKNAME, pp.POINTS, pp.COUNTRY
-- FROM PLAYERS p
-- JOIN PLAYER_PROFILE pp ON p.ID = pp.PLAYER_ID;

-- OneToMany: Get all decks for a player
-- SELECT p.NAME, d.NAME as DECK_NAME, d.COLORS, d.FORMAT
-- FROM PLAYERS p
-- JOIN DECKS d ON p.ID = d.PLAYER_ID
-- WHERE p.NAME = 'Alice Johnson';

-- ManyToMany: Get all cards in a player's collection
-- SELECT p.NAME, c.NAME as CARD_NAME, col.QUANTITY
-- FROM PLAYERS p
-- JOIN COLLECTIONS col ON p.ID = col.PLAYER_ID
-- JOIN CARDS c ON col.CARD_MTG_ID = c.MTG_ID
-- WHERE p.NAME = 'Charlie Davis';

-- ManyToMany: Get all cards in a deck (60 card deck)
-- SELECT d.NAME as DECK_NAME, c.NAME as CARD_NAME, dc.QUANTITY, c.TYPE
-- FROM DECKS d
-- JOIN DECK_CARDS dc ON d.ID = dc.DECK_ID
-- JOIN CARDS c ON dc.CARD_MTG_ID = c.MTG_ID
-- WHERE d.ID = 1
-- ORDER BY c.TYPE, c.NAME;

-- ============================================
-- END OF DML STATEMENTS
-- ============================================
