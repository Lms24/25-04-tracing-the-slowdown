import { Pool } from 'pg';

const pool = new Pool({
    user: 'todo_user',
    host: 'localhost',
    database: 'todo_db',
    password: 'todo_password',
    port: 5432,
});

export async function load() {
    try {
        const users = await getAllUsers();

        const usersWithTodos = await Promise.all(
            users.map(async (user) => ({
                ...user,
                todos: await getTodosForUser(user.id)
            }))
        );

        return {
            users: usersWithTodos
        };
    } catch (error) {
        console.error('Database error:', error);
        return {
            users: [],
            error: 'Failed to load data'
        };
    }
}

interface User {
    id: number;
    username: string;
    email: string;
}

interface Todo {
    id: number;
    title: string;
    description: string;
    completed: boolean;
}

async function getAllUsers(): Promise<Array<User>> {
    const usersResult = await pool.query(`
        SELECT id, username, email
        FROM users
    `);

    return usersResult.rows;
}

async function getTodosForUser(userId: number): Promise<Array<Todo>> {
    const todosResult = await pool.query(`
        SELECT id, title, description, completed
        FROM todos
        WHERE user_id = $1
    `, [userId]);

    const delay = Math.random() * 2000;
    await new Promise(resolve => setTimeout(resolve, delay));

    return todosResult.rows;
}