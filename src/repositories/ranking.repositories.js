import { db } from "../database/database.connection.js"


export  async function rankingRepository(){
    return db.query(`
      SELECT
          users.user_id AS id,
          users.name AS name,
          COUNT(links.url_id) AS "linksCount",
          SUM(links.visit_count) AS "visitCount"
      FROM
          users
          LEFT JOIN links ON users.user_id = links.user_id
      GROUP BY
          users.user_id, users.name, links.visit_count
      ORDER BY
          "visitCount" DESC
      LIMIT
          10;
      `);
    
}


