import { Pool } from 'pg';

import { trace } from '@opentelemetry/api';

const pool = new Pool({
    user: 'todo_user',
    host: 'localhost',
    database: 'todo_db',
    password: 'todo_password',
    port: 5432,
});

export async function load() {
    try {
        const users =  await getAllUsers();

        const usersWithTodos: UserWithTodos[] = [];
        for (const user of users) {
            const todos = await getTodosForUser(user.id);
            usersWithTodos.push({
                ...user,
                todos
            });
        }

        // const usersWithTodos = await Promise.all(
        //     users.map(async (user) => ({
        //         ...user,
        //         todos: await getTodosForUser(user.id)
        //     }))
        // );

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

interface UserWithTodos extends User {
    todos: Todo[];
}

async function getAllUsers(): Promise<Array<User>> {
    return trace.getTracer('demo-todo-app').startActiveSpan('getAllUsers', async (span) => {
        const usersResult = await pool.query(`
            SELECT id, username, email
            FROM users`);
        span.end();

        return usersResult.rows;
    });
}

async function getTodosForUser(userId: number): Promise<Array<Todo>> {
    return trace.getTracer('demo-todo-app').startActiveSpan('getTodosForUser', async (span) => {
        const todosResult = await pool.query(`
            SELECT id, title, description, completed
            FROM todos
            WHERE user_id = $1
    `, [userId]);

        await new Promise(resolve => setTimeout(resolve, Math.random() * 100));

        span.end();
        return todosResult.rows;
    });
}