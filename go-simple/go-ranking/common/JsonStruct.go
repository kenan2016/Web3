package common

import (
	"crypto/md5"
	"encoding/hex"
	"github.com/gin-gonic/gin"
	"net/http"
)

// json返回的数据结构
type JsonStruct struct {
	Code  int         `json:"code"`
	Data  interface{} `json:"data"`
	Count int64       `json:"count"`
	Msg   interface{} `json:"msg"`
}

type ErrorStruct struct {
	Code int         `json:"code"`
	Msg  interface{} `json:"msg"`
}

func Succeed(code int, c *gin.Context, data interface{}, count int64, msg interface{}) {
	json := &JsonStruct{code, data, count, msg}
	c.JSON(http.StatusOK, json)
}

func Failed(code int, c *gin.Context, msg interface{}) {
	json := &ErrorStruct{code, msg}
	c.JSON(http.StatusOK, json)
}

func EncryMd5(s string) string {
	ctx := md5.New()
	ctx.Write([]byte(s))
	return hex.EncodeToString(ctx.Sum(nil))
}

//func Demo(code int, c *gin.Context, msg interface{}) {
//	json := &JsonStruct{Code: code, Msg: msg}
//	c.JSON(http.StatusOK, json)
//}

/**
补充一个 关于 类型的值实例 和 类型的指针实例 区别、

&JsonStruct{} 和 JsonStruct{} 在 Go 中的区别在于它们的内存分配和类型。
	1.	JsonStruct{}：表示创建一个 JsonStruct 类型的值实例。
	•	直接使用 JsonStruct{} 会在栈上分配一个 JsonStruct 类型的值，表示这个结构体的值本身。
	•	当你使用 JsonStruct{} 时，得到的是一个结构体的副本。
	2.	&JsonStruct{}：表示创建一个 JsonStruct 类型的指针实例。
	•	使用 &JsonStruct{} 会在堆上分配结构体值并返回一个指向该值的指针（类型为 *JsonStruct）。
	•	返回的指针允许你直接修改结构体字段，而不会产生副本。

示例

假设有以下 JsonStruct 结构体：

type JsonStruct struct {
    Code int
    Msg  string
}

然后我们来对比两种创建方式的不同：

// 创建一个 JsonStruct 值实例
jsonValue := JsonStruct{Code: 200, Msg: "Success"}

// 创建一个 JsonStruct 指针实例
jsonPointer := &JsonStruct{Code: 200, Msg: "Success"}

使用场景

	•	值实例 (JsonStruct{})：
	•	适合在不需要对原始数据进行修改或传递副本时使用。
	•	不适合处理大量数据，因为每次传递时都会复制结构体的数据。
	•	指针实例 (&JsonStruct{})：
	•	适合在需要修改结构体字段，或在函数中传递以节省内存时使用。
	•	对于较大结构体，指针实例更高效，因为不需要复制整个结构体。

示例：在函数中传递

func modifyValue(js JsonStruct) {
    js.Code = 500 // 只会修改副本
}

func modifyPointer(js *JsonStruct) {
    js.Code = 500 // 修改指针所指向的原始数据
}

func main() {
    jsValue := JsonStruct{Code: 200, Msg: "Original"}
    modifyValue(jsValue)
    fmt.Println(jsValue.Code) // 输出: 200 (未修改)

    jsPointer := &JsonStruct{Code: 200, Msg: "Original"}
    modifyPointer(jsPointer)
    fmt.Println(jsPointer.Code) // 输出: 500 (已修改)
}

总结

	•	JsonStruct{}：创建结构体的值实例，每次使用时生成一个副本。
	•	&JsonStruct{}：创建结构体的指针实例，直接操作原始数据，更节省内存。
*/
