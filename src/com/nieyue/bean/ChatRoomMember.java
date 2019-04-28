package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 聊天房成员
 *
 */
@ApiModel(value="聊天房成员",description="聊天房成员")
public class ChatRoomMember implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 聊天房成员id
     */
    @ApiModelProperty(value="聊天房成员id")
    private Integer chatRoomMemberId;
    /**
     * 类型，1私聊，2普通房，3语音房，4电影房
     */
    @ApiModelProperty(value="类型，1私聊，2普通房，3语音房，4电影房")
    private Integer type;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date createDate;
    /**
     * 更新时间
     */
    @ApiModelProperty(value="聊天房成员更新时间")
    private Date updateDate;
    /**
     * 聊天房id外键
     */
    @ApiModelProperty(value="聊天房id外键")
    private Integer chatRoomId;
    /**
     * 账户id外键
     */
    @ApiModelProperty(value="账户id外键")
    private Integer accountId;
    /**
     * 账户
     */
    @ApiModelProperty(value="账户")
    private Account account;

    public ChatRoomMember() {
    }

    public Integer getChatRoomMemberId() {
        return this.chatRoomMemberId;
    }

    public Integer getType() {
        return this.type;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public Integer getChatRoomId() {
        return this.chatRoomId;
    }

    public Integer getAccountId() {
        return this.accountId;
    }

    public Account getAccount() {
        return this.account;
    }

    public void setChatRoomMemberId(Integer chatRoomMemberId) {
        this.chatRoomMemberId = chatRoomMemberId;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public void setChatRoomId(Integer chatRoomId) {
        this.chatRoomId = chatRoomId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof ChatRoomMember)) return false;
        final ChatRoomMember other = (ChatRoomMember) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$chatRoomMemberId = this.getChatRoomMemberId();
        final Object other$chatRoomMemberId = other.getChatRoomMemberId();
        if (this$chatRoomMemberId == null ? other$chatRoomMemberId != null : !this$chatRoomMemberId.equals(other$chatRoomMemberId))
            return false;
        final Object this$type = this.getType();
        final Object other$type = other.getType();
        if (this$type == null ? other$type != null : !this$type.equals(other$type)) return false;
        final Object this$createDate = this.getCreateDate();
        final Object other$createDate = other.getCreateDate();
        if (this$createDate == null ? other$createDate != null : !this$createDate.equals(other$createDate))
            return false;
        final Object this$updateDate = this.getUpdateDate();
        final Object other$updateDate = other.getUpdateDate();
        if (this$updateDate == null ? other$updateDate != null : !this$updateDate.equals(other$updateDate))
            return false;
        final Object this$chatRoomId = this.getChatRoomId();
        final Object other$chatRoomId = other.getChatRoomId();
        if (this$chatRoomId == null ? other$chatRoomId != null : !this$chatRoomId.equals(other$chatRoomId))
            return false;
        final Object this$accountId = this.getAccountId();
        final Object other$accountId = other.getAccountId();
        if (this$accountId == null ? other$accountId != null : !this$accountId.equals(other$accountId)) return false;
        final Object this$account = this.getAccount();
        final Object other$account = other.getAccount();
        if (this$account == null ? other$account != null : !this$account.equals(other$account)) return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $chatRoomMemberId = this.getChatRoomMemberId();
        result = result * PRIME + ($chatRoomMemberId == null ? 43 : $chatRoomMemberId.hashCode());
        final Object $type = this.getType();
        result = result * PRIME + ($type == null ? 43 : $type.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        final Object $chatRoomId = this.getChatRoomId();
        result = result * PRIME + ($chatRoomId == null ? 43 : $chatRoomId.hashCode());
        final Object $accountId = this.getAccountId();
        result = result * PRIME + ($accountId == null ? 43 : $accountId.hashCode());
        final Object $account = this.getAccount();
        result = result * PRIME + ($account == null ? 43 : $account.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof ChatRoomMember;
    }

    public String toString() {
        return "ChatRoomMember(chatRoomMemberId=" + this.getChatRoomMemberId() + ", type=" + this.getType() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", chatRoomId=" + this.getChatRoomId() + ", accountId=" + this.getAccountId() + ", account=" + this.getAccount() + ")";
    }
}



