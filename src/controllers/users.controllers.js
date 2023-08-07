import { userQuery } from "../repositories/user.repositories.js"

export async function getUser(req, res) {
    const { user_id } = res.locals.session

    try {
        const user = await userQuery(user_id)
        res.status(200).send(user.rows[0])
    } catch (err) {
        res.status(500).send(err.message)
    }
}
