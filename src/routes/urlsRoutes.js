import { Router } from "express";
import { encurtarUrl, exibirUrl, redirecionarUrl, deletarUrl } from "../controllers/urlsController.js"

const router = Router()

router.post("/urls/shorten", encurtarUrl)
router.get("/urls/:id", exibirUrl)
router.get("/urls/open/:shortUrl", redirecionarUrl)
router.delete("/urls/:id", deletarUrl)

export default router