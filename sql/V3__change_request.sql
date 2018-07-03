ALTER TABLE identifier ADD first_identifier VARCHAR(3) NULL;
ALTER TABLE identifier ADD second_identifier VARCHAR(3) NULL;
ALTER TABLE identifier ADD third_identifier VARCHAR(3) NULL;

UPDATE identifier SET first_identifier = SUBSTR(identifier,1,3);
UPDATE identifier SET second_identifier = SUBSTR(identifier,5,3);
UPDATE identifier SET third_identifier = SUBSTR(identifier,9,3);
