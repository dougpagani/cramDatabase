CREATE USER 'jeffrey'@'localhost'
  IDENTIFIED BY 'new_password' PASSWORD EXPIRE;

CREATE USER
  'jeffrey'@'localhost' IDENTIFIED BY 'new_password1',
  'jeanne'@'localhost' IDENTIFIED BY 'new_password2'
  REQUIRE X509 WITH MAX_QUERIES_PER_HOUR 60
  ACCOUNT LOCK;

CREATE USER 'jeffrey'@'localhost' REQUIRE SSL;

CREATE USER 'jeffrey'@'localhost' REQUIRE X509;

CREATE USER 'jeffrey'@'localhost'
  IDENTIFIED WITH sha256_password BY 'new_password'
  PASSWORD EXPIRE INTERVAL 180 DAY;