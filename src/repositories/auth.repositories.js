import { db } from "../database/database.connection.js"

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


