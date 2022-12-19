CREATE TABLE IF NOT EXISTS customer(
    id serial PRIMARY KEY,
    mail varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
	phone varchar(100) NOT NULL,
    address varchar(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL
);


CREATE TABLE IF NOT EXISTS category(
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
    last_modified_at timestamp NOT NULL
);


CREATE TABLE IF NOT EXISTS product(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
	brand varchar(50),
    price decimal NOT NULL,
    description text NOT NULL,
    created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL DEFAULT NOW(),
	category_id bigint unsigned NOT NULL,
	CONSTRAINT fk_category
	    FOREIGN KEY (category_id)
	        REFERENCES category (id)
            ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS product_inventory(
    id serial PRIMARY KEY,
    quantity varchar(255) NOT NULL,
    created_at timestamp NOT NULL,
	price float NOT NULL,
	product_id bigint unsigned NOT NULL,
	CONSTRAINT fk_product
	    FOREIGN KEY (product_id)
	        REFERENCES product (id)
            ON DELETE CASCADE,
	last_modified_at timestamp NOT NULL DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS customer_payment(
	id serial PRIMARY KEY,
	customer_id int NOT NULL,
	payment_provider varchar(100) NOT NULL,
	payment_type varchar(100) NOT NULL,
	amount decimal NOT NULL,
	expiration date NOT NULL
);


CREATE TABLE IF NOT EXISTS order_detail(
	id serial PRIMARY KEY,
	user_id bigint unsigned NOT NULL,
	CONSTRAINT fk_customer
	    FOREIGN KEY (user_id)
	        REFERENCES customer (id)
            ON DELETE CASCADE,
	payment_id bigint unsigned NOT NULL,
	CONSTRAINT fk_payment
	    FOREIGN KEY (payment_id)
	        REFERENCES customer_payment (id)
            ON DELETE CASCADE,
	status varchar(255) NOT NULL,
	total_sum decimal NOT NULL,
	created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS order_item(
	id serial PRIMARY KEY,
	product_id bigint unsigned NOT NULL,
	CONSTRAINT fk_product_id
	    FOREIGN KEY (product_id)
	        REFERENCES product (id)
            ON DELETE CASCADE,
	order_id bigint unsigned NOT NULL,
	CONSTRAINT fk_order
	    FOREIGN KEY (order_id)
	        REFERENCES order_detail (id)
            ON DELETE CASCADE,
	quantity int NOT NULL,
	created_at timestamp NOT NULL DEFAULT NOW(),
    last_modified_at timestamp NOT NULL DEFAULT NOW()
);