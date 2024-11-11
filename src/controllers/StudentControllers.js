import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getFollowerStudents = async (req, res) => {
  const { id_prof } = req.params;
  const followers = await prisma.professeur.findUnique({
    where:{
        id: parseInt(id_prof)
    },
    select:{
        groupe:{
            select:{
                etudiant:true
            }
        }
    }
    
  });

  const studentFollowers = followers?.groupe.flatMap(etudiant=>etudiant.nom) | []

  res.status(200).json(studentFollowers);
};

