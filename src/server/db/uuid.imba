def createID
	const chars = "abcdefghijkmnopqrstuvwxyz0123456789"
	# Custom base 35 encoding function to avoid 'l'
	def encodeBase35 num
		let encoded = ""
		while num > 0
			const remainder = num % 35
			encoded = chars[remainder] + encoded
			num = Math.floor(num / 35)
		encoded

	const timestamp = encodeBase35(Date.now!)
	const randomLength = 4
	let random = ''
	for i in [0 .. randomLength]
		const randomIndex = Math.floor(Math.random! * chars.length)
		random += chars[randomIndex]
	# Combine the timestamp and random part
	const id = timestamp + random
	id.split("").reverse!.join("")

export default createID
# Example usage:
# const uuid = createID!
# console.log uuid