package controller

import (
	"github.com/gin-gonic/gin"
	"go-ranking/common"
	"go-ranking/models"
	"go-ranking/pkg/logger"
	"strconv"
)

type UserControllerStruct struct {
}

func (u UserControllerStruct) GetUserInfo(c *gin.Context) {
	var idStr = c.PostForm("id")
	id, _ := strconv.Atoi(idStr)
	user, _ := models.User{}.GetTest(id)
	common.Succeed(1, c, user, 1, "获取用户信息成功")
}

func (u UserControllerStruct) CreateUser(context *gin.Context) {
	logger.Write("这是一个手动输出", "test")
	//defer func() {
	//	if err := recover(); err != nil {
	//		common.Failed(4004, context, err)
	//	}
	//}()
	//num1 := 1
	//num2 := 0
	//num3 := num1 / num2
	//fmt.Println(num3)
	username := context.DefaultPostForm("username", "")
	id, err := models.User{}.AddUser(username)
	if err != nil {
		common.Failed(0, context, "用户创建失败")
	}
	common.Succeed(1, context, id, 1, "用户创建成功")
}

func (u UserControllerStruct) DelUser(context *gin.Context) {
	idStr := context.DefaultPostForm("id", "")
	id, _ := strconv.Atoi(idStr)
	_, err := models.User{}.DelUser(id)
	if err != nil {
		common.Failed(0, context, "用户删除失败")
	}
	common.Succeed(1, context, nil, 1, "用户删除成功")
}

func (u UserControllerStruct) UpdateUser(context *gin.Context) {
	username := context.DefaultPostForm("username", "")
	idStr := context.DefaultPostForm("id", "")
	id, _ := strconv.Atoi(idStr)
	user := models.User{Id: id, Username: username}
	err := models.User{}.UpdateUser(&user)
	if err == nil {
		common.Succeed(1, context, nil, 1, "用户更新成功")
	}
	common.Failed(0, context, "用户删除失败")
}

func (u UserControllerStruct) GetList(context *gin.Context) {
	idStr := context.DefaultPostForm("id", "")
	id, _ := strconv.Atoi(idStr)
	err, users := models.User{}.GetList(id)
	if err != nil {
		common.Failed(0, context, "获取用户列表失败")
	}
	common.Succeed(1, context, users, int64(len(users)), "获取用户列表成功")
}
