/*
  Warnings:

  - You are about to drop the column `id_receiver` on the `Chat` table. All the data in the column will be lost.
  - You are about to drop the column `id_sender` on the `Chat` table. All the data in the column will be lost.
  - Added the required column `id_etudiant` to the `Chat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_prof` to the `Chat` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Chat" DROP COLUMN "id_receiver",
DROP COLUMN "id_sender",
ADD COLUMN     "id_etudiant" INTEGER NOT NULL,
ADD COLUMN     "id_prof" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_id_prof_fkey" FOREIGN KEY ("id_prof") REFERENCES "Professeur"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_id_etudiant_fkey" FOREIGN KEY ("id_etudiant") REFERENCES "Etudiant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
