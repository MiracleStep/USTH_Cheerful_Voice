package com.mirac.vo;

import com.fasterxml.jackson.annotation.JsonFormat;


@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ResponseResultVo {
    /**
     * code共4为：前两位10代表新增操作；后两位00代表成功，01代表失败
     */

    ADD_THEME_SUCCESS("1", "添加主题成功！"),
    ADD_FAILURE("-1", "用户名和密码错误"),
    UPDATE_SUCCESS("1", "修改成功！"),
    RESTORE_SUCCESS("1","恢复成功！"),
    RESTORE_FAILURE("-1","恢复失败！"),
    DELETE_SUCCESS("1", "删除成功！"),
    DELETE_ERROR("-1", "删除失败！"),
    DELETE_THEME_SUCCESS("1", "删除主题成功！"),
    DELETE_THEME_FAILURE("-11", "删除主题失败！"),
    UPDATE_FAILURE("-1", "修改失败！"),
    WEL_NEXT_LOGIN("1","欢迎下次登录！"),
    ADD_SUCCESS("1", "登陆成功"),
    ERROR_CODE("-1", "登录信息填写有误，请不要带有非法字符！"),
    USER_PASS_ERROR_LOGIN("-1","用户名或密码错误，请重新输入！"),
    BANNED("-1","你的账号已被禁用！"),
    REGISTER_FAILURE("-1","注册失败！"),
    USER_EXISTS_ERROR("-1","注册失败！用户已存在！"),
    INFO_FAILURE("-1","通知发送失败！"),
    POST_FAILURE("-1","发帖失败！"),
    POST_SUCCESSFULLY("1","发帖成功！"),
    INFO_SUCCESSFULLY("1","通知发布成功！"),
    REPLY_SUCCESSFULLY("1","回帖成功！"),
    REPLY_FAILURE("-1","回帖失败！");

    private String res;
    private String info;

    /**
     * 规定调用这个类对象的key
     */
    public static final String KEY = "pageCode";

    ResponseResultVo(String res, String info){
        this.res = res;
        this.info = info;
    }

    public String getRes() {
        return res;
    }

    public String getInfo() {
        return info;
    }

    //因为是常量，注意不能写set()方法，防止别人修改
}