import config from 'config';
import app, { start } from './app';


const port = config.get<string>('app.port');
const name = config.get<string>('app.name');

(async () =>{
    await start()
    app.listen(port, () => console.log(`${name} started on port ${port}.... in http://localhost:${port}`));
})()