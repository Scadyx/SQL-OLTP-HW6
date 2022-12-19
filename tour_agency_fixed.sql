CREATE TABLE IF NOT EXISTS client(
    id int,
    mail varchar(50) NOT NULL,
    password text NOT NULL,
	sex varchar(10),
    first_name varchar(35) NOT NULL,
    last_name varchar(35) NOT NULL,
	phone_number varchar(35) NOT NULL,
    address varchar(100) NOT NULL,
	ur_country_passport varchar(100) NOT NULL,
	international_passport varchar(100) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    last_modified_at timestamp NOT NULL
);


CREATE TABLE IF NOT EXISTS country(
	id int,
	name_of_country varchar(100) NOT NULL,
	country_entertainment_rating varchar(10),
	description text NOT NULL,
	visa bool,
	created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS tour(
    id int,
    mail varchar(50) NOT NULL,
	country_id int NOT NULL,
    description text NOT NULL,
	price decimal NOT NULL,
	days_available int NOT NULL,
	meal_included bool NOT NULL,
	type varchar(50) NOT NULL,
	tour_date date NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS booking(
	id int,
	mail varchar(50) NOT NULL,
	client_id int NOT NULL,
	tour_id int NOT NULL,
	prepayment varchar(100)NOT NULL,
	payment varchar(100) NOT NULL,
	payment_id varchar(100) NOT NULL,
	amount decimal NOT NULL,
	created_at TIMESTAMP NOT NULL,
	last_modified_at timestamp NOT NULL
);


CREATE TABLE IF NOT EXISTS order_tour(
	id int,
	client_id int NOT NULL,
	tour_id int NOT NULL,
	quantity int NOT NULL,
	information text NOT NULL,
	created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL DEFAULT NOW()
);