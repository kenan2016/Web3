package router

import (
	"github.com/gin-gonic/gin"
	"go-ranking/controller"
	"go-ranking/pkg/logger"
)

// Router 路由,这里方法名要大写,因为要导出出去，在别的包里使用
func Router() *gin.Engine {
	r := gin.Default()
	// 日志相关代码
	r.Use(gin.LoggerWithConfig(logger.LoggerToFile()))
	r.Use(logger.Recover)

	userGroup := r.Group("/user")
	// 注意这里,他们不是一起的。
	{
		userGroup.GET("/info", controller.UserControllerStruct{}.GetUserInfo)
		//userGroup.GET("/list", func(c *gin.Context) {
		//	c.JSON(http.StatusOK, gin.H{"message": "list"})
		//})
		userGroup.GET("/create", controller.UserControllerStruct{}.CreateUser)

		//userGroup.DELETE("/delete", controller.DelUser)
		userGroup.GET("/delete", controller.UserControllerStruct{}.DelUser)

		userGroup.PUT("/put", controller.UserControllerStruct{}.UpdateUser)
	}

	// 获取请求参数示例
	orderGroup := r.Group("/order")
	{
		orderGroup.GET("/info/:id/:name", controller.OrderControllerStruct{}.GetOrderInfo)
		orderGroup.POST("/create", controller.OrderControllerStruct{}.CreateOrder)
	}
	return r
}
