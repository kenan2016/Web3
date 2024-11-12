package models

import (
	"fmt"
	"go-ranking/cache"
	"go-ranking/common"
	"go-ranking/dao"
	"time"
)

type User struct {
	Id         int    `json:"id"`
	Username   string `json:"username"`
	Password   string `json:"password"`
	AddTime    int64  `json:"add_time"`
	UpdateTime int64  `jsonL:"update_time"`
}

type UserApi struct {
	Id       int    `json:"id"`
	Username string `json:"username"`
}

// TableName returns the table name for the User model
func (User) TableName() string {
	return "user"
}

func (u User) GetUserByUsername(username string) (User, error) {
	user := User{Username: username}
	err := dao.Db.Where(&user).First(&user).Error
	return user, err
}

func (u User) AddUser(username string, password string) (User, error) {
	user := User{Username: username, Password: common.EncryMd5(password), AddTime: time.Now().Unix()}
	err := dao.Db.Create(&user).Error
	return user, err
}

func TestRedisCli() {

	//pong, err := cache.Rdb.Ping(cache.Rctx).Result()
	//if err != nil {
	//	panic("Redis 连接失败: " + err.Error())
	//}
	//fmt.Println("Redis 连接成功:", pong)
	cache.Rdb.Set(cache.Rctx, "name", "zhangSanFeng", 1000*time.Second)
	result, _ := cache.Rdb.Get(cache.Rctx, "name").Result()
	fmt.Println(result)
}
