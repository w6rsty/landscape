# 一个记事簿小程序
想法是像flutter一样everything is widget, 每个部分模块化
但实现每个模块之间的关联需要复杂的状态管理，所以只实现了拼接而没有联系

## 0.1：11/6
### statefulwidget传参：
（破案了，直接用构造函数传参就行了）
card并没有实例化
    导致：
    Draggable和DraggableTarget的data传递问题
    ListView.builder需要重写
        导致：ListView的懒加载使数据无法保存
        （实际不会创建太多card
            并且每个card都有意义）
    无法删除card（需要重写储存数据方式）
cube的继承
### Widget使用混乱（基本解决）

### 未完成：
cube的animatedcontainer，

多种cube

(完成一个基本Text组件，
其他Color组件类似，但要设计可行的保存状态方式)

## 0.2： 11/6
### 一个解决方案：
内部状态维持，KeepAlive
AutomaticKeepAliveClientMixin

### 对Item的管理，要用到状态提升
（目前解决方法是将数据存在一个cardData对象中）
