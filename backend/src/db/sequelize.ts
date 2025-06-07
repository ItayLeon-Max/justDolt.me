import { Sequelize } from "sequelize-typescript";
import config from 'config'
import User from "../models/user";



const logging = config.get<boolean>('sequelize.logging') ? console.log : false

const sequelize = new Sequelize({
    // [ add ALL model classes you created to the array ]:
    models: [  User ],
    dialect: 'mysql',
    ...config.get('db'),
    logging,
})

export default sequelize