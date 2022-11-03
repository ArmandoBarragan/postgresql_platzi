CREATE TABLE stations(
    id SERIAL,
    station_name VARCHAR NOT NULL,
    station_address VARCHAR NOT NULL,
    
    CONSTRAINT station_pk PRIMARY KEY (id)
);

CREATE TABLE trains (
    id SERIAL,
    model VARCHAR,
    capacity INT NOT NULL,

    CONSTRAINT train_pk PRIMARY KEY(id)
);

CREATE TABLE courses (
    id SERIAL,
    initial_station INT NOT NULL,
    final_station INT NOT NULL,

    CONSTRAINT course_pk PRIMARY KEY (id),
    CONSTRAINT initial_station_fk FOREIGN KEY (initial_station)
        REFERENCES stations(id) ON DELETE CASCADE,
    CONSTRAINT final_station_fk FOREIGN KEY (final_station)
        REFERENCES stations(id) ON DELETE CASCADE
);

CREATE TABLE trips (
    id SERIAL,
    trip_date DATE NOT NULL,
    course INT NOT NULL,

    CONSTRAINT trip_pk PRIMARY KEY (id),
    CONSTRAINT course_fk FOREIGN KEY (course)
        REFERENCES courses(id) ON DELETE SET NULL
);

CREATE TABLE trip_reports (
    id SERIAL,
    trip_id INT,
    trip_date DATE
) PARTITION BY RANGE (trip_date);

CREATE TABLE passengers (
    id SERIAL,
    first_name VARCHAR,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    trip INT NOT NULL,
    
    CONSTRAINT passenger_pk PRIMARY KEY (id),
    CONSTRAINT trip_fk FOREIGN KEY (trip)
        REFERENCES trips(id) ON DELETE SET NULL
);

CREATE TABLE trip_reports2021 PARTITION OF trip_reports 
FOR VALUES FROM ('2021-01-01') TO ('2021-12-31');