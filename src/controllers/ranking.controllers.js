import { rankingRepository } from "../repositories/ranking.repositories.js"

export async function getRanking(req, res) {

  try {
      const user = await rankingRepository()
      res.status(200).send(user.rows);
  } catch (err) {
      res.status(500).send(err.message);
  }
}