package dao

import (
	"go-ranking/config"
	"go-ranking/pkg/logger"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"time"
)

var (
	Db  *gorm.DB
	err error
)

func init() {
	Db, err = gorm.Open(mysql.Open(config.Mysqldb), &gorm.Config{})

	// ----------------------- Connection Pool Settings -----------------------
	// SetMaxIdleConns sets the maximum number of connections in the idle connection pool.
	sqlDB, err := Db.DB()
	if err != nil {
		logger.Error(map[string]interface{}{"database error": err.Error()})
		return
	}
	sqlDB.SetMaxIdleConns(10)

	// SetMaxOpenConns sets the maximum number of open connections to the database.
	sqlDB.SetMaxOpenConns(100)

	// SetConnMaxLifetime sets the maximum amount of time a connection may be reused.
	sqlDB.SetConnMaxLifetime(time.Hour)

}
