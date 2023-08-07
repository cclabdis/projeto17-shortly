import { db } from "../database/database.connection.js"


export async function userQuery(user_id){ 
    return db.query(`
        SELECT
            users.user_id AS id,
            users.name,
            SUM(links.visit_count) AS "visitCount",
            json_agg(json_build_object(
            'id', links.url_id,
            'shortUrl', links.short_url,
            'url', links.original_url,
            'visitCount', links.visit_count
            )) AS "shortenedUrls"
        FROM
            users
        INNER JOIN links ON users.user_id = links.user_id
        WHERE
            users.user_id = $1
        GROUP BY
            users.user_id, users.name;
        `, [user_id]);
            }


 export async function acessToken(token){ 
    return db.query("SELECT * from tokens WHERE token = $1 ",[token])
            }