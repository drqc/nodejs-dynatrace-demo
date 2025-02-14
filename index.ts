
import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";


dotenv.config();

const app: Express = express();
const port = process.env.PORT || 3000;

type User = {
  name: string;
  lastName: string;
  email: string;
}
app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});

app.post("/create-user", async (req: Request, res: Response) => {
  const user: User = req.body;
  try {
  //  // const response = await axios.post("https://jsonplaceholder.typicode.com/users", user);
  //   const response = await fetch("http://example.com/api/endpoint", {
  //     method: "POST",
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //     body: JSON.stringify(user),
  //   });
  //  res.status(201).send(response.json());
  } catch (error) {
    res.status(500).send("Error creating user");
  }
});


app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});