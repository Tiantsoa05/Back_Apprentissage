-- CreateTable
CREATE TABLE "Langue" (
    "id" SERIAL NOT NULL,
    "nom_langue" TEXT NOT NULL,

    CONSTRAINT "Langue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Professeur" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "prenoms" TEXT NOT NULL,
    "mail_prof" TEXT NOT NULL,
    "id_langue" INTEGER NOT NULL,

    CONSTRAINT "Professeur_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Niveau" (
    "id" SERIAL NOT NULL,
    "nom_niveau" TEXT NOT NULL,

    CONSTRAINT "Niveau_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Groupe" (
    "id" SERIAL NOT NULL,
    "nom_groupe" TEXT NOT NULL,
    "id_niveau" INTEGER NOT NULL,
    "id_professeur" INTEGER NOT NULL,

    CONSTRAINT "Groupe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cours" (
    "id" SERIAL NOT NULL,
    "nom_cours" TEXT NOT NULL,
    "date_debut" TIMESTAMP(3) NOT NULL,
    "date_fin" TIMESTAMP(3) NOT NULL,
    "id_professeur" INTEGER NOT NULL,
    "id_niveau" INTEGER NOT NULL,

    CONSTRAINT "Cours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Etudiant" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "prenoms" TEXT NOT NULL,
    "mail_etudiant" TEXT NOT NULL,
    "id_groupe" INTEGER NOT NULL,

    CONSTRAINT "Etudiant_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Professeur" ADD CONSTRAINT "Professeur_id_langue_fkey" FOREIGN KEY ("id_langue") REFERENCES "Langue"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Groupe" ADD CONSTRAINT "Groupe_id_professeur_fkey" FOREIGN KEY ("id_professeur") REFERENCES "Professeur"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Groupe" ADD CONSTRAINT "Groupe_id_niveau_fkey" FOREIGN KEY ("id_niveau") REFERENCES "Niveau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cours" ADD CONSTRAINT "Cours_id_professeur_fkey" FOREIGN KEY ("id_professeur") REFERENCES "Professeur"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cours" ADD CONSTRAINT "Cours_id_niveau_fkey" FOREIGN KEY ("id_niveau") REFERENCES "Niveau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Etudiant" ADD CONSTRAINT "Etudiant_id_groupe_fkey" FOREIGN KEY ("id_groupe") REFERENCES "Groupe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
