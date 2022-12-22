import joi from "joi"
import bcrypt from "bcrypt";
import { connectionDB } from "../db/db";

const cadastroJOI = joi.object({
    name: joi.string().required().min(1),
    email: joi.string().email().required().min(1),
    password: joi.string().required().min(1),
})

export async function cadastro(req, res) {

    const { name, email, password, confirmPassword } = req.body
    const hashPassword = bcrypt.hashSync(password, 5);
    const validacao = cadastroJOI.validate({ name, email, password }, { abortEarly: false })

    if (validacao.error) {
        const erros = validacao.error.details.map((d) => d.message)
        res.status(422).send(erros)
        return
    }

    if (!name || !email || !password || !confirmPassword) {
        return res.sendStatus(400)
    }
    if (password !== confirmPassword) {
        return res.sendStatus(400)
    }

    try {
        await connectionDB.query("INSERT INTO usuarios (name, email, password) VALUES ($1, $2, $3);", [name, email, hashPassword])
        res.sendStatus(201);

    } catch (err) {

        console.log(err);
        res.sendStatus(500);
    }

}