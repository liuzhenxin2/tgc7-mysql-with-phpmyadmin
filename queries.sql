create table if not exists vets (
    vet_id int auto_increment primary key,
    fname varchar(100),
    lname varchar(100)
) engine = innodb;