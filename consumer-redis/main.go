package main

import (
	"context"
	"fmt"
	"os"

	dotenv "github.com/joho/godotenv"
	"github.com/redis/go-redis/v9"
)

func main() {
	dotenv.Load()

	redisUrl := os.Getenv("REDIS_ADDRESS")

	fmt.Println("Iniciando o Consumer da Fila do redis")
	fmt.Printf("Redis Url: %s\n", redisUrl)

	client := redis.NewClient(&redis.Options{
		Addr: redisUrl,
	})

	for {
		messages, err := client.XRead(
			context.Background(),
			&redis.XReadArgs{
				Streams: []string{"migration.public.anuncios", "$"},
				Block:   0,
				Count:   1,
			}).Result()

		if err != nil {
			fmt.Println("Erro ao ler a mensagem:", err)
		}

		for _, stream := range messages {
			for _, message := range stream.Messages {
				fmt.Printf("Mensagem recebida: %v\n", message)
			}
		}
	}

}
