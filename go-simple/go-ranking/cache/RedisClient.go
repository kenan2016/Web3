package cache

import (
	"context"
	"github.com/redis/go-redis/v9"
	"go-ranking/config"
)

var (
	Rdb  *redis.Client
	Rctx context.Context
)

func init() {
	Rdb = redis.NewClient(&redis.Options{
		Addr:     config.RedisAddr,
		Password: config.Password,
		DB:       config.RedisDB,
	})
	Rctx = context.Background()
}
