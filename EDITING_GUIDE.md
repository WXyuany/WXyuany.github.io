# 个人主页修改说明

日常修改优先只打开 `_data/profile.yml`。保存后，浏览器会自动刷新本地预览。

## 修改个人资料

```yaml
author:
  name: "你的英文名"
  avatar: "你的头像文件名.png"
  pronouns: ""
  bio: "一句话简介"
  location: "城市, 国家"
  employer: "学校或单位"
  email: "你的邮箱"
```

头像放到 `images/`，例如 `images/avatar.jpg`，配置写 `avatar: "avatar.jpg"`。

## 修改首页文字和链接

编辑 `home` 下的 `intro`、`advisor`、`cv_url` 和 `links`。文本支持 Markdown，链接格式为 `[显示文字](https://example.com)`。

上传 CV 到 `files/` 后，把 `cv_url` 写成 `/files/文件名.pdf`。

## 修改社交账号

在 `author` 中填写 `github`、`googlescholar`、`orcid`、`zhihu` 或 `linkedin`。没有账号的项目保留空字符串。

## 添加内容

- 论文：复制并修改 `_publications/` 下的 `.md` 文件
- 演讲：复制并修改 `_talks/` 下的 `.md` 文件
- 教学：复制并修改 `_teaching/` 下的 `.md` 文件
- 项目：复制并修改 `_portfolio/` 下的 `.md` 文件
- 博客：复制并修改 `_posts/` 下的 `.md` 文件，文件名使用 `YYYY-MM-DD-title.md`

每个文件开头 `---` 之间是配置区，修改 `title`、`date`、`venue`、`excerpt` 和链接等字段。

## 修改导航栏

编辑 `_data/navigation.yml`：

```yaml
- title: "页面名称"
  url: /页面地址/
```

## 本地查看

```bash
cd /Users/yuany/Downloads/WXyuany.github.io
./scripts/local_preview.sh
```

然后打开 <http://127.0.0.1:4000>。修改 Markdown、YAML、HTML 或 SCSS 后会自动重新生成并刷新。

修改 `_config.yml` 后需要按 `Ctrl+C` 停止服务，再重新运行启动命令。不要直接修改 `_site/`，它是自动生成的预览文件。
