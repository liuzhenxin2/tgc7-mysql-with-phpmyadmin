create table if not exists vets (
    vet_id int unsigned auto_increment primary key,
    fname varchar(100) not null,
    lname varchar(100) not null,
) engine = innodb;

create table if not exists medicines(
    `medicine_id` int unsigned auto_increment primary key,
    `name` varchar(100),
    `description` text
) engine = innodb;

/* inserting data */
/* don't specify the vet_id because it is set to auto_increment
i.e it will be automatically set */
insert into vets (fname, lname) values("William", "Tan");


/* see all rows from a table */
select * from vets;

/* want to see all the columns in a table */
describe pet_owners;

/* to delete table, use drop */
drop table vets;

/* if we want insert multiple, we have one set of value for each rows */
insert into vets (fname, lname) values ("William", "Tan"), ("Ashely", "Wong"), ("David", "Teo");

insert into pet_owners (fname, lname, email) values ("Andy", "Chua", "andy@abc.com");

/* update: */
update pet_owners set email="andy@gmail.com" where pet_owner_id=1;

/* delete */
delete from pet_owners where pet_owner_id=1;

/* alter existing table */
alter table pet_owners add contact_number varchar(20) not null;
alter table vets modify fname varchar(255) not null;
alter table vets modify lname varchar(255) not null;

/* remove columns */
alter table pet_owners drop contact_number;

/* add a phone number to vet, is required (complusory) and if does not exist for some reasons, set the default to n/a */
alter table vets add contact_number varchar(20) not null default "n/a";

/* How to put in the FK if the table already exists */
/* create the pets table first */
create table pets (
    pet_id int unsigned primary key auto_increment,
    name varchar(50) not null
) engine=InnoDB;
/* Add a foreign key from pets to pet_owners*/
alter table pets add pet_owner_id int unsigned;
alter table pets add constraint fk_pet_owner_id foreign key (pet_owner_id) references pet_owners(pet_owner_id);
/* insert a new pet */
insert into pets  (name, pet_owner_id) values ("Fluffy", 2);

/*Create table with FKs */
create table shifts (
    shift_id int unsigned primary key auto_increment,
    day tinyint not null,
    start time not null,
    end time not null,
    vet_id int unsigned,
    foreign key(vet_id) 
        references vets (vet_id) on delete set null

) engine=InnoDB;

/* insert shift for the vet */
insert into shifts (day, start, end, vet_id) values (1, '17:00', '19:00', 1 );

create table appointments (
    appointment_id int unsigned primary key auto_increment,
    customer_id int unsigned not null,
    foreign key (customer_id) references pet_owners (pet_owner_id) on delete restrict,
    pet_id int unsigned not null,
    foreign key (pet_id) references pets (pet_id),
    vet_id int unsigned not null,
    foreign key (vet_id) references vets (vet_id),
    `datetime` datetime not null
) engine =InnoDB;

/* modify the table to point to itself */
alter table appointments add preceding_appointment_id int unsigned;
alter table appointments add constraint fk_preceding_appointment_id 
    foreign key (preceding_appointment_id)  references appointments(appointment_id);
