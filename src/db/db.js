import pkg from "pg";
import dotenv from "dotenv";
dotenv.config()

const { Pool } = pkg

export const connectionDB = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: true,
  });

// export const connectionDB = new Pool({
//   host: 'dpg-ceincukgqg4dlfc7ns4g-a',
//   port: '5432',
//   user: 'gabriel',
//   password: 'bS78D3d1w1CgfHrkvKm0Et9X1U6UfW8v',
//   database: 'shortly_dk4o'
// })