create database project_graduate;
use project_graduate;
create table role(
	id bigint not null primary key auto_increment,
    name varchar(255) not null,
    code varchar(255) not null,
    createddate timestamp null,
    modifieddate timestamp null,
    createdby varchar(255) null,
    modifiedby varchar(255) null
);
create table user(
	id bigint not null primary key auto_increment,
    username varchar(150) not null,
    password varchar(150) not null,
    fullname varchar(255) not null,
    phone varchar(255) not null,
    email varchar(255) null,
    status int not null,
    roleid bigint not null,
     createddate timestamp null,
    modifieddate timestamp null,
    createdby varchar(255) null,
    modifiedby varchar(255) null
);
alter table user add constraint fk_user_role foreign key (roleid) references role(id);
create table category(
	id bigint not null primary key auto_increment,
    name varchar(255) not null,
    code varchar(255) not null,
     createddate timestamp null,
    modifieddate timestamp null,
    createdby varchar(255) null,
    modifiedby varchar(255) null
);

create table product(
	id bigint not null primary key auto_increment,
	name varchar(255) not null,
	origin_price int not null,
	sale_price int not null,
    image varchar(255) not null,
    brand varchar(255) null, -- nhan hieu
    categoryid bigint not null,
    wire_type varchar(255) null, -- loai day
    status varchar(255),
    glass_surface varchar(255),  -- mat kinh
    material_case varchar(255), -- chat lieu vo
    size varchar(255), 
    guarantee varchar(255), -- bao hanh
    trademark varchar(255), -- thuong hieu
    sex varchar(255),
    createddate timestamp null,
    modifieddate timestamp null,
    createdby varchar(255) null,
    modifiedby varchar(255) null
);
alter table product add constraint fk_product_category foreign key (categoryid) references category(id);
create table news(
	id bigint not null primary key auto_increment,
    title varchar(255) not null,
    thumbnail varchar(255) not null,
    categoryid bigint not null,
    shortdesciption text null,
    content text null,   
    createddate timestamp null,
    modifieddate timestamp null,
    createdby varchar(255) null,
    modifiedby varchar(255) null
);
alter table news add constraint fk_news_category foreign key (categoryid) references category(id);
create table cart(
	id bigint primary key auto_increment,
	userid bigint not null,
	status varchar(255) not null,
	buyDate timestamp null
);
alter table cart add constraint fk_cart_user foreign key (userid) references user(id);
create table cartitem(
	id bigint primary key auto_increment,
	quantity int,
	unitPrice float,
	productid bigint not null,
	cartid bigint not null
);
alter table cartitem add constraint fk_cartitem_product foreign key (productid) references product(id);
alter table cartitem add constraint fk_cartitem_cart foreign key (cartid) references cart(id);







