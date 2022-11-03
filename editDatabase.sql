/* courses */
ALTER TABLE courses DROP CONSTRAINT initial_station_fk;
ALTER TABLE courses ADD CONSTRAINT initial_station_fk 
    FOREIGN KEY (initial_station) REFERENCES stations (id) 
    ON DELETE CASCADE;

ALTER TABLE courses DROP CONSTRAINT final_station_fk;
ALTER TABLE courses ADD CONSTRAINT final_station_fk 
    FOREIGN KEY (final_station) REFERENCES stations (id)
    ON DELETE CASCADE;

 /* trips */
ALTER TABLE trips DROP CONSTRAINT course_fk;
ALTER TABLE trips ADD CONSTRAINT course_fk 
    FOREIGN KEY (course) REFERENCES courses (id)
    ON DELETE SET NULL;

/* passengers */
ALTER TABLE passengers DROP CONSTRAINT trip_fk;
ALTER TABLE passengers ADD CONSTRAINT trip_fk
    FOREIGN KEY (trip) REFERENCES trips (id)
    ON DELETE SET NULL