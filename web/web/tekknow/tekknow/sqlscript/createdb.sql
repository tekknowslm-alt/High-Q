drop DATABASE /*!32312 IF EXISTS*/ `trade`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `trade`;
grant all privileges on *.* to 'trade'@'localhost' identified by 'trade';

grant all privileges on *.* to 'trade'@'localhost.localdomain' identified by 'trade';
