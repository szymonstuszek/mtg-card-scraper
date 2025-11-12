-- ============================================
-- Magic the Gathering API - Database Schema
-- PostgreSQL DDL Statements
-- ============================================

-- Drop existing tables (if any)
DROP TABLE IF EXISTS game_results CASCADE;
DROP TABLE IF EXISTS game_matches CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS deck_cards CASCADE;
DROP TABLE IF EXISTS decks CASCADE;
DROP TABLE IF EXISTS collections CASCADE;
DROP TABLE IF EXISTS card_prices CASCADE;
DROP TABLE IF EXISTS cards CASCADE;
DROP TABLE IF EXISTS player_profile CASCADE;
DROP TABLE IF EXISTS players CASCADE;

-- Drop existing types (if any)
DROP TYPE IF EXISTS game_type_enum CASCADE;
DROP TYPE IF EXISTS game_status_enum CASCADE;
DROP TYPE IF EXISTS match_result_enum CASCADE;

-- ============================================
-- ENUMS
-- ============================================

CREATE TYPE GAME_TYPE_ENUM AS ENUM ('STANDARD', 'DRAFT');

CREATE TYPE GAME_STATUS_ENUM AS ENUM (
    'SCHEDULED',
    'IN_PROGRESS',
    'COMPLETED',
    'CANCELLED'
);

CREATE TYPE MATCH_RESULT_ENUM AS ENUM (
    'PLAYER_1_WIN',
    'PLAYER_2_WIN',
    'DRAW'
);

-- ============================================
-- PLAYERS TABLE
-- ============================================

CREATE TABLE PLAYERS (
    ID BIGSERIAL PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- PLAYER_PROFILE TABLE (OneToOne with PLAYERS)
-- ============================================

CREATE TABLE PLAYER_PROFILE (
    PLAYER_ID BIGINT PRIMARY KEY,
    NICKNAME VARCHAR(100) UNIQUE,
    AGE INTEGER CHECK (AGE > 0 AND AGE < 999),
    COUNTRY VARCHAR(100),
    POINTS INTEGER DEFAULT 0,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_PLAYER_PROFILE_PLAYER
        FOREIGN KEY (PLAYER_ID)
        REFERENCES PLAYERS(ID)
        ON DELETE CASCADE
);

-- ============================================
-- CARDS TABLE
-- ============================================

CREATE TABLE CARDS (
    ID BIGSERIAL PRIMARY KEY,
    MTG_ID VARCHAR(100) NOT NULL UNIQUE,
    NAME VARCHAR(255) NOT NULL,
    IMAGE_URI TEXT,
    MANA_COST VARCHAR(50),
    TYPE VARCHAR(255),
    RULES TEXT,
    POWER INTEGER,
    TOUGHNESS INTEGER,
    SET_NAME VARCHAR(250),
    RARITY VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_cards_mtg_id ON cards(mtg_id);
-- CREATE INDEX idx_cards_name ON cards(name);
-- CREATE INDEX idx_cards_set_name ON cards(set_name);

-- ============================================
-- CARD_PRICES TABLE (OneToMany with CARDS)
-- ============================================

CREATE TABLE CARD_PRICES (
    ID BIGSERIAL PRIMARY KEY,
    MTG_ID VARCHAR(100) NOT NULL,
    DATE DATE NOT NULL,
    PRICE_USD DECIMAL(10, 2),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_CARD_PRICES_CARD
        FOREIGN KEY (MTG_ID) 
        REFERENCES CARDS(MTG_ID) 
        ON DELETE CASCADE
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_card_prices_mtg_id ON card_prices(mtg_id);
-- CREATE INDEX idx_card_prices_date ON card_prices(date);

-- ============================================
-- COLLECTIONS TABLE (ManyToMany: PLAYERS <-> CARDS)
-- ============================================

CREATE TABLE COLLECTIONS (
    ID BIGSERIAL PRIMARY KEY,
    PLAYER_ID BIGINT NOT NULL,
    CARD_MTG_ID VARCHAR(100) NOT NULL,
    QUANTITY SMALLINT NOT NULL DEFAULT 1 CHECK (QUANTITY > 0),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_COLLECTIONS_PLAYER
        FOREIGN KEY (PLAYER_ID)
        REFERENCES PLAYERS(ID)
        ON DELETE CASCADE,
    CONSTRAINT FK_COLLECTIONS_CARD
        FOREIGN KEY (CARD_MTG_ID)
        REFERENCES CARDS(MTG_ID)
        ON DELETE CASCADE,
    CONSTRAINT UNIQUE_PLAYER_CARD UNIQUE (PLAYER_ID, CARD_MTG_ID)
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_collections_player_id ON collections(player_id);
-- CREATE INDEX idx_collections_card_mtg_id ON collections(card_mtg_id);

-- ============================================
-- DECKS TABLE (OneToMany with PLAYERS)
-- ============================================


CREATE TABLE DECKS (
    ID BIGSERIAL PRIMARY KEY,
    PLAYER_ID BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COLORS TEXT[],
    FORMAT VARCHAR(100),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_DECKS_PLAYER
        FOREIGN KEY (PLAYER_ID)
        REFERENCES PLAYERS(ID)
        ON DELETE CASCADE
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_decks_player_id ON decks(player_id);
-- CREATE INDEX idx_decks_format ON decks(format);

-- ============================================
-- DECK_CARDS TABLE (ManyToMany: DECKS <-> CARDS)
-- ============================================

CREATE TABLE DECK_CARDS (
    ID BIGSERIAL PRIMARY KEY,
    DECK_ID BIGINT NOT NULL,
    CARD_MTG_ID VARCHAR(100) NOT NULL,
    QUANTITY INTEGER NOT NULL DEFAULT 1 CHECK (QUANTITY > 0),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_DECK_CARDS_DECK
        FOREIGN KEY (DECK_ID)
        REFERENCES DECKS(ID)
        ON DELETE CASCADE,
    CONSTRAINT FK_DECK_CARDS_CARD
        FOREIGN KEY (CARD_MTG_ID)
        REFERENCES CARDS(MTG_ID)
        ON DELETE CASCADE,
    CONSTRAINT UNIQUE_DECK_CARD UNIQUE (DECK_ID, CARD_MTG_ID)
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_deck_cards_deck_id ON deck_cards(deck_id);
-- CREATE INDEX idx_deck_cards_card_mtg_id ON deck_cards(card_mtg_id);

-- ============================================
-- GAMES TABLE
-- ============================================

CREATE TABLE GAMES (
    ID BIGSERIAL PRIMARY KEY,
    TYPE GAME_TYPE_ENUM NOT NULL,
    DATE TIMESTAMP NOT NULL,
    PLACE VARCHAR(255),
    COUNTRY VARCHAR(100),
    STATUS GAME_STATUS_ENUM NOT NULL DEFAULT 'SCHEDULED',
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_games_type ON games(type);
-- CREATE INDEX idx_games_date ON games(date);
-- CREATE INDEX idx_games_status ON games(status);

-- ============================================
-- GAME_MATCHES TABLE (OneToMany with GAMES)
-- ============================================

CREATE TABLE GAME_MATCHES (
    ID BIGSERIAL PRIMARY KEY,
    GAME_ID BIGINT NOT NULL,
    PLAYER_1_ID BIGINT NOT NULL,
    PLAYER_2_ID BIGINT NOT NULL,
    ROUND INTEGER NOT NULL CHECK (ROUND > 0),
    RESULT MATCH_RESULT_ENUM,
    TIME_TAKEN SMALLINT,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_GAME_MATCHES_GAME
        FOREIGN KEY (GAME_ID)
        REFERENCES GAMES(ID)
        ON DELETE CASCADE,
    CONSTRAINT FK_GAME_MATCHES_PLAYER_1
        FOREIGN KEY (PLAYER_1_ID)
        REFERENCES PLAYERS(ID)
        ON DELETE CASCADE,
    CONSTRAINT FK_GAME_MATCHES_PLAYER_2
        FOREIGN KEY (PLAYER_2_ID)
        REFERENCES PLAYERS(ID)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_DIFFERENT_PLAYERS CHECK (PLAYER_1_ID != PLAYER_2_ID)
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_game_matches_game_id ON game_matches(game_id);
-- CREATE INDEX idx_game_matches_player_1_id ON game_matches(player_1_id);
-- CREATE INDEX idx_game_matches_player_2_id ON game_matches(player_2_id);

-- ============================================
-- GAME_RESULTS TABLE (OneToOne with GAMES)
-- Aggregates results from GAME_MATCHES
-- ============================================

CREATE TABLE GAME_RESULTS (
    ID BIGSERIAL PRIMARY KEY,
    GAME_ID BIGINT NOT NULL,
    PLAYER_ID BIGINT NOT NULL,
    PLAYER_RANK INTEGER NOT NULL CHECK (PLAYER_RANK > 0),
    SCORES INTEGER NOT NULL DEFAULT 0,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_GAME_RESULTS_GAME
        FOREIGN KEY (GAME_ID)
        REFERENCES GAMES(ID)
        ON DELETE CASCADE,
    CONSTRAINT FK_GAME_RESULTS_PLAYER
        FOREIGN KEY (PLAYER_ID)
        REFERENCES PLAYERS(ID)
        ON DELETE CASCADE,
    CONSTRAINT UNIQUE_GAME_PLAYER UNIQUE (GAME_ID, PLAYER_ID)
);

-- commenting out indexes for now - I will apply them later
-- CREATE INDEX idx_game_results_game_id ON game_results(game_id);
-- CREATE INDEX idx_game_results_player_id ON game_results(player_id);

-- ============================================
-- COMMENTS ON TABLES
-- ============================================

COMMENT ON TABLE players IS 'Stores basic player information';
COMMENT ON TABLE player_profile IS 'OneToOne relationship with players - stores additional player details';
COMMENT ON TABLE cards IS 'Stores Magic the Gathering card information';
COMMENT ON TABLE card_prices IS 'OneToMany relationship with cards - tracks historical card prices';
COMMENT ON TABLE collections IS 'ManyToMany relationship - tracks which cards players own and quantity';
COMMENT ON TABLE decks IS 'OneToMany relationship with players - stores player decks';
COMMENT ON TABLE deck_cards IS 'ManyToMany relationship - tracks which cards are in which decks and quantity';
COMMENT ON TABLE games IS 'Stores game/tournament information';
COMMENT ON TABLE game_matches IS 'OneToMany relationship with games - stores individual matches between two players';
COMMENT ON TABLE game_results IS 'Aggregates results from game_matches - stores final rankings and scores';

-- ============================================
-- END OF DDL STATEMENTS
-- ============================================

