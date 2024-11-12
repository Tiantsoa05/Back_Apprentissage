import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const prismaClient = new PrismaClient();

export const inscription= async (req, res) => {
    const { nom, prenoms, mail_etudiant , motDePasse} = req.body;

    
    if (!nom || !prenoms || !mail_etudiant || !motDePasse) {
        return res.status(400).json({ message: "Remplir le champ!" });
    }

    
    const emailExistant = await prismaClient.etudiant.findFirst({
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
                motDePasse: bcrypt.hash(motDePasse),  // Assure-toi de hasher le mot de passe en production !
            }
        });

        
        res.status(201).json({ message: "Inscription réussie", etudiant });

    } catch (err) {
        
        console.error(err);
        res.status(500).json({ message: "Erreur interne du serveur" });
    }
}