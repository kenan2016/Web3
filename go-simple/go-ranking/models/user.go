package models

import "go-ranking/dao"

type User struct {
	Id       int    `json:"id"`
	Username string `json:"username"`
}

// TableName returns the table name for the User model
func (User) TableName() string {
	return "user"
}

func (User) GetTest(id int) (User, error) {
	var user User
	err := dao.Db.Where("id = ?", id).First(&user).Error
	return user, err
}
