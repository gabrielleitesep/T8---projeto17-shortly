import joi from "joi";
import { connectionDB } from "../db/db";
import { v4 as uuidV4 } from "uuid";
import bcrypt from "bcrypt";

const loginJOI = joi.object({
    email: joi.string().email().required().min(1),
    password: joi.string().required().min(1),
})

export async function login(req, res) {

    const { email, password } = req.body;
    const token = uuidV4();
    const validacao = loginJOI.validate({ email, password }, { abortEarly: false })

    if (validacao.error) {
        const erros = validacao.error.details.map((d) => d.message)
        res.status(422).send(erros)
        return
    }

    if ( !email || !password ) {
        return res.sendStatus(400)
    }

    try {
        const ativo = await connectionDB.query('SELECT * FROM usuarios WHERE email=$1;', [email])
        if (!ativo.rows[0]) {
            return res.sendStatus(401);
        }

        const encriptada = bcrypt.compareSync(password, ativo.rows[0].password);
        if (!encriptada) {
            return res.sendStatus(401);
        }

        const userId = ativo.rows[0].id.toString();

        await connectionDB.query('INSERT INTO atividade ("userId", token) VALUES ($1, $2);', [userId, token])

        res.send({ token });
    } catch (err) {
        console.log(err)
        res.sendStatus(500);
    }
}