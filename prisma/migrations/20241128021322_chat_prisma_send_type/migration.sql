/*
  Warnings:

  - Added the required column `send_type` to the `Chat` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Chat" ADD COLUMN     "send_type" INTEGER NOT NULL;
