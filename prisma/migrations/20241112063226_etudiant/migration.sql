/*
  Warnings:

  - Added the required column `motDePasse` to the `Etudiant` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Etudiant" DROP CONSTRAINT "Etudiant_id_groupe_fkey";

-- AlterTable
ALTER TABLE "Etudiant" ADD COLUMN     "motDePasse" TEXT NOT NULL,
ALTER COLUMN "id_groupe" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Etudiant" ADD CONSTRAINT "Etudiant_id_groupe_fkey" FOREIGN KEY ("id_groupe") REFERENCES "Groupe"("id") ON DELETE SET NULL ON UPDATE CASCADE;
