create database souq;
create table product(id serial primary key,Name text, description text, image text, price numeric(15,6) not null);
create table users(id serial primary key,first_name text,last_name  text, email text, password text not null,address text,role text, phone text);
create table purchase_item(id serial  primary key, product_id int references product(id), count int);
create table orders(id int primary key, user_id int references users(id),purchase_item_id int references purchase_item(id),address text,date date,total numeric(15,6));
