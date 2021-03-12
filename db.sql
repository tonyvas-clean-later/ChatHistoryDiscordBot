USE `temp_discord_messages_db`;

DROP TABLE IF EXISTS `server_name`;
DROP TABLE IF EXISTS `channel_name`;
DROP TABLE IF EXISTS `user_name`;
DROP TABLE IF EXISTS `user_nickname`;
DROP TABLE IF EXISTS `user_discriminator`;
DROP TABLE IF EXISTS `server`;
DROP TABLE IF EXISTS `channel`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `message`;

CREATE TABLE `server` (
    `id` INTEGER AUTO_INCREMENT,
    `discord_id` BIGINT NOT NULL,
    
    CONSTRAINT `pkey_server_id` PRIMARY KEY (`id`)
);

CREATE TABLE `server_name` (
    `id` INTEGER AUTO_INCREMENT,
    `server_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NOT NULL,

    CONSTRAINT `pkey_server_name_id` PRIMARY KEY (`id`),
    CONSTRAINT `fkey_server_name_server` FOREIGN KEY (`server_id`) REFERENCES `server` (`id`)
);

CREATE TABLE `channel` (
    `id` INTEGER AUTO_INCREMENT,
    `discord_id` BIGINT NOT NULL,

    CONSTRAINT `pkey_channel_id` PRIMARY KEY (`id`)
);

CREATE TABLE `channel_name` (
    `id` INTEGER AUTO_INCREMENT,
    `channel_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NOT NULL,

    CONSTRAINT `pkey_channel_name_id` PRIMARY KEY (`id`),
    CONSTRAINT `fkey_channel_name_channel` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
);

CREATE TABLE `user` (
    `id` INTEGER AUTO_INCREMENT,
    `discord_id` BIGINT NOT NULL,

    CONSTRAINT `pkey_user_id` PRIMARY KEY (`id`)
);

CREATE TABLE `user_name` (
    `id` INTEGER AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NOT NULL,

    CONSTRAINT `pkey_user_name_id` PRIMARY KEY (`id`),
    CONSTRAINT `fkey_user_name_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

CREATE TABLE `user_nickname` (
    `id` INTEGER AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `nickname` VARCHAR(100) DEFAULT NULL,

    CONSTRAINT `pkey_user_nickname_id` PRIMARY KEY (`id`),
    CONSTRAINT `fkey_user_nickname_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

CREATE TABLE `user_discriminator` (
    `id` INTEGER AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `discriminator` INT NOT NULL,

    CONSTRAINT `pkey_user_discriminator_id` PRIMARY KEY (`id`),
    CONSTRAINT `fkey_user_discriminator_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

CREATE TABLE `message` (
    `id` INTEGER AUTO_INCREMENT,
    `discord_id` BIGINT NOT NULL,
    `created_on` BIGINT NOT NULL,
    `content` VARCHAR(2500),

    CONSTRAINT `pkey_message_id` PRIMARY KEY (`id`)
);