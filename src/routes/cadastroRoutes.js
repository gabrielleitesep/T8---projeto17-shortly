import { Router } from "express";
import { cadastro } from "../controllers/cadastroController.js"

const router = Router()

router.post("/signup", cadastro)

export default router