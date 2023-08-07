import { Router } from "express"
import { validateToken } from "../middlewares/token.middleware.js"
import { getUser } from "../controllers/users.controllers.js"

const userRouter = Router()

userRouter.get("/users/me", validateToken, getUser)


export default userRouter