class Similarity < ActiveRecord::Migration[6.0]
  def self.up
    execute <<-SQL
CREATE FUNCTION SIMILARITY(s1 VARCHAR(255) CHARACTER SET utf8, s2 VARCHAR(255) CHARACTER SET utf8)
  RETURNS DOUBLE
  DETERMINISTIC
  BEGIN
    DECLARE s1_len, s2_len, smax INT;
    DECLARE c DOUBLE;
    DECLARE s1_char CHAR CHARACTER SET utf8;
    -- max strlen=255 for this function

    SET s1_len = CHAR_LENGTH(s1) + 1,
        s2_len = CHAR_LENGTH(s2) + 1,
	smax = 0,
        c = 0;

    IF (s1_len < s2_len) THEN
        SET smax = s2_len;
    ELSEIF (s1_len >= s2_len) THEN
        SET smax = s1_len;
    END IF;
    SET c = 1.0 - (levenshtein(s1,s2) / smax );

    RETURN (c);
  END 
    SQL
  end

  def self.down
    execute "DROP PROCEDURE SIMILARITY;"
  end
end
