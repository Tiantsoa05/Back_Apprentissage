import { PrismaClient } from "@prisma/client";
import io from "../../tools/socket-io.js";


const prisma = new PrismaClient();

export const send = async (req, res) => {
    const {id_prof, id_etudiant, message} = req.body;

    const sent = await prisma.chat.create(
        {
            message,
            id_prof : parseInt(id_prof),
            id_etudiant : parseInt(id_etudiant)
        }
    )

    const messages = await prisma.chat.findMany(
        {
            where:{
                id_prof : parseInt(id_prof),
                id_etudiant : parseInt(id_etudiant)
            }, 
            orderBy:{
                date_sent: "asc"
            }
        }
    )

    io.emit("discussion", messages)

}