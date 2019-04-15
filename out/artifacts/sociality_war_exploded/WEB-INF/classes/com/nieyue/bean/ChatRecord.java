package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 聊天记录
 *
 */
@ApiModel(value="聊天记录",description="聊天记录")
public class ChatRecord implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 聊天记录id
     */
    @ApiModelProperty(value="聊天记录id")
    private Integer chatRecordId;
    /**
     * 内容
     */
    @ApiModelProperty(value="内容")
    private String content;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date createDate;
    /**
     * 更新时间
     */
    @ApiModelProperty(value="聊天记录更新时间")
    private Date updateDate;
    /**
     * 账户id外键
     */
    @ApiModelProperty(value="账户id外键")
    private Integer accountId;
    /**
     * 接收方账户id外键
     */
    @ApiModelProperty(value="接收方账户id外键")
    private Integer toAccountId;

    public ChatRecord() {
    }

    public Integer getChatRecordId() {
        return this.chatRecordId;
    }

    public String getContent() {
        return this.content;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public Integer getAccountId() {
        return this.accountId;
    }

    public Integer getToAccountId() {
        return this.toAccountId;
    }

    public void setChatRecordId(Integer chatRecordId) {
        this.chatRecordId = chatRecordId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public void setToAccountId(Integer toAccountId) {
        this.toAccountId = toAccountId;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof ChatRecord)) return false;
        final ChatRecord other = (ChatRecord) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$chatRecordId = this.getChatRecordId();
        final Object other$chatRecordId = other.getChatRecordId();
        if (this$chatRecordId == null ? other$chatRecordId != null : !this$chatRecordId.equals(other$chatRecordId))
            return false;
        final Object this$content = this.getContent();
        final Object other$content = other.getContent();
        if (this$content == null ? other$content != null : !this$content.equals(other$content)) return false;
        final Object this$createDate = this.getCreateDate();
        final Object other$createDate = other.getCreateDate();
        if (this$createDate == null ? other$createDate != null : !this$createDate.equals(other$createDate))
            return false;
        final Object this$updateDate = this.getUpdateDate();
        final Object other$updateDate = other.getUpdateDate();
        if (this$updateDate == null ? other$updateDate != null : !this$updateDate.equals(other$updateDate))
            return false;
        final Object this$accountId = this.getAccountId();
        final Object other$accountId = other.getAccountId();
        if (this$accountId == null ? other$accountId != null : !this$accountId.equals(other$accountId)) return false;
        final Object this$toAccountId = this.getToAccountId();
        final Object other$toAccountId = other.getToAccountId();
        if (this$toAccountId == null ? other$toAccountId != null : !this$toAccountId.equals(other$toAccountId))
            return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $chatRecordId = this.getChatRecordId();
        result = result * PRIME + ($chatRecordId == null ? 43 : $chatRecordId.hashCode());
        final Object $content = this.getContent();
        result = result * PRIME + ($content == null ? 43 : $content.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        final Object $accountId = this.getAccountId();
        result = result * PRIME + ($accountId == null ? 43 : $accountId.hashCode());
        final Object $toAccountId = this.getToAccountId();
        result = result * PRIME + ($toAccountId == null ? 43 : $toAccountId.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof ChatRecord;
    }

    public String toString() {
        return "ChatRecord(chatRecordId=" + this.getChatRecordId() + ", content=" + this.getContent() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", accountId=" + this.getAccountId() + ", toAccountId=" + this.getToAccountId() + ")";
    }
}



