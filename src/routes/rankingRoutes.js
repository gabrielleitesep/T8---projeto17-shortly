import { Router } from "express";
import { ranking } from "../controllers/rankingController.js"

const router = Router()

router.post("/ranking", ranking)

export default router