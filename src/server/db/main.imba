import createID from './uuid.imba'

class Database
	constructor cloudflareDB
		db = cloudflareDB

	def allTodos
		const response = await db
			.prepare('SELECT * FROM todos ORDER BY created_at DESC')
			.all!
		return response.results

	def addTodo title
		const id = createID!
		await db
			.prepare('INSERT INTO todos (id, title) VALUES (?, ?)')
			.bind(id, title)
			.run!
		id

	def toggleTodo id
		console.log id
		await db
			.prepare('''
				UPDATE todos
					SET done = CASE 
						WHEN done = 0 THEN 1
						ELSE 0
					END,
					updated_at = datetime('now')
					WHERE id = ?
				''')
			.bind(id)
			.run!

export default Database