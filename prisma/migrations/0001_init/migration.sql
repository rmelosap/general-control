-- Removido CREATE EXTENSION para compatibilidade com Northflank

CREATE TABLE "User" (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  pst_grd           VARCHAR(2)   NOT NULL,
  pst_grd_completo  VARCHAR(5)   NOT NULL,

  quadro            TEXT          NOT NULL,
  especialidade     TEXT          NOT NULL,
  funcao            TEXT          NOT NULL,
  operacionalidade  TEXT          NOT NULL,
  dependente        TEXT          NOT NULL,

  genero            TEXT          NOT NULL,

  email_funcional   TEXT          NOT NULL,
  email_particular  TEXT          NOT NULL,

  trigrama          VARCHAR(3)    NOT NULL,

  nome_de_guerra    TEXT          NOT NULL,
  nome_completo     TEXT          NOT NULL,

  saram             VARCHAR(7)    NOT NULL,
  cpf               VARCHAR(14)   NOT NULL,

  banco             VARCHAR(3)    NOT NULL,
  agencia           VARCHAR(10)   NOT NULL,
  conta_corrente    TEXT          NOT NULL,

  "createdAt" TIMESTAMPTZ NOT NULL DEFAULT now(),
  "updatedAt" TIMESTAMPTZ NOT NULL DEFAULT now()
);
