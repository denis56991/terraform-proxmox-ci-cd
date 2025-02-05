# Используем официальный образ Terraform как базовый
FROM hashicorp/terraform:latest

# Копируем .terraformrc в контейнер
COPY .terraformrc /root/.terraformrc

# Указываем рабочую директорию
WORKDIR /workspace

