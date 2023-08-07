import { Router } from "express"
import authRouter  from "./auth.router.js"
import userRouter from "./users.routes.js"
import rankingRouter from "./ranking.router.js"
import shortenRouter from "./shorten.router.js"

const router = Router()

router.use(shortenRouter)
router.use(authRouter)
router.use(rankingRouter)
router.use(userRouter)


export default router