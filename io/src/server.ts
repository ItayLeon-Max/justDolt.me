import { Server, Socket } from "socket.io";
import config from "config";

const port = config.get<number>('io.port');

const io = new Server({
    cors: {
        origin: '*',
    }
});

const connectedUsers = new Map<string, any>();

io.on('connection', socket => {

    console.log('got a new connection');

    socket.on('user:login', (data) => {
        console.log(`🟢 User ${data.name} has logged in`);
        io.emit('notify:login', data); 
    });

    socket.on('user:logout', (data) => {
        console.log(`🔴 User ${data.name} has logged out`);
    });

    socket.on('user:online', (data) => {
        connectedUsers.set(socket.id, data);
        console.log(`🟢 User ${data.name} is now online`);
    });

    socket.on('disconnect', () => {
        const user = connectedUsers.get(socket.id);
        if (user) {
            console.log(`🔴 User ${user.name} has disconnected`);
            connectedUsers.delete(socket.id);
        } else {
            console.log('🔴 A client disconnected');
        }
    });
});

io.listen(port);
console.log(`io listening on port ${port}`);