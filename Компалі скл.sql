CREATE TABLE `Employee` (
	`employee_id` INT NOT NULL AUTO_INCREMENT,
	`user_name` VARCHAR(255) NOT NULL,
	`first_name` VARCHAR(255) NOT NULL,
	`last_name` VARCHAR(255) NOT NULL,
	`position` VARCHAR(255) NOT NULL,
	`employment_date` DATE NOT NULL,
	`department_id` INT NOT NULL,
	`manager_id` INT NOT NULL,
	`rate` DECIMAL(10,2) NOT NULL,
	`bonus` DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `Department` (
	`department_id` INT NOT NULL AUTO_INCREMENT,
	`department_name` VARCHAR(255) NOT NULL,
	`city` VARCHAR(255) NOT NULL,
	`street` VARCHAR(255) NOT NULL,
	`building_no` bool NOT NULL,
	PRIMARY KEY (`department_id`)
);

CREATE TABLE `Customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(255) NOT NULL,
	`last_name` VARCHAR(255) NOT NULL,
	`gender` VARCHAR(255) NOT NULL,
	`birth_date` DATE NOT NULL,
	`phone_number` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`discount` DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Product` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`product_name` VARCHAR(255) NOT NULL,
	`product_description` TEXT NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	`manufacture` VARCHAR(255) NOT NULL,
	`product_type` VARCHAR(255) NOT NULL,
	`amount` INT NOT NULL,
	`price` DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `Orders` (
	`orders_id` INT NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
	`transaction_type` VARCHAR(255) NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`amount` INT NOT NULL,
	PRIMARY KEY (`orders_id`)
);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk0` FOREIGN KEY (`department_id`) REFERENCES `Department`(`department_id`);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`);






