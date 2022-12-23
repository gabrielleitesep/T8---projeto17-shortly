import { Router } from "express";
import { perfil } from "../controllers/userController.js"

const router = Router()

router.post("/users/me", perfil)

export default router