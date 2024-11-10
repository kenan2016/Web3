package main

import (
	"github.com/gin-gonic/gin"
	config "myproject/conf"
	"myproject/controllers"
	"myproject/models"
)

func main() {
	r := gin.Default()

	config.ConnectDatabase()
	//在 main.go 文件中连接数据库后，自动迁移数据表：
	config.DB.AutoMigrate(&models.User{})

	r.POST("/users", controllers.CreateUser)
	r.GET("/users", controllers.GetUsers)
	r.GET("/users/:id", controllers.GetUserById)

	r.Run(":8080")
}
