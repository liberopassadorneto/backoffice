-- CreateTable
CREATE TABLE `active_campaign` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `domain` VARCHAR(191) NOT NULL,
    `first_installed` BOOLEAN NOT NULL DEFAULT false,
    `first_bot_created` BOOLEAN NOT NULL DEFAULT false,
    `open_channel_first_configured` BOOLEAN NOT NULL DEFAULT false,
    `finished_installation` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `api_response_variables` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `card_id` BIGINT UNSIGNED NOT NULL,
    `chat_variable` VARCHAR(191) NOT NULL,
    `api_response_path` VARCHAR(191) NOT NULL,
    `version` INTEGER NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `api_response_variables_card_id_foreign`(`card_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `billing` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `domain` VARCHAR(191) NOT NULL,
    `amount_of_days` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cache` (
    `key` VARCHAR(191) NOT NULL,
    `value` MEDIUMTEXT NOT NULL,
    `expiration` INTEGER NOT NULL,

    UNIQUE INDEX `cache_key_unique`(`key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `card` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `parent_id` BIGINT UNSIGNED NULL,
    `chatbot_id` BIGINT UNSIGNED NOT NULL,
    `card_type_id` BIGINT UNSIGNED NOT NULL,
    `text` TEXT NOT NULL,
    `text_with_variables` TEXT NULL,
    `capture_field` TEXT NULL,
    `custom_message` TEXT NULL,
    `menu_return` BOOLEAN NULL DEFAULT false,
    `start_return` BOOLEAN NULL DEFAULT false,
    `chat_variable_field` VARCHAR(100) NULL,
    `enumeration_id` INTEGER NULL,
    `lead_status` VARCHAR(191) NULL,
    `transfer_to` VARCHAR(191) NULL,
    `start_date` TIMESTAMP(0) NULL,
    `end_date` TIMESTAMP(0) NULL,
    `conditions` TEXT NULL,
    `conditions_with_variables` TEXT NULL,
    `keywords` TEXT NULL,
    `header_read_from_api` TEXT NULL,
    `method_read_from_api` TEXT NULL,
    `body_read_from_api` TEXT NULL,
    `version` INTEGER NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `card_card_type_id_foreign`(`card_type_id`),
    INDEX `card_chatbot_id_foreign`(`chatbot_id`),
    INDEX `card_parent_id_foreign`(`parent_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `card_type` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `chatbot` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `color` VARCHAR(191) NULL,
    `icon` TEXT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `chatbot_id` INTEGER NOT NULL,
    `description` TEXT NULL,
    `version` INTEGER NOT NULL DEFAULT 1,
    `receptive_only` BOOLEAN NOT NULL DEFAULT false,
    `ignore_reactions` BOOLEAN NOT NULL DEFAULT false,
    `receptive_time` INTEGER NOT NULL DEFAULT 30,
    `send_to` ENUM('queue', 'responsible') NOT NULL DEFAULT 'queue',
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `chatbot_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `access_token` VARCHAR(191) NOT NULL,
    `expires` VARCHAR(191) NOT NULL,
    `expires_in` VARCHAR(191) NOT NULL,
    `scope` TEXT NOT NULL,
    `domain` VARCHAR(191) NOT NULL,
    `server_endpoint` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `client_endpoint` VARCHAR(191) NOT NULL,
    `member_id` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL,
    `refresh_token` VARCHAR(191) NOT NULL,
    `application_token` VARCHAR(191) NOT NULL,
    `is_installed` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `client_domain_unique`(`domain`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `create_entity_variables` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `card_id` BIGINT UNSIGNED NOT NULL,
    `entity` VARCHAR(191) NOT NULL,
    `deal_pipeline` INTEGER NULL,
    `status` INTEGER NULL,
    `field_type` VARCHAR(191) NULL,
    `field_value` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `create_entity_variables_card_id_foreign`(`card_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(191) NOT NULL,
    `batch` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `password_resets` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,

    INDEX `password_resets_email_index`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `client_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `roles_client_id_foreign`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles_permissions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `role_id` BIGINT UNSIGNED NOT NULL,
    `permission_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `roles_permissions_permission_id_foreign`(`permission_id`),
    INDEX `roles_permissions_role_id_foreign`(`role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sessions` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` BIGINT UNSIGNED NULL,
    `ip_address` VARCHAR(45) NULL,
    `user_agent` TEXT NULL,
    `payload` TEXT NOT NULL,
    `last_activity` INTEGER NOT NULL,

    UNIQUE INDEX `sessions_id_unique`(`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `statistics` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `chat_id` VARCHAR(255) NOT NULL,
    `card_id` BIGINT UNSIGNED NOT NULL,
    `card_text` TEXT NOT NULL,
    `user_answer` TEXT NULL,
    `chatbot_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `step_form` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(256) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `phone_number` VARCHAR(256) NULL,
    `country` VARCHAR(100) NULL,
    `domain` VARCHAR(100) NOT NULL,
    `client_id` BIGINT UNSIGNED NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    INDEX `step_form_client_id_foreign`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_data` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `client_id` BIGINT UNSIGNED NOT NULL,
    `week_leads` INTEGER NOT NULL,
    `week_deals` INTEGER NOT NULL,
    `first_lead_date` DATETIME(0) NULL,
    `bitrix_plan` VARCHAR(30) NOT NULL,
    `employees_number` INTEGER NOT NULL,
    `email` VARCHAR(256) NULL,
    `name` VARCHAR(256) NULL,
    `last_name` VARCHAR(256) NULL,
    `personal_birthday` VARCHAR(100) NULL,
    `personal_phone` VARCHAR(20) NULL,
    `personal_mobile` VARCHAR(20) NULL,
    `personal_street` VARCHAR(50) NULL,
    `personal_city` VARCHAR(50) NULL,
    `personal_state` VARCHAR(50) NULL,
    `personal_zip` VARCHAR(15) NULL,
    `personal_country` VARCHAR(25) NULL,
    `work_company` VARCHAR(50) NULL,
    `work_position` VARCHAR(50) NULL,
    `work_phone` VARCHAR(20) NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    INDEX `user_data_client_id_foreign`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `bitrix_id` BIGINT NOT NULL,
    `email` VARCHAR(191) NULL,
    `name` VARCHAR(191) NULL,
    `second_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NULL,
    `domain` VARCHAR(191) NULL,
    `is_bitrix_admin` BOOLEAN NULL,
    `lang` VARCHAR(10) NULL,
    `client_id` BIGINT UNSIGNED NOT NULL,
    `show_help` BOOLEAN NOT NULL DEFAULT true,
    `show_news` BOOLEAN NOT NULL DEFAULT true,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `users_client_id_foreign`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users_bitrix_tokens` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `domain` TEXT NOT NULL,
    `member_id` TEXT NOT NULL,
    `access_token` TEXT NOT NULL,
    `refresh_token` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users_roles` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `role_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `users_roles_role_id_foreign`(`role_id`),
    INDEX `users_roles_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `api_response_variables` ADD CONSTRAINT `api_response_variables_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `card`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `card` ADD CONSTRAINT `card_card_type_id_foreign` FOREIGN KEY (`card_type_id`) REFERENCES `card_type`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `card` ADD CONSTRAINT `card_chatbot_id_foreign` FOREIGN KEY (`chatbot_id`) REFERENCES `chatbot`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `card` ADD CONSTRAINT `card_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `card`(`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `chatbot` ADD CONSTRAINT `chatbot_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `create_entity_variables` ADD CONSTRAINT `create_entity_variables_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `card`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `roles` ADD CONSTRAINT `roles_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `roles_permissions` ADD CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `roles_permissions` ADD CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `step_form` ADD CONSTRAINT `step_form_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user_data` ADD CONSTRAINT `user_data_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `users_roles` ADD CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `users_roles` ADD CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
