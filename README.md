# 純靠北工程師 Docker 架設版

## 系統要求

- 支援 Docker 的系統皆可（？）
- Docker
- Docker Compose

## 架構

```plain
├── LICENSE ==> 此專案採用 MIT LICENSE
├── README.md ==> 你在這裡！
├── docker-compose.yml
├── web
│   ├── .env.example ==> 環境變數範例
│   ├── db ==> 資料庫
│   └── upload
│       ├── avatars ==> 使用者頭像
│       └── cards ==> 文章圖片
├── nginx
│   ├── certs ==> Nginx SSL 證書
│   ├── log ==> Nginx Log 紀錄
│   └── nginx.conf.example ==> Nginx 設定範例
└── init_engineer ==> 純靠北工程師 Docker Image
    ├── Dockerfile
    ├── README.md ==> 純靠北工程師 Docker Image 自建說明
    └── entrypoint.sh
```

## 簡單安裝

```bash
# 1. 將此專案抓下來
git clone https://github.com/tico88612/docker-init.engineer.git

# 2. 進入到專案資料夾
cd docker-init.engineer

# 3. 把 web/.env.example 複製到 web/.env
cp web/.env.example web/.env

# 4. 把 nginx/nginx.conf.example 複製到 nginx/nginx.conf
cp nginx/nginx.conf.example nginx/nginx.conf

# 5. 啟動它
docker-compose up -d
```

開啟瀏覽器，網址輸入 `http://127.0.0.1/` 就可以看到畫面了。

```plain
管理員預設帳號: admin@admin.com
管理員預設密碼: secret
```

基本上你不用調整任何參數就可以執行了，但如果需要 Production 上去，請繼續往下參考。

## 部署安裝

### 關閉 500 Debug 錯誤訊息

請把 `data/.env` 裡面的 `APP_DEBUG` 調整為 `false` 即可。

### HTTPS 設定

`nginx/certs/nginx.crt` 為 SSL 憑證。  
`nginx/certs/nginx.key` 為 SSL 金鑰。  
將上面兩個檔案個別放置完成後，把 `nginx/nginx.conf` 裡面的 `ssl_certificate` 跟 `ssl_certificate_key` 註解符號拿掉，即可使用 HTTPS 連線。

### 強制導入 HTTPS

將 `nginx/nginx.conf` 的 `rewrite` 規則取消註解即可。

## 其他

如果有任何問題歡迎發 Issue :D  
想要貢獻或改善此架構？Pull Request 當然也可以！  
總之，Enjoy it！
