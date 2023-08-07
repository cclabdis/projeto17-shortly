import { db } from "../database/database.connection.js"


export  async function rankingRepository(){
    return db.query(`
      SELECT
          users.user_id AS id,
          users.name,
          COUNT(urls.url_id) AS "linksCount",
          SUM(urls.visit_count) AS "visitCount"
      FROM
          users
          LEFT JOIN urls ON users.user_id = urls.user_id
      GROUP BY
          users.user_id, users.name, urls.visit_count
      ORDER BY
          "visitCount" DESC
      LIMIT
          10;
      `);
    
}


