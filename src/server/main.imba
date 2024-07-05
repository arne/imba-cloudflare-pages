import { Router } from '@tsndr/cloudflare-worker-router'
import Database from "./db/main.imba"
const router = new Router!

def jsonRes data
	return new Response JSON.stringify(data), {headers: {"Content-Type": "application/json"}}

def fetch req, env, ctx
	const db = new Database env.DB
	router.get "/api/todos", do jsonRes await db.allTodos!
	router.post "/api/todos/add", do({req}) jsonRes await db.addTodo await req.json!
	router.post "/api/todos/toggle/:id", do({req}) jsonRes await db.toggleTodo req.params.id
	router.get "*", do jsonRes {error: "Not found"} 

	router.handle req, env, ctx

export default { fetch }
