package controller

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"go-ranking/common"
	"go-ranking/models"
	"strconv"
)

type UserControllerStruct struct {
}

func (us UserControllerStruct) Register(c *gin.Context) {
	username := c.PostForm("username")
	password := c.PostForm("password")
	rePassword := c.PostForm("rePassword")
	if username == "" || password == "" || rePassword == "" {
		common.Failed(1, c, "username or password is empty")
		return
	}

	//检验用户名是否存在
	user, err := models.User{}.GetUserByUsername(username)
	if err != nil {
		common.Failed(1, c, "register failed")
		return
	}
	if user.Id != 0 {
		common.Failed(1, c, "register failed,user exist")
		return
	}
	u, err := models.User{}.AddUser(username, password)
	if err != nil {
		common.Failed(1, c, "register failed")
		return
	}
	common.Succeed(1, c, u.Id, 1, "注册成功")
}

func (us UserControllerStruct) Login(c *gin.Context) {
	username := c.PostForm("username")
	password := c.PostForm("password")
	if username == "" || password == "" {
		common.Failed(1, c, "username or password is empty")
		return
	}
	//检验用户名是否存在
	user, err := models.User{}.GetUserByUsername(username)
	if err != nil {
		common.Failed(1, c, "login failed")
		return
	}
	if user.Id == 0 {
		common.Failed(1, c, "login failed,user not exist")
		return
	}
	if user.Password != common.EncryMd5(password) {
		common.Failed(1, c, "login failed,password error")
		return
	}
	// 记录用户 信息到session
	session := sessions.Default(c)
	session.Set("login:"+strconv.Itoa(user.Id), user.Id)
	session.Save()
	userApi := models.UserApi{Id: user.Id, Username: user.Username}
	common.Succeed(1, c, userApi, 1, "登录成功")
}

func (us UserControllerStruct) TestRedisCli(context *gin.Context) {
	models.TestRedisCli()
}
