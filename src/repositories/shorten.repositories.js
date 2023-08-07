import { db } from "../database/database.connection.js"

export async function shortenQuery(user_id, short, url) {
    return db.query(`
            INSERT INTO urls (user_id, short_url, original_url, visit_count)
                VALUES ($1, $2, $3, $4)
                RETURNING url_id;
        `, [user_id, short, url, 0]);
}

export async function getUrls(id) {
    return db.query(`
        SELECT * FROM urls WHERE url_id = $1
          `, [id]);
}

export async function redirectOriginalUrl(shortUrl) {
    return db.query(`
    UPDATE urls 
    SET visit_count = visit_count + 1
    WHERE short_url = $1
    RETURNING original_url;
      `, [shortUrl]);
}

export async function deleteId (id){
    return db.query(`
        DELETE FROM urls WHERE url_id = $1;
          `, [id]);
}

