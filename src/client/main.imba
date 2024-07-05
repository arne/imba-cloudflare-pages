global css body m:2 ff:Inter
global css h1,h2,h3,h4,h5,h6 ff:Inter fw:50
global css a m:0 c:black/80 td:none bdb: thin solid blue4
global css p m:0 c:black/80

class API
	def allTodos
		const res = await window.fetch('/api/todos')
		await res.json!

	def addTodo title
		const res = await window.fetch '/api/todos/add', {
			method: 'POST'
			headers: { 'Content-Type': 'application/json' }
			body: JSON.stringify(title)
			}
		await res.json!

	def toggleTodo id
		const res = await window.fetch `/api/todos/toggle/{id}`, {
			method: 'POST'
			}

const api = new API!

let todos = []

tag app
	newTodo = ""

	def mount
		todos = await api.allTodos!

	def submit 
		return if newTodo == ""
		const res = await api.addTodo newTodo
		todos.unshift {id: res.id, title: newTodo, done: false}
		newTodo = ""

	def toggle id
		const res = await window.fetch `/api/todos/toggle/{id}`, {
			method: 'POST'
			}
		if res.status == 200
			const todo = todos.find do(todo) todo.id === id
			todo.done = !todo.done

	<self[maw:32rem w@xs:100% m:0 auto]>
		<div>
			<h1[fw:500 mt:4 mb:2]> "Todos"
			<p[p:2 mb:4 bg:blue1 rd:md bd:thin solid blue4]> "See " 
				<a href="https://github.com/arne/imba-cloudflare-pages">
					"https://github.com/arne/imba-cloudflare-pages"
		<div>
			<form @submit.prevent=submit>
				<input[p:2 mr:2 fs:1rem rd:xl bd:2px solid blue4] placeholder="Add a todo" bind=newTodo>
				<button[p:2 fs:1rem rd:xl bg:blue6 c:white bc:blue6]> "Add"
		<ul[list-style:none p:0]>
			for todo in todos
				<li
					[cursor:pointer]
					[td:line-through c:black/30]=todo.done
					@click=toggle(todo.id)
				> todo.title

imba.mount <app>
