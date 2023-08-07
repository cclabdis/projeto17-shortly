import { db } from "../database/database.connection.js"

export async function shortenQuery(user_id, shortUrl, url) {
    return db.query(`
            INSERT INTO links (user_id, short_url, original_url, visit_count)
                VALUES ($1, $2, $3, $4)
                RETURNING url_id;
        `, [user_id, shortUrl, url, 0]);
}

export async function getUrls(id) {
    return db.query(`
        SELECT * FROM links WHERE url_id = $1
          `, [id]);
}

export async function redirectOriginalUrl(shortUrl) {
    return db.query(`
    UPDATE links 
    SET visit_count = visit_count + 1
    WHERE short_url = $1
    RETURNING original_url;
      `, [shortUrl]);
}

export async function deleteId (id){
    return db.query(`
        DELETE FROM links WHERE url_id = $1;
          `, [id]);
}

