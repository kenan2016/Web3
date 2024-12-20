package router

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/redis"
	"github.com/gin-gonic/gin"
	"go-ranking/config"
	"go-ranking/controller"
	"go-ranking/pkg/logger"
)

// Router 路由,这里方法名要大写,因为要导出出去，在别的包里使用
func Router() *gin.Engine {
	r := gin.Default()
	// 日志相关代码
	r.Use(gin.LoggerWithConfig(logger.LoggerToFile()))
	r.Use(logger.Recover)

	// 配置 Redis 存储会话
	store, _ := redis.NewStore(10, "tcp", config.RedisAddr, config.Password, []byte("secret"))
	r.Use(sessions.Sessions("mysession", store))

	userGroup := r.Group("/user")
	// 注意这里,他们不是一起的。
	{
		userGroup.POST("/register", controller.UserControllerStruct{}.Register)
		userGroup.POST("/login", controller.UserControllerStruct{}.Login)
		userGroup.GET("/testRedisCli", controller.UserControllerStruct{}.TestRedisCli)
	}

	// 获取请求参数示例
	orderGroup := r.Group("/order")
	{
		orderGroup.GET("/info/:id/:name", controller.OrderControllerStruct{}.GetOrderInfo)
		orderGroup.POST("/create", controller.OrderControllerStruct{}.CreateOrder)
	}
	return r
}
