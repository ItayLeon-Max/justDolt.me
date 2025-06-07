import express, { json } from "express"
import config from 'config'
import sequelize from "./db/sequelize"
import errorLogger from "./middlewares/error/error-logger"
import errorResponder from "./middlewares/error/error-responder"
import notFound from "./middlewares/not-found"
import cors from 'cors'
import authRouter from "../src/routers/auth/auth"


const port = config.get<string>('app.port')
const name = config.get<string>('app.name')
const force = config.get<boolean>('sequelize.sync.force')

const app = express();

export async function start() {
    await sequelize.sync({ force })

    // middlewares
    app.use(cors()) // allow any client to use this server

    app.use(json()) // a middleware to extract the post/put/patch data and save it to the request object in case the content type of the request is application/json

    // routers
    app.use('/auth', authRouter)

    // special notFound middleware
    app.use(notFound)

    // error middleware
    app.use(errorLogger)
    app.use(errorResponder)

    // app.listen(port, () => console.log(`${name} started on port ${port}...`))
}

export default app