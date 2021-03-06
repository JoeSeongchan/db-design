CREATE TABLE seller (
  seller_business_number CHAR(10) PRIMARY KEY,
  business_name VARCHAR(15) NOT NULL UNIQUE,
  representative_name VARCHAR(15) NOT NULL,
  email VARCHAR(30) NOT NULL,
  company_location VARCHAR(50) NOT NULL
);

CREATE TABLE shopping_mall (
  shopping_mall_domain VARCHAR(20) PRIMARY KEY,
  shopping_mall_name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE store (
  shopping_mall_domain VARCHAR(20),
  store_name VARCHAR(20),
  seller_business_number CHAR(10),
  PRIMARY KEY (shopping_mall_domain, store_name),
  FOREIGN KEY (shopping_mall_domain) REFERENCES shopping_mall (shopping_mall_domain),
  FOREIGN KEY (seller_business_number) REFERENCES seller(seller_business_number)
);

CREATE TABLE goods (
  model_name VARCHAR(20) PRIMARY KEY,
  category VARCHAR (15) NOT NULL,
  manufacturer VARCHAR(15) NOT NULL,
  release_date DATE,
  product_weight DECIMAL(2, 1) UNSIGNED NOT NULL,
  price INT UNSIGNED NOT NULL
);

CREATE TABLE sells (
  shopping_mall_domain VARCHAR(20),
  store_name VARCHAR(20),
  model_name VARCHAR(20),
  PRIMARY KEY (shopping_mall_domain, store_name, model_name)
);

CREATE TABLE old_price (
  model_name VARCHAR(20),
  measurement_date DATE,
  price INT UNSIGNED NOT NULL,
  PRIMARY KEY (model_name, measurement_date),
  FOREIGN KEY (model_name) REFERENCES goods(model_name)
);

CREATE TABLE laptop (
  model_name VARCHAR(20),
  operating_system VARCHAR(10) NOT NULL,
  color VARCHAR(10) NOT NULL,
  screen_size_inch DECIMAL(3, 1) NOT NULL,
  processor_brand VARCHAR(10) NOT NULL,
  core_count TINYINT(2) NOT NULL,
  hard_drive_size INT UNSIGNED NOT NULL,
  ram_size INT UNSIGNED NOT NULL,
  PRIMARY KEY (model_name),
  FOREIGN KEY (model_name) REFERENCES goods(model_name)
);

CREATE TABLE account (
  a_id VARCHAR(12) PRIMARY KEY,
  pwd VARCHAR(12) NOT NULL
);

CREATE TABLE customer (
  c_id VARCHAR(12) PRIMARY KEY,
  a_id VARCHAR(12) NOT NULL,
  sign_up_date DATE NOT NULL,
  c_name VARCHAR(20) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
  nickname VARCHAR(12) NOT NULL UNIQUE,
  c_address VARCHAR(45) NOT NULL,
  email VARCHAR(10) NOT NULL,
  FOREIGN KEY (a_id) REFERENCES account(a_id)
);

CREATE TABLE buys(
  c_id VARCHAR(12),
  shopping_mall_domain VARCHAR(20),
  store_name VARCHAR(20),
  model_name VARCHAR(20),
  buy_date DATE NOT NULL,
  quantity INT UNSIGNED NOT NULL,
  PRIMARY KEY (
    c_id,
    shopping_mall_domain,
    store_name,
    model_name
  ),
  FOREIGN KEY (c_id) REFERENCES customer(c_id),
  FOREIGN KEY (shopping_mall_domain, store_name, model_name) REFERENCES sells(shopping_mall_domain, store_name, model_name)
);

CREATE TABLE review (
  c_id VARCHAR(12),
  shopping_mall_domain VARCHAR(20),
  store_name VARCHAR(20),
  model_name VARCHAR(20),
  registeration_time DATE,
  contents VARCHAR(100) NOT NULL,
  rating DECIMAL(2, 1) NOT NULL,
  PRIMARY KEY(
    c_id,
    shopping_mall_domain,
    store_name,
    model_name,
    registeration_time
  ),
  FOREIGN KEY (
    c_id,
    shopping_mall_domain,
    store_name,
    model_name
  ) REFERENCES buys(
    c_id,
    shopping_mall_domain,
    store_name,
    model_name
  )
);

CREATE TABLE window_shopping (
  c_id VARCHAR(12),
  model_name VARCHAR(20),
  last_seen_date DATE,
  seen_count INT UNSIGNED NOT NULL,
  PRIMARY KEY (c_id, model_name),
  FOREIGN KEY (c_id) REFERENCES customer(c_id),
  FOREIGN KEY (model_name) REFERENCES goods(model_name)
);