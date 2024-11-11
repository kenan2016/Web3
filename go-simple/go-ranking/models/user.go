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
func (User) AddUser(username string) (int, error) {
	user := User{Username: username}
	err := dao.Db.Create(&user).Error
	return user.Id, err
}

func (User) DelUser(id int) (int, error) {
	err := dao.Db.Delete(&User{}, id).Error
	return id, err
}

func (User) UpdateUser(user *User) error {
	err := dao.Db.Model(&user).Updates(User{Username: user.Username}).Error
	return err
}

func (u User) GetList(id int) (error, []User) {
	var users []User
	err := dao.Db.Where("id < ?", id).Find(&users).Error
	return err, users
}
