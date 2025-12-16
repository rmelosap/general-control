import { Router, Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

/**
 * POST /users/bulk
 * Body: { users: [{ name, email, ... }] }
 */
router.post("/bulk", async (req: Request, res: Response) => {
  try {
    const { users } = req.body;

    if (!Array.isArray(users) || users.length === 0) {
      return res.status(400).json({
        error: "O campo 'users' deve ser um array não vazio",
      });
    }

    const result = await prisma.user.createMany({
      data: users,
      skipDuplicates: true, // evita erro em emails/ids únicos
    });

    return res.status(201).json({
      message: "Usuários inseridos com sucesso",
      count: result.count,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      error: "Erro ao inserir usuários em massa",
    });
  }
});

export default router;
