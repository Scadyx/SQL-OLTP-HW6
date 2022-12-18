CREATE TABLE IF NOT EXISTS users_pm(
                id serial PRIMARY KEY,
                name varchar(50) NOT NULL,
                last_name varchar(50) NOT NULL,
                time_created timestamp NOT NULL,
                gender varchar(15) NOT NULL,
                age int NOT NULL,
                city varchar(50) NOT NULL,
                birth_day varchar(50) NOT NULL,
                premium boolean,
                ip varchar(100) NOT NULl,
                balance float NOT NULL);

 CREATE TABLE IF NOT EXISTS events(
                id serial PRIMARY KEY,
                type varchar(50) NOT NULL,
                team_1 varchar(50) NOT NULL,
                team_2 varchar(50) NOT NULL,
                score varchar(50) NOT NULL,
                event_date timestamp NOT NULL,
                last_modified_time timestamp NOT NULL,
                team_1_coef decimal NOT NULL,
                team_2_coef decimal NOT NULL,
                draw_coef decimal NOT NULL,
                state varchar(50) CHECK (state in('created', 'active', 'finished')) NOT NULL);

CREATE TABLE IF NOT EXISTS bets(
                id serial PRIMARY KEY,
                date_created timestamp NOT NULL,
                user_id int NOT NULL,
                event_id int NOT NULL,
				CONSTRAINT fk_user
                	FOREIGN KEY (user_id)
                    	REFERENCES users_pm (id)
                    	ON DELETE CASCADE,
				CONSTRAINT fk_event
                	FOREIGN KEY (event_id)
                    	REFERENCES events (id)
                    	ON DELETE CASCADE,
                market varchar(50) CHECK (market in('team_1', 'team_2', 'draw')) NOT NULL,
                amount_of_money decimal NOT NULL,
                currency varchar(15) NOT NULL,
                state varchar(50) CHECK (state in ('win', 'lose', 'winning', 'losing')) NOT NULL);