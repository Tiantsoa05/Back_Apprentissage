import { Router } from "express";

const router = Router()

import { login, logout } from "../controllers/AuthController.js";

router.post("/login", login)
router.post("/logout", logout)

export default router