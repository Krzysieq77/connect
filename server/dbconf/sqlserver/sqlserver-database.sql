CREATE TABLE SCHEMA_INFO
	(VERSION NVARCHAR(40));

CREATE TABLE EVENT (
	ID INTEGER IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	DATE_CREATED DATETIME DEFAULT NULL,
	NAME NVARCHAR(MAX) NOT NULL,
	EVENT_LEVEL NVARCHAR(40) NOT NULL,
	OUTCOME NVARCHAR(40) NOT NULL,
	ATTRIBUTES NVARCHAR(MAX),
	USER_ID INTEGER NOT NULL,
	IP_ADDRESS NVARCHAR(40),
	SERVER_ID NVARCHAR(36)
);

CREATE TABLE CHANNEL (
	ID NVARCHAR(36) NOT NULL PRIMARY KEY,
	NAME NVARCHAR(40) NOT NULL,
	REVISION INTEGER,
	CHANNEL NVARCHAR(MAX)
);

CREATE TABLE SCRIPT (
	GROUP_ID NVARCHAR(40) NOT NULL,
	ID NVARCHAR(40) NOT NULL,
	SCRIPT NVARCHAR(MAX),
	PRIMARY KEY(GROUP_ID, ID)
);

CREATE TABLE PERSON (
	ID INTEGER IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	USERNAME NVARCHAR(40) NOT NULL,
	FIRSTNAME NVARCHAR(40),
	LASTNAME NVARCHAR(40),
	ORGANIZATION NVARCHAR(255),
	INDUSTRY NVARCHAR(255),
	EMAIL NVARCHAR(255),
	PHONENUMBER NVARCHAR(40),
	DESCRIPTION NVARCHAR(255),
	LAST_LOGIN DATETIME DEFAULT NULL,
	GRACE_PERIOD_START DATETIME DEFAULT NULL,
	STRIKE_COUNT INTEGER,
	LAST_STRIKE_TIME DATETIME DEFAULT NULL,
	LOGGED_IN BIT NOT NULL
);

CREATE TABLE PERSON_PREFERENCE (
	PERSON_ID INTEGER NOT NULL,
	NAME NVARCHAR(255) NOT NULL,
	VALUE NVARCHAR(MAX)
);

ALTER TABLE PERSON_PREFERENCE ADD CONSTRAINT PERSON_ID_PERSON_PREF_FK FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID) ON DELETE CASCADE;

CREATE INDEX PERSON_PREFERENCE_INDEX1 ON PERSON_PREFERENCE(PERSON_ID);

CREATE TABLE PERSON_PASSWORD (
	PERSON_ID INTEGER NOT NULL,
	PASSWORD NVARCHAR(255) NOT NULL,
	PASSWORD_DATE DATETIME DEFAULT NULL
);

ALTER TABLE PERSON_PASSWORD ADD CONSTRAINT PERSON_ID_PP_FK FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID) ON DELETE CASCADE;

CREATE TABLE ALERT (
	ID NVARCHAR(36) NOT NULL PRIMARY KEY,
	NAME NVARCHAR(255) NOT NULL UNIQUE,
	ALERT NVARCHAR(MAX) NOT NULL
);

CREATE TABLE CODE_TEMPLATE_LIBRARY (
	ID NVARCHAR(255) NOT NULL PRIMARY KEY,
	NAME NVARCHAR(255) NOT NULL UNIQUE,
	REVISION INTEGER,
	LIBRARY NVARCHAR(MAX)
);

CREATE TABLE CODE_TEMPLATE (
	ID NVARCHAR(255) NOT NULL PRIMARY KEY,
	NAME NVARCHAR(255) NOT NULL,
	REVISION INTEGER,
	CODE_TEMPLATE NVARCHAR(MAX)
);

CREATE TABLE CONFIGURATION (
	CATEGORY NVARCHAR(255) NOT NULL,
	NAME NVARCHAR(255) NOT NULL,
	VALUE NVARCHAR(MAX),
	PRIMARY KEY(CATEGORY, NAME)
);

CREATE TABLE CHANNEL_GROUP(
	ID NVARCHAR(255) NOT NULL PRIMARY KEY,
	NAME NVARCHAR(255) NOT NULL UNIQUE,
	REVISION INTEGER,
	CHANNEL_GROUP NVARCHAR(MAX)
);

INSERT INTO PERSON (USERNAME, LOGGED_IN) VALUES('admin', 0);

INSERT INTO PERSON_PASSWORD (PERSON_ID, PASSWORD) VALUES(1, 'YzKZIAnbQ5m+3llggrZvNtf5fg69yX7pAplfYg0Dngn/fESH93OktQ==');

INSERT INTO SCHEMA_INFO (VERSION) VALUES ('3.9.0');

INSERT INTO CONFIGURATION (CATEGORY, NAME, VALUE) VALUES ('core', 'stats.enabled', '1');

INSERT INTO CONFIGURATION (CATEGORY, NAME, VALUE) VALUES ('core', 'server.resetglobalvariables', '1');

INSERT INTO CONFIGURATION (CATEGORY, NAME, VALUE) VALUES ('core', 'smtp.timeout', '5000');

INSERT INTO CONFIGURATION (CATEGORY, NAME, VALUE) VALUES ('core', 'smtp.auth', '0');

INSERT INTO CONFIGURATION (CATEGORY, NAME, VALUE) VALUES ('core', 'smtp.secure', '0');

INSERT INTO CONFIGURATION (CATEGORY, NAME, VALUE) VALUES ('core', 'server.queuebuffersize', '1000');
