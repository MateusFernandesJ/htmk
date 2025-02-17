const express = require("express");
const { exec } = require("child_process");

const app = express();
const PORT = 3000;

// Rota para executar o .bat
app.get("/run-bat", (req, res) => {
  exec(
    '"D:\\Arquivos\\Mateus\\htmk\\Jogo info\\virus\\Definitivo6.bat"',
    (error, stdout, stderr) => {
      if (error) {
        console.error(`Erro: ${error.message}`);
        return res
          .status(500)
          .send(`Erro ao executar o script: ${error.message}`);
      }
      if (stderr) {
        console.error(`Stderr: ${stderr}`);
        return res.status(500).send(`Erro no script: ${stderr}`);
      }
      res.send(`Script executado com sucesso! Saída: ${stdout}`);
    }
  );
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://127.0.0.1:${PORT}`);
});
