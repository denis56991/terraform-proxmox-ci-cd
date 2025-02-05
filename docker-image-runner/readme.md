# Образ для gitlab-ranner, работающего в России
В файле `.terraformrc` прописано зеркало от Яндекс, для работы terraform в России.

1. Устанавливаем docker, собираем образ на сервере с установленным gitlab-runner
```bash
docker build -t mirror-yandex-terraform:latest .
```

2. Проверяем что он нам доступен локально
```bash
docker images
```

3. Добовляем ranner в наш gitlab, executor выбираем `docker`, image указываем любой удобный, в моем примере был выбран `ubuntu:latest` (чтобы использовать собранный выше docker image все равно будем указывать его в `.gitlab-ci.yml`)

4. Открываем `vi /etc/gitlab-runner/config.toml`, проверяем прописан ли параметр `pull_policy = "if-not-present"` у добавленного нами runner, если нет, то прописываем, чтобы gitlab-runner мог обратиться к локальным docker образам.
```toml
[[runners]]
  name = "docker-runner"
  url = "https://my-gitlab.ru/"
  id = 4
  token = "glrt-t3_***************"
  token_obtained_at = 2000-01-01T00:00:00Z
  token_expires_at = 0001-01-01T00:00:00Z
  executor = "docker"
  [runners.custom_build_dir]
  [runners.cache]
    MaxUploadedArchiveSize = 0
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]
  [runners.docker]
    tls_verify = false
    image = "ubuntu:latest"
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
    network_mtu = 0
    pull_policy = "if-not-present"
```

