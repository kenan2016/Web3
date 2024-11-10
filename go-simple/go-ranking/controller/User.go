package controller

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go-ranking/common"
	"go-ranking/pkg/logger"
)

type UserControllerStruct struct {
}

func (u UserControllerStruct) GetUserInfo(c *gin.Context) {
	common.Failed(4004, c, "没有相关信息")
}

func (u UserControllerStruct) CreateUser(context *gin.Context) {
	logger.Write("这是一个手动输出", "test")
	//defer func() {
	//	if err := recover(); err != nil {
	//		common.Failed(4004, context, err)
	//	}
	//}()
	num1 := 1
	num2 := 0
	num3 := num1 / num2
	fmt.Println(num3)
	common.Succeed(1, context, nil, 1, "用户创建成功")
}

func (u UserControllerStruct) DelUser(context *gin.Context) {
	common.Succeed(1, context, nil, 1, "用户删除成功")
}

func (u UserControllerStruct) UpdateUser(context *gin.Context) {
	common.Failed(0, context, "用户删除失败")
}
