import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";


const prisma = new PrismaClient();

export const login = async (req, res) => {
  const { nom, mail } = req.body;

  const etudiant = await prisma.etudiant.findUnique({
    where: {
      mail_etudiant: mail,
    },
    select: {
      id: true,
      password: true,
    },
  });

  if (!etudiant) {
    return res.status(401).json({ message: "Email ou nom d'utilisateur incorrect" });
  }

  const token = jwt.sign({ id: etudiant.id , nom}, process.env.JWT_SECRET, {
    expiresIn: "3h",
  });

  res.json({ token });
}

export const logout = (req, res) => {
    res.clearCookie("token");
    res.status(200).json({ message: "Déconnexion réussie" });
}