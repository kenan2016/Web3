package controller

import (
	"github.com/gin-gonic/gin"
	"go-ranking/common"
)

type OrderControllerStruct struct {
}

type SearchOrder struct {
	Name  string  `json:"name"`
	Price float64 `json:"price"`
}

// 获取请求参数示例
func (o OrderControllerStruct) GetOrderInfo(c *gin.Context) {
	// 获取url 参数
	id := c.Param("id")
	name := c.Param("name")
	common.Succeed(1, c, gin.H{"id": id, "name": name}, 1, "获取订单信息成功")
}

/*
	不可以写成 err := context.BindJSON(parms)，因为 BindJSON 需要一个指针类型的参数，即传入的参数必须是指向接收数据的变量的指针。

	在 err := context.BindJSON(&parms) 中，&parms 是 parms 的指针，指向这个 map，所以 BindJSON 可以直接修改 parms 的内容，将请求中的 JSON 数据解析并赋值到 parms 中。如果写成 context.BindJSON(parms)，则传入的是 map 值的副本，BindJSON 将无法正确解析并赋值给 parms。

	为什么 BindJSON 需要指针？

	BindJSON 的参数类型是 interface{}，在 Go 中，如果要通过一个函数修改参数的内容，必须传递指针，这样函数才能直接操作参数的内存地址，进而修改参数的值。否则，如果传递的是值类型，Go 语言会复制该值，导致函数内对该副本的修改不会影响到原始变量。

	示例对比

	以下是对比：

	正确写法

	parms := make(map[string]interface{})
	err := context.BindJSON(&parms)  // 传入指针
	// 解析后 parms 中将包含 JSON 数据

	错误写法

	parms := make(map[string]interface{})
	err := context.BindJSON(parms)  // 传入值，解析无法修改 parms 内容
	// 解析不会修改 parms 的内容

	小结

	总之，context.BindJSON 需要一个指针类型的参数，因此必须使用 &parms。
*/

func (o OrderControllerStruct) CreateOrder(context *gin.Context) {
	//name := context.PostForm("name")
	//price := context.DefaultPostForm("price", "10.00")
	// 使用map接受json 数据
	//parms := make(map[string]interface{})
	//使用 Gin 的 BindJSON 方法解析 JSON 数据并将其绑定到 parms
	// 思考 这里 err := context.BindJSON(&parms) 可以写成 err := context.BindJSON(parms) 吗？
	// 不可以。

	//err := context.BindJSON(&parms)
	search := SearchOrder{}
	err := context.BindJSON(&search)
	if err == nil {
		common.Succeed(1, context, search, 10, search.Price)
	}
	//common.Succeed(1, context, name, 10, price)
}

func (o OrderControllerStruct) DelOrder(context *gin.Context) {
	common.Succeed(1, context, nil, 1, "订单删除成功")
}

func (o OrderControllerStruct) UpdateOrder(context *gin.Context) {
	common.Failed(0, context, "订单删除失败")
}
