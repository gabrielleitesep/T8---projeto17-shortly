import joi from "joi";
import { connectionDB } from "../db/db.js";
import { nanoid } from "nanoid";

const urlJOI = joi.object({
    url: joi.string().uri().required()
})

export async function encurtarUrl(req, res) {

    const { url } = req.body;
    const token = req.headers.authorization?.replace("Bearer ", "");
    const validacao = urlJOI.validate({ url }, { abortEarly: false });
    const newUrl = nanoid(5);


    if (validacao.error) {
        const erros = validacao.error.details.map((d) => d.message)
        res.status(422).send(erros);
        return
    }

    if ( !url ) {
        return res.sendStatus(400)
    }

    try {
        const atividade = await connectionDB.query(`SELECT * FROM atividade WHERE token=$1;`, [token]);

        if (!atividade.rows.length) {
            return res.sendStatus(401);
        }

        await connectionDB.query(`INSERT INTO urls ("url", "newUrl", "userId") VALUES ($1, $2, $3);`, [url, newUrl, atividade.rows[0].userId]);
        res.status(201).send({ "shortUrl": newUrl });

    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }
}

export async function exibirUrl(req, res) {

    const { id } = req.params;
    console.log(typeof(id))

    try {
        const urlExist = await connectionDB.query(`SELECT * FROM urls WHERE id=$1;`, [id]);

        if (!urlExist.rows[0]) {
            console.log(urlExist.rows)
            return res.sendStatus(404);
        }
        const url = {
            "id": urlExist.rows[0].id,
            "shortUrl": urlExist.rows[0].newUrl,
            "url": urlExist.rows[0].url,
          };

        res.status(200).send(url);

    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }
}

export async function redirecionarUrl(req, res) {

    const { newUrl } = req.params;

    try {
        const newUrlAtiva = await connectionDB.query(`SELECT * FROM urls WHERE "newUrl"=$1;`, [newUrl]);
        if (newUrlAtiva.rows[0]) {
            return res.sendStatus(404);
        };
        
        await connectionDB.query(`UPDATE urls SET visit = visit + 1 WHERE "newUrl"=$1;`, [newUrl])

        res.redirect(newUrlAtiva[0]);

    } catch (err) {
        console.log(err);
        res.sendStatus(500);
    }
}

export async function deletarUrl(req, res) {

    const { id } = req.params;
    const token = req.headers.authorization?.replace("Bearer ", "");

    try {
        const atividade = await connectionDB.query(`SELECT * FROM atividade WHERE token=$1;`, [token]);

        if (!atividade.rows[0]) {
            return res.sendStatus(401);
        }

        const urlAtiva = await connectionDB.query(`SELECT * FROM urls WHERE id=$1;`, [id])
        
        if(!urlAtiva.rows[0]){
            return res.sendStatus(404)
        }

        await connectionDB.query(`DELETE FROM urls WHERE id=$1;`, [id]);
        res.sendStatus(204);

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
}