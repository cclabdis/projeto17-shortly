import { Router } from "express"
import validateSchema from "../middlewares/validateSchema.middleware.js"
import shortenSchema from "../schemas/shorten.schema.js"
import { validateToken } from "../middlewares/token.middleware.js"
import { deleteUrl, getShorten, postShorten, redirect} from "../controllers/shorten.controllers.js"

const shortenRouter = Router()

shortenRouter.post("/urls/shorten", validateSchema(shortenSchema), validateToken, postShorten )
shortenRouter.get("/urls/:id", getShorten)
shortenRouter.get("/urls/open/:shortUrl", redirect)
shortenRouter.delete("/urls/:id", deleteUrl)

export default shortenRouter