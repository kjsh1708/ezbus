drop database if exists ezBusDB; 
create database ezBusDB; 

use ezBusDB; 

-- Table 1
drop table if exists bus; 
create table bus(
    bus_id int not null auto_increment,
    bus_plate_number varchar(255),
    model varchar(255), 
    bus_type varchar(255), 
    capacity int, 

    constraint bus_pk primary key (bus_id)
);

-- Table 2
drop table if exists bus_stop; 
create table bus_stop(
    bus_stop_id int not null auto_increment, 
    bus_stop_location varchar(255), 
    is_interchange boolean, 

    constraint bus_stop_id primary key (bus_stop_id)
); 

-- Table 3
drop table if exists arrivals; 
create table arrivals(
    bus_id int not null, 
    bus_stop_id int not null,
    date_time datetime not null, 
    duration int, -- in seconds
    alight_number int, 
    onboard_number int, 
    
    constraint arrivals_pk primary key (bus_id, bus_stop_id, date_time), 
    constraint arrivals_fk1 foreign key (bus_id) references bus(bus_id), 
    constraint arrivals_fk2 foreign key (bus_stop_id) references bus_stop(bus_stop_id)
); 

-- Table 4 
drop table if exists bus_route; 
create table bus_route(
    route_id int not null auto_increment, 
    peak_interval int, 
    regular_interval int, 

    constraint bus_route_pk primary key (route_id)
);

-- Table 5
drop table if exists route_stop;
create table route_stop(
    route_id int not null,   
    bus_stop_id int not null, 
    stop_sequence int, 

    constraint route_stop_pk primary key (route_id, bus_stop_id, stop_sequence), 
    constraint route_stop_fk1 foreign key (route_id) references bus_route(route_id), 
    constraint route_stop_fk2 foreign key (bus_stop_id) references bus_stop(bus_stop_id)
);

-- Table 6
drop table if exists schedule;  
create table schedule(
    bus_id int not null, 
    route_id int not null, 
    depart_time time not null,

    constraint schedule_pk primary key (bus_id, route_id, depart_time), 
    constraint schedule_fk1 foreign key (route_id) references bus_route(route_id), 
    constraint schedule_fk2 foreign key (bus_id) references bus(bus_id)
);

--  Table 7 
create table crowd_level(
    bus_stop_id int not null, 
    date_time datetime not null, 
    people_number int, 

    constraint crowd_level_pk primary  key (bus_stop_id, date_time), 
    constraint crowd_level_fk1 foreign key (bus_stop_id) references bus_stop(bus_stop_id)
);