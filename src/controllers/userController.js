import {connectionDB} from "../db/db.js";

export async function perfil(req, res) {

    const token = req.headers.authorization?.replace("Bearer ", "");

    try {
        const atividade = await connectionDB.query(`SELECT * FROM atividade WHERE token=$1;`, [token]);

        if (!atividade.rows.length) {
            return res.sendStatus(401);
        }

    } catch {
        res.sendStatus(500);
    }
}