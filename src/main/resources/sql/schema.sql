CREATE SEQUENCE ACCOUNTS_ID_KEY_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ROLES_ID_KEY_SEQ START WITH 1 INCREMENT BY 1;

--user accounts
CREATE TABLE ACCOUNTS (
    ACCOUNT_ID      BIGINT PRIMARY KEY NOT NULL,
    PASSWORD        VARCHAR(255) NOT NULL,
    EMAIL           VARCHAR(255) NOT NULL,
    PHONE           VARCHAR(255) NOT NULL,
    ENABLED         CHAR(1) DEFAULT 'Y',
    CREATED_BY      VARCHAR(255) NOT NULL, 
    CREATED_DATE    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY      VARCHAR(255),
    UPDATED_DATE    TIMESTAMP
);

--roles table
CREATE TABLE ROLES (
	ROLE_ID         BIGINT PRIMARY KEY NOT NULL,
	ROLE_NAME       VARCHAR(255) NOT NULL,
	CREATED_BY      VARCHAR(255) NOT NULL,
    CREATED_DATE    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY      VARCHAR(255),
    UPDATED_DATE    TIMESTAMP
);

--accounts_roles table
CREATE TABLE ACCOUNTS_ROLES (
	ROLE_ID         BIGINT NOT NULL,
    ACCOUNT_ID      BIGINT NOT NULL,
    CREATED_DATE    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_DATE    TIMESTAMP,
    
    PRIMARY KEY (ROLE_ID, ACCOUNT_ID),
    CONSTRAINT fk_user_roles_id1 foreign key (ACCOUNT_ID) references ACCOUNTS (ACCOUNT_ID),
    CONSTRAINT fk_user_roles_id2 foreign key (ROLE_ID) references ROLES (ROLE_ID)
);

---oauth client details table
CREATE TABLE OAUTH_CLIENT_DETAILS (
  CLIENT_ID VARCHAR(256) PRIMARY KEY,
  RESOURCE_IDS VARCHAR(256),
  CLIENT_SECRET VARCHAR(256),
  SCOPE VARCHAR(256),
  AUTHORIZED_GRANT_TYPES VARCHAR(256),
  WEB_SERVER_REDIRECT_URI VARCHAR(256),
  AUTHORITIES VARCHAR(256),
  ACCESS_TOKEN_VALIDITY INTEGER,
  REFRESH_TOKEN_VALIDITY INTEGER,
  ADDITIONAL_INFORMATION VARCHAR(4096),
  AUTOAPPROVE VARCHAR(256)
);

--oauth client token
CREATE TABLE OAUTH_CLIENT_TOKEN (
  TOKEN_ID VARCHAR(256),
  TOKEN longvarbinary,
  AUTHENTICATION_ID VARCHAR(256) PRIMARY KEY,
  USER_NAME VARCHAR(256),
  CLIENT_ID VARCHAR(256)
);

--access tokens
CREATE TABLE OAUTH_ACCESS_TOKEN (
  TOKEN_ID VARCHAR(256),
  TOKEN longvarbinary,
  AUTHENTICATION_ID VARCHAR(256) PRIMARY KEY,
  USER_NAME VARCHAR(256),
  CLIENT_ID VARCHAR(256),
  AUTHENTICATION longvarbinary,
  REFRESH_TOKEN VARCHAR(256)
);

CREATE TABLE OAUTH_REFRESH_TOKEN (
  TOKENT_ID VARCHAR(256),
  TOKEN longvarbinary,
  AUTHENTICATION longvarbinary
);

CREATE TABLE OAUTH_CODE (
  CODE VARCHAR(256), 
  AUTHENTICATION longvarbinary
);

CREATE TABLE OAUTH_APPROVALS (
	USERID VARCHAR(256),
	CLIENTID VARCHAR(256),
	SCOPE VARCHAR(256),
	STATUS VARCHAR(10),
	EXPIRESAT TIMESTAMP,
	LASTMODIFIEDAT TIMESTAMP
);

-- customized oauth_client_details table
CREATE TABLE ClientDetails (
  APPID VARCHAR(256) PRIMARY KEY,
  RESOURCEIDS VARCHAR(256),
  APPSECRET VARCHAR(256),
  SCOPE VARCHAR(256),
  GRANTTYPES VARCHAR(256),
  REDIRECTURL VARCHAR(256),
  AUTHORITIES VARCHAR(256),
  ACCESS_TOKEN_VALIDITY INTEGER,
  REFRESH_TOKEN_VALIDITY INTEGER,
  ADDITIONALINFORMATION VARCHAR(4096),
  AUTOAPPROVESCOPES VARCHAR(256)
);