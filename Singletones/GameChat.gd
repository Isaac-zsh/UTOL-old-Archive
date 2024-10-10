extends Node2D

func _ready():
	var discord_bot = $DiscordBot
	discord_bot.TOKEN = "redacted"
	discord_bot.login()
	discord_bot.connect("bot_ready", self, "_on_DiscordBot_bot_ready")
	pass

func _on_DiscordBot_bot_ready(bot: DiscordBot):
	print('Logged in as ' + bot.user.username + '#' + bot.user.discriminator)
	print('Listening on ' + str(bot.channels.size()) + ' channels and ' + str(bot.guilds.size()) + ' guilds.')
	pass


func _on_DiscordBot_message_create(bot, message, channel):
	$TextEdit.text += message.author.username+"#"+message.author.discriminator+": "+message.content + "\n"
	pass # Replace with function body.

func _on_Button_pressed():
	$DiscordBot.send("944199463755464757", "SpringLock: "+str($LineEdit.text))
	pass # Replace with function body.
