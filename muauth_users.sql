CREATE DATABASE IF NOT EXISTS muauth_users;

USE muauth_users;

CREATE TABLE `muauth_users` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`login` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`pass` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`created_at` DATETIME NOT NULL DEFAULT current_timestamp(),
	`edited_at` DATETIME NOT NULL,
	`deleted_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `muauth_user_applications` (
	`idapplication` INT(10) UNSIGNED NOT NULL,
	`iduser` INT(10) UNSIGNED NOT NULL,
	`linked_at` DATETIME NULL DEFAULT current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT current_timestamp(),
	INDEX `fk_iduser` (`iduser`) USING BTREE,
	CONSTRAINT `fk_iduser` FOREIGN KEY (`iduser`) REFERENCES `muauth_users` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
