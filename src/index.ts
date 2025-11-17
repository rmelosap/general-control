import express, { Request, Response } from "express";
import { Pool } from "pg";

const app = express();
const PORT = process.env.PORT || 3000;

// Conexão com PostgreSQL
const db = new Pool({
  connectionString: process.env.POSTGRES_URI, // copiar exatamente igual ao nome da env
});

// Testar conexão ao iniciar
db.connect()
  .then(() => console.log("Connected to PostgreSQL"))
  .catch((err) => console.error("DB connection error:", err));

// Rota principal
app.get("/", (req: Request, res: Response) => {
  res.send("Hello from Express + Northflank!");
});

// Rota GET /users → retorna todos os usuários
app.get("/users", async (req: Request, res: Response) => {
  try {
    const result = await db.query("SELECT * FROM users ORDER BY id ASC");
    res.json(result.rows);
  } catch (err: any) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);

// Commit em branco, forçando o Northflank
});
