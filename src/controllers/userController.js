import { connectionDB } from "../db/db.js";

export async function perfil(req, res) {

    const token = req.headers.authorization?.replace("Bearer ", "");

    try {
        const atividade = await connectionDB.query(`SELECT * FROM atividade WHERE token=$1;`, [token]);

        if (!atividade.rows.length) {
            return res.sendStatus(401);
        }

        const visits = await connectionDB.query(`SELECT SUM(visit) FROM urls WHERE "userId"=$1;`, [atividade.rows[0].userId]);
        const user = await connectionDB.query(`SELECT * FROM usuarios WHERE id=$1;`, [atividade.rows[0].userId]);

        if (!user) {
            return res.sendStatus(404)
        }

        const urls = await connectionDB.query(
            `SELECT id, url,"newUrl","visit" FROM urls WHERE "userId"= $1;`, [atividade.rows[0].userId]);

        const userData = {

            id: atividade.rows[0].userId,
            name: user.rows[0].name,
            visitCount: visits.rows[0].sum,
            shortenedUrls: urls.rows
        }
        res.send(userData)

 
    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }
}