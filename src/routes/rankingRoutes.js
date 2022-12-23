import { Router } from "express";
import { ranking } from "../controllers/rankingController.js"

const router = Router()

router.get("/ranking", ranking)

export default router