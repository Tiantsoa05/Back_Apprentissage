/*
  Warnings:

  - You are about to drop the column `motDePasse` on the `Etudiant` table. All the data in the column will be lost.
  - Made the column `id_groupe` on table `Etudiant` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Etudiant" DROP CONSTRAINT "Etudiant_id_groupe_fkey";

-- AlterTable
ALTER TABLE "Etudiant" DROP COLUMN "motDePasse",
ALTER COLUMN "id_groupe" SET NOT NULL;

-- CreateTable
CREATE TABLE "ForumMessage" (
    "id" SERIAL NOT NULL,
    "id_sender" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "message_time" TIMESTAMP(3) NOT NULL,
    "id_groupe" INTEGER NOT NULL,

    CONSTRAINT "ForumMessage_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Etudiant" ADD CONSTRAINT "Etudiant_id_groupe_fkey" FOREIGN KEY ("id_groupe") REFERENCES "Groupe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ForumMessage" ADD CONSTRAINT "ForumMessage_id_groupe_fkey" FOREIGN KEY ("id_groupe") REFERENCES "Groupe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
