CREATE TABLE cleaned_dish(
  "id" BIGINT NOT NULL,
  "name" TEXT,
  "menus_appeared" INTEGER,
  "times_appeared" INTEGER,
  "first_appeared" INTEGER,
  "last_appeared" INTEGER,
  "lowest_price" DOUBLE,
  "highest_price" DOUBLE,
   PRIMARY KEY (id)
);

CREATE TABLE cleaned_menu(
  "id" BIGINT NOT NULL,
  "name" TEXT,
  "sponsor" TEXT,
  "event" TEXT,
  "venue" TEXT,
  "place" TEXT,
  "physical_description_type" TEXT,
  "physical_description_details" TEXT,
  "occasion" TEXT,
  "notes" TEXT,
  "call_number" TEXT,
  "keywords" TEXT,
  "language" TEXT,
  "date_clean" DATETIME,
  "location" TEXT,
  "location_type" TEXT,
  "currency" TEXT,
  "currency_symbol" TEXT,
  "status" TEXT,
  "page_count" INTEGER,
  "dish_count" INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE cleaned_menupage(
  "id" BIGINT NOT NULL,
  "menu_id" BIGINT,
  "page_number" INTEGER,
  "image_id" INTEGER,
  "full_height" INTEGER,
  "full_width" INTEGER,
  "uuid" TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_id) REFERENCES cleaned_menu(id)
);

CREATE TABLE cleaned_menuitem(
  "id" BIGINT NOT NULL,
  "menu_page_id" BIGINT,
  "price" DOUBLE,
  "high_price" DOUBLE,
  "dish_id" BIGINT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "xpos" DOUBLE,
  "ypos" DOUBLE,
   PRIMARY KEY (id),
   FOREIGN KEY (dish_id) REFERENCES cleaned_dish(id),
   FOREIGN KEY (menu_page_id) REFERENCES cleaned_menupage(id)
);

CREATE TABLE raw_dish(
  "id" BIGINT NOT NULL,
  "name" TEXT,
  "description" TEXT,
  "menus_appeared" INTEGER,
  "times_appeared" INTEGER,
  "first_appeared" INTEGER,
  "last_appeared" INTEGER,
  "lowest_price" DOUBLE,
  "highest_price" DOUBLE,
   PRIMARY KEY (id)
);

CREATE TABLE raw_menu(
  "id" BIGINT NOT NULL,
  "name" TEXT,
  "sponsor" TEXT,
  "event" TEXT,
  "venue" TEXT,
  "place" TEXT,
  "physical_description" TEXT,
  "occasion" TEXT,
  "notes" TEXT,
  "call_number" TEXT,
  "keywords" TEXT,
  "language" TEXT,
  "date_clean" DATETIME,
  "location" TEXT,
  "location_type" TEXT,
  "currency" TEXT,
  "currency_symbol" TEXT,
  "status" TEXT,
  "page_count" INTEGER,
  "dish_count" INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE raw_menupage(
  "id" BIGINT NOT NULL,
  "menu_id" BIGINT,
  "page_number" INTEGER,
  "image_id" INTEGER,
  "full_height" INTEGER,
  "full_width" INTEGER,
  "uuid" TEXT,
  PRIMARY KEY (id)--,
  --FOREIGN KEY (menu_id) REFERENCES raw_menu(id)
);

CREATE TABLE raw_menuitem(
  "id" BIGINT NOT NULL,
  "menu_page_id" BIGINT,
  "price" DOUBLE,
  "high_price" DOUBLE,
  "dish_id" BIGINT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "xpos" DOUBLE,
  "ypos" DOUBLE,
   PRIMARY KEY (id)--,
   --FOREIGN KEY (dish_id) REFERENCES raw_dish(id),
   --FOREIGN KEY (menu_page_id) REFERENCES raw_menupage(id)
);