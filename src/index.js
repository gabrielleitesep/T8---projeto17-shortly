import express from "express";
import loginRoutes from "./routes/loginRoutes.js"
import cadastroRoutes from "./routes/cadastroRoutes.js"
import urlsRoutes from "./routes/urlsRoutes.js"
import dotenv from "dotenv";
dotenv.config();

const app = express();
app.use(express.json());

app.use(loginRoutes);
app.use(cadastroRoutes);
app.use(urlsRoutes);

const port = process.env.PORT;
app.listen(port, () => console.log(`Server running in port: ${port}`));