require 'discordrb'

def rgb(r, g, b, text) 
  "\e[38;2;#{r};#{g};#{b};249m#{text}\e[0m"
end

def grey(text)
  rgb(100, 100, 100, text)
end

def clear
  system "clear"
end

def hide_cursor
  puts "\e[?25l"
end

def show_cursor
  puts "\e[?25h"
end

trap "SIGINT" do
  puts "Exiting"
  clear
  show_cursor
  exit 0
end

token = `lpass show --password discord-voice-list`.chomp
id = `lpass show --notes discord-voice-list`.chomp.split("=")[1]
bot = Discordrb::Bot.new token: token

hide_cursor

Thread.new do
  begin
    while true
      sleep 10 
      clear
      channels_raw = bot.server(id).voice_channels
      channels_by_category = channels_raw.group_by { |channel| channel.category }
      channels_by_category.map do |category, channels|
        puts "#{grey("➕")}#{category.name}"
        channels.map do |channel|
          lock = channel.role_overwrites.size > 1 ? "🔒":"  "
          channel_prefix = grey("🔊#{lock}")
          puts "  #{channel_prefix} #{channel.name}"
          channel.users.each do |user|
            deaf = user.deafened? || user.self_deafened? ? "🔇" : "🔉"
            mute = user.muted? || user.self_muted? ? "🙊" : "🎤"
            color = user.color
            puts "      #{mute}#{deaf} #{rgb(color.red, color.green, color.blue, user.nick)}"
          end
        end
      end
    end
  rescue => e
    p e
  end
end

bot.run
