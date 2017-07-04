Ref: https://github.com/0xbug/SQLiScanner

基于 `SQLMAP` 和 `Charles` 的被动 SQL 注入漏洞扫描工具。

### 使用场景

`QA` 测试时用 `Charles` 记录 HTTP 请求，导出 HAR 文件后上传，自动扫描并邮件通知。

### Docker 容器化

创建了 4 个 docker 容器，分别为 `nginx`、`postgres`、`redis`、`web`。
其中 web 运行主程序。

### 运行

- docker-compose build
- docker-compose up -d
- docker-compose exec web python3 manage.py createsuperuser
 
### 参考

> https://www.capside.com/labs/deploying-full-django-stack-with-docker-compose/
> https://github.com/realpython/dockerizing-django
