create table `product_id`(
    `product_id` VARCHAR(32) not null,
    `product_name` varchar(64) not null,
    `product_price` decimal(8, 2) not null,
    `product_stock` int not null,
    `product_description` varchar(64),
    `product_icon` varchar(512),
    `category_type` int not null,
    `create_time` timestamp not null default CURRENT_TIMESTAMP,
    `update_time` timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    primary key (`product_id`)
) comment 'product table'

create table `product_category`(
    `category_id` int not null auto_increment,
    `category_name` varchar(64) not null,
    `category_type` int not null,
    `create_time` timestamp not null default CURRENT_TIMESTAMP,
    `update_time` timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    primary key (`category_id`)
    unique key `uqe_category_type` (`category_type`)
)

create table `order_master` (
    `order_id` varchar(32) not null,
    `buyer_name` varchar(32) not null, 
    `buyer_phone` varchar(32) not null, 
    `buyer_address` varchar(128) not null,
    `buyer_openid` varchar(64) not null,
    `order_amount` decimal(8, 2) not null,
    `order_status` tinyint(3) not null default '0',
    `pay_status` tinyint(3) not null default '0'
    `create_time` timestamp not null default CURRENT_TIMESTAMP,
    `update_time` timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    primary key (`order_id`), 
    key `idx_buyer_openid` (`buyer_openid`)
)

create_table   `order_detail` (
    `detail_id` varchar(32) not null,
    `order_id` varchar(32) not null,
    `product_id` varchar(32) not null,
    `product_name` varchar(64) not null,
    `product_price` decimal(8, 2) not null, 
    `product_quantity` int not null,
    `product_icon` varchar(512)
    `create_time` timestamp not null default CURRENT_TIMESTAMP,
    `update_time` timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    primary key (`detail_id`),
    key `idx_order_id` (`order_id`)
)