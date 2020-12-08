require 'discordrb'

token = `lpass show --password discord-voice-list`.chomp
id = `lpass show --notes discord-voice-list`.chomp.split("=")[1]
bot = Discordrb::Bot.new token: token

Thread.new do
  begin
    while true
      sleep 5
      system("clear")
      channels = bot.server(id).voice_channels
      channels.map do |channel|
        puts "🔊 #{channel.name}"
        channel.users.each do |user|
          deaf = user.deafened? || user.self_deafened? ? "🔕" : "🎧"
          mute = user.muted? || user.self_muted? ? "🔇" : "🔉"
          color = user.color
          puts "  #{mute}#{deaf} \e[38;2;#{color.red};#{color.green};#{color.blue};249m#{user.nick}\e[0m"
        end
      end
    end
  rescue => e
    p e
  end
end

bot.run
