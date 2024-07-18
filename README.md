# 基于NLP的高校交流系统设计与实现
## 本科毕业设计
本设计主要工作包括以下几点：
* 设计并完成了基于B/S架构模式的高校交流系统。该系统使用SpringBoot框架技术构建，项目设计规范采用DAO和MVC设计模式。系统前台提供给用户使用，用于查看通知公告、交流沟通、信息修改等功能。系统包含针对普通用户的登录、注册、信息修改、发帖问答、问题回复、重要通知等功能模块，以及针对管理员用户的通知和帖子的修改、删除、添加、信息统计等功能模块。
* 为了提高了交流系统的信息组织效率，降低了管理员的审核负担。设计并实现了一种基于Word2Vec预训练词向量和Attention注意力机制的Bi-LSTM模型，用于系统的文本分类任务。该模型采用了引入了word和n-gram上下文特征表示的Word2vec预训练词向量作为文本的语义表示，从而大大提升了文本的识别精度，而且能够更加灵活地处理各种复杂的数据集。（暂不提供，可根据接口融合自己的模型或开源模型）

## 项目介绍
被评为：本科优秀毕业设计。

本项目完成毕业设计的后端部分，基于SpringBoot搭建 + Tomcat JSP渲染。
项目内容同时包含后端源代码和JSP页面(JSP只做部分页面内容渲染，页面主要动态内容则通过ajax请求后端数据, 因此未做先后端分离设计)。

## 设计内容
完成了基本的校园交流模块：
* 用户登录、发帖、交流等功能的前端功能模块
* 管理员后台管理模块
