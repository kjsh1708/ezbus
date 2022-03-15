use ezBusDB; 

-- Table 1 
insert into bus(bus_plate_number, model, bus_type, capacity)
values

("S00001", "BMW","Single-deck", 40), -- Bus 1, Plate Number S00001, Single-decker bus,can fit up to 40 passengers 
("S00002", "BMW", "Single-deck", 40), 
("S00003", "BYD", "Double-deck", 60), 
("S00004", "BYD", "Double-deck", 60), 
("S00005", "Mercedes", "Articulated", 60),
("S00006", "Mercedes", "Articulated", 60)
; 

-- Table 2
insert into bus_stop(bus_stop_location, is_interchange)
values

("SMU", FALSE),             -- Bus Stop 1, located at SMU, not an internchange 
("Yishun", TRUE),           -- 2
("City Hall", FALSE),       -- 3
("Jurong East", TRUE),      -- 4
("Serangoon", TRUE),        -- 5 
("Opposite NTU", FALSE)     -- 6
; 

-- Table 4 
insert into bus_route(peak_interval, regular_interval)
values

(5, 10), -- Bus Route 1, peak interval is 5 min 1 bus, regular interval is 10 minute bus
(10, 15) -- Bus Route 2, peak interval is 10 min 1 bus, regular interval is 15 minute 1 bus
; 

-- Table 5
insert into route_stop(route_id, bus_stop_id,stop_sequence)
values
(1, 2, 1), -- Bus Route 1, From Yishun - SMU - City Hall - Jurong East  
(1, 1, 2), 
(1, 3, 3), 
(1, 4, 4), 
(2, 4, 1), -- Bus Route 2, From Jurong East - Opposite NTU - City Hall - Serangoon 
(2, 6, 2), 
(2, 3, 3), 
(2, 5, 4)
; 

-- Table 3 
insert into arrivals (bus_id, bus_stop_id, date_time, duration, alight_number, onboard_number)
values
(1, 2, "2022-03-02 08:00:00", 60, 0, 20), 
-- Bus 1 come to bus stop 2 (Yishun Interchange) on 2022-03-02 08:00:00, waited 60s at the bay 
-- 0 passengers alights, 20 passengers onboard 
(1, 1, "2022-03-02 08:30:00", 30, 10, 5), 
(1, 3, "2022-03-02 08:40:00", 20, 10, 5), 
(1, 4, "2022-03-02 10:00:00", 60, 10, 0),

(2, 4, "2022-03-02 09:00:00", 60, 0, 30), 
(2, 6, "2022-03-02 09:20:00", 60, 20, 10), 
(2, 3, "2022-03-02 10:00:00", 60, 10, 10), 
(2, 5, "2022-03-02 11:00:00", 60, 20, 0) 
; 

-- Table 6
insert into schedule(bus_id, route_id, depart_time)
values
(1, 1, "08:00:00"), 
-- bus 1 serves route 1 and depart on 0800 everyday 
(3, 1, "08:05:00"), 
(5, 1, "08:10:00"), 

(2, 1, "08:00:00"), 
(4, 1, "08:10:00"), 
(6, 1, "08:20:00")
; 

-- Table 7 
insert into crowd_level (bus_stop_id, date_time, people_number)
values 
(2, "2022-03-02 08:00:00", 200), 
-- at bus stop 2, on 2022-03-02 at 0800Hrs, there are 200 passengers 
(1, "2022-03-03 09:00:00", 6)
; 