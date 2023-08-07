import { db } from "../database/database.connection.js"


// export  async function rankingRepository(){
//     await db.query(
//         `SELECT u.name, COUNT(l.id) AS num_links, SUM(l.views) AS total_views
//         FROM users u
//         LEFT JOIN links l ON u.id = l.user_id
//         GROUP BY u.id, u.name
//         ORDER BY total_views DESC;
//         `
//     );
// }
// export async function emailRepository(){
//     const { email } = req.body
//     await db.query(
//         `SELECT * FROM users WHERE email = $1`,
//         [email]
//       );
// }

export async function users(name, email, hash){
    return  db.query(`
            INSERT INTO users (name, email, password)
                VALUES ($1, $2, $3);
        `, [name, email, hash])
}

export async function queryEmail(email){ 
    return  db.query(`SELECT * FROM users WHERE email=$1`, [email])
}

export async function loginSucess(userID, token){ 
    return  db.query(`
    INSERT INTO tokens (user_id, token)
        VALUES ($1, $2);
`, [userID, token])
}


