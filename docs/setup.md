# setup

1. $make init
2. localhost:${WEB_PORT} を開いて設定
3. LocalSettings.phpをmediawikiフォルダにダウンロード
4. docker-compose.ymlを開き25行目のコメントアウトを解除
5. $make restart
6. [https://blog.r9g.net/archives/366(外部サイト)](https://blog.r9g.net/archives/366) を参考にCirrusSearchの設定 ※$wgCirrusSearchServers = [ 'elasticsearch' ]; // ここlocalhostにしないように
