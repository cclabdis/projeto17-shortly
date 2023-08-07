import { nanoid } from "nanoid"
import { deleteId, getUrls, redirectOriginalUrl, shortenQuery } from "../repositories/shorten.repositories.js"


export async function postShorten(req, res) {
    const { url } = req.body
    const { user_id } = res.locals.token

    const short = nanoid(8);

    try {
        const result = await shortenQuery(user_id, short, url)

        res.status(201)
            .send({id: result.rows[0].url_id, short });
    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function getShorten(req, res) {
    const { id } = req.params;

    try {
        const url = await getUrls(id)
            if (url.rowCount === 0) return res.sendStatus(404);
        const urlId = url.rows[0]

        res.status(200).send({
            id,
            shortUrl: urlId.short_url,
            url: urlId.original_url
        });

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function redirect(req, res) {
    const { shortUrl } = req.params

    try { 
        const url = await redirectOriginalUrl(shortUrl)
        if (url.rowCount === 0) return res.sendStatus(404)

        const originalUrl = url.rows[0].original_url
        res.redirect(originalUrl);

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function deleteUrl(req, res) {

    const { id } = req.params
    const { user_id } = res.locals.token

    try {
        const url = await getUrls(id)
        if (url.rowCount === 0) return res.sendStatus(404);

        if (url.rows[0].user_id !== user_id) return res.sendStatus(401);

        await deleteId(id)
        res.sendStatus(204);

    } catch (err) {
        res.status(500).send(err.message);
    }
}
