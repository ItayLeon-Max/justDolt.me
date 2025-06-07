import { createHmac } from "crypto";
import { sign } from 'jsonwebtoken'; 
import config from 'config'
import { Request, Response, NextFunction } from 'express';
import User from "../../models/user";
import AppError from "../../errors/app-error";
import { StatusCodes } from "http-status-codes";
import socket from "../../io/io";


// hash password
export function hashPassword(password: string): string {
    return createHmac('sha256', config.get<string>('app.secret'))
            .update(password)
            .digest('hex')
}

// get all users
export async function getAllUsers(req: Request, res: Response, next: NextFunction) {
    try {
        const users = await User.findAll();
        res.json(users);
    } catch (e) {
        next(new AppError(StatusCodes.INTERNAL_SERVER_ERROR, e.message));
    }
}

// login
export async function login(req: Request<{}, {}, {username: string, password: string}>, res: Response, next: NextFunction) {
    try {
        const { username, password } = req.body;

        const user = await User.findOne({
            where: {
                userName: username, 
                password: hashPassword(password)
            },
        });

        if (!user) return next(new AppError(StatusCodes.UNAUTHORIZED, 'wrong credentials'));
        const jwt = sign(user.get({ plain: true }), config.get<string>('app.jwtSecret'));

        socket.emit("user:login", {
            id: user.id,
            name: user.name,
            username: user.userName,
            time: new Date().toISOString(),
          });
      

        res.json({ 
            jwt,
            messages: `Welcome ${user.name}!` 
        });
    } catch (e) {
        next(new AppError(StatusCodes.INTERNAL_SERVER_ERROR, e.message));
    }
}

// register
export async function register(req: Request<{}, {}, {name: string, username: string, password: string, email: string, role: string}>, res: Response, next: NextFunction) {
    try {
        const { name, username, password, email, role } = req.body;
        const user = await User.create({
            name,
            userName: username, 
            password: hashPassword(password),
            email,
            role
        });

        res.json(user);
    } catch (e) {
        next(new AppError(StatusCodes.INTERNAL_SERVER_ERROR, e.message));
    }
}

// delete user
export async function deleteUser(req: Request<{id: string}, {}, {}>, res: Response, next: NextFunction) {
    try {
        const { id } = req.params;
        const user = await User.findByPk(id);

        if (!user) return next(new AppError(StatusCodes.NOT_FOUND, 'user not found'));

        await user.destroy();
        res.json({ message: 'user deleted' });
    } catch (e) {
        next(new AppError(StatusCodes.INTERNAL_SERVER_ERROR, e.message));
    }
}

// update user
export async function updateUser(req: Request<{id: string}, {}, {name: string, username: string, password: string, email: string, role: string}>, res: Response, next: NextFunction) {
    try {
        const { id } = req.params;
        const { name, username, password, email, role } = req.body;
        const user = await User.findByPk(id);

        if (!user) return next(new AppError(StatusCodes.NOT_FOUND, 'user not found'));

        user.name = name;
        user.userName = username;
        user.password = hashPassword(password);
        user.email = email;
        user.role = role;

        await user.save();
        res.json(user);
    } catch (e) {
        next(new AppError(StatusCodes.INTERNAL_SERVER_ERROR, e.message));
    }
}

// logout with userId

export async function logout(req: Request<{ id: string }>, res: Response, next: NextFunction) {
    try {
        const { id: userId } = req.params;

        if (!userId) return next(new AppError(StatusCodes.BAD_REQUEST, 'Missing userId'));

        const user = await User.findByPk(userId);
        if (!user) return next(new AppError(StatusCodes.NOT_FOUND, 'User not found'));

        socket.emit("user:login", {
            id: user.id,
            name: user.name,
            username: user.userName,
            time: new Date().toISOString(),
          });
          
          socket.emit("user:online", {
            id: user.id,
            name: user.name,
            username: user.userName,
            time: new Date().toISOString(),
          });

        res.json({ message: `User ${user.name} logged out` });
    } catch (e: any) {
        next(new AppError(StatusCodes.INTERNAL_SERVER_ERROR, e.message));
    }
}