/*
  Warnings:

  - The primary key for the `billing` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `billing` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `VarChar(191)`.
  - Made the column `created_at` on table `billing` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `billing` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `created_at` TIMESTAMP(0) NOT NULL,
    ADD PRIMARY KEY (`id`);
