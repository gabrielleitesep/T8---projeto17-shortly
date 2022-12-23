import express from "express";
import loginRoutes from "./routes/loginRoutes.js"
import cadastroRoutes from "./routes/cadastroRoutes.js"
import urlsRoutes from "./routes/urlsRoutes.js"
import userRoutes from "./routes/userRoutes.js"
import rankingRoutes from "./routes/rankingRoutes.js"
import dotenv from "dotenv";
dotenv.config();

const app = express();
app.use(express.json());

app.use(loginRoutes);
app.use(cadastroRoutes);
app.use(urlsRoutes);
app.use(userRoutes);
app.use(rankingRoutes);

const port = process.env.PORT;
app.listen(port, () => console.log(`Server running in port: ${port}`));