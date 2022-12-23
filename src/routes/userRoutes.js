import { Router } from "express";
import { perfil } from "../controllers/userController.js"

const router = Router()

router.get("/users/me", perfil)

export default router