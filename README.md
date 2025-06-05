# YouTube, Instagram, TikTok, X (Twitter), Spotify, Pinterest downloader bot


A telegram bot for downloading videos from YouTube, Instagram, TikTok, X (Twitter), Spotify and Pinterest

## Run Locally
```bash
$ git clone https://github.com/anekobtw/youtube-dl-bot.git
$ cd bot
$ pip install -r requirements.txt
$ python main.py
```


run with uv -- "uv run --env-file=.env  main.py"

# Сборка образа
docker build -t inst_youtube_bot .

# Запуск контейнера
docker run -e BOT_TOKEN=""" -d --name bot inst_youtube_bot