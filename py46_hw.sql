
create table if not exists Artists (
Artist_ID serial primary key,
Artist_name varchar(100) not null unique
);

create table if not exists Albums (
Album_ID serial primary key,
Album_name varchar(100) not null,
Release_date integer
);

create table if not exists Tracks (
Track_ID serial primary key,
Track_name varchar(100) not null,
Duration integer,
Album_ID integer references Albums(Album_ID)
);

create table if not exists Genres (
Genre_ID serial primary key,
Genre_name varchar(100) not null unique
);

create table if not exists Collections (
Collection_ID serial primary key,
Collection_name varchar(100) not null,
Release_date integer
);

create table if not exists Albums_Artists (
Album_ID integer references Albums(Album_ID),
Artist_ID integer references Artists(Artist_ID),
constraint pk primary key (Album_ID, Artist_ID)
);

create table if not exists Collections_Tracks (
Collection_ID integer references Collections(Collection_ID),
Track_ID integer references Tracks(Track_ID),
constraint pk2 primary key (Collection_ID, Track_ID)
);

create table if not exists Genres_Artists (
Genre_ID integer references Genres(Genre_ID),
Artist_ID integer references Artists(Artist_ID),
constraint pk3 primary key (Genre_ID, Artist_ID)
);

create table if not exists Tracks_Artists (
Track_ID integer references Tracks(Track_ID),
Artist_ID integer references Artists(Artist_ID),
constraint pk4 primary key (Track_ID, Artist_ID)
);