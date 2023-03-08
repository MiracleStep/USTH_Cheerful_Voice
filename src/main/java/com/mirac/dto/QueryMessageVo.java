package com.mirac.dto;

import com.mirac.entity.MessageCriteria;
import com.mirac.util.Page;

public class QueryMessageVo {
    private MessageCriteria messageCriteria;
    private Page page;

    @Override
    public String toString() {
        return "QueryMessageVo{" +
                "messageCriteria=" + messageCriteria +
                ", page=" + page +
                '}';
    }

    public MessageCriteria getMessageCriteria() {
        return messageCriteria;
    }

    public void setMessageCriteria(MessageCriteria messageCriteria) {
        this.messageCriteria = messageCriteria;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
}
