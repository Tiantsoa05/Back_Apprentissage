const express = require('express');
const prisma = require('@prisma/client');
const app = express();
const port = 3000;

const { PrismaClient } = prisma;
const prismaClient = new PrismaClient();

app.use(express.json());

app.post('/inscription', async (req, res) => {
    const { nom, prenoms, mail_etudiant , motDePasse} = req.body;

    
    if (!nom || !prenoms || !mail_etudiant || !motDePasse) {
        return res.status(400).json({ message: "Remplir le champ!" });
    }

    
    const emailExistant = await prismaClient.etudiant.findUnique({
        where: { mail_etudiant  }
    });

    if (emailExistant) {
        return res.status(400).json({ message: "Cet email est déjà utilisé." });
    }

    try {
        
        const etudiant = await prismaClient.etudiant.create({
            data: {
                nom,
                prenoms,
                mail_etudiant,  // Assure-toi de hasher le mail en production!
                motDePasse,  // Assure-toi de hasher le mot de passe en production !
            }
        });

        
        res.status(201).json({ message: "Inscription réussie", etudiant });

    } catch (err) {
        
        console.error(err);
        res.status(500).json({ message: "Erreur interne du serveur" });
    }
});

app.listen(port, () => {
    console.log(`Serveur en cours d'exécution sur http://localhost:${port}`);
});