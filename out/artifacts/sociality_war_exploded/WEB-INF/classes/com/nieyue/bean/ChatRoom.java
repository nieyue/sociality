package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 聊天房
 *
 */
@ApiModel(value="聊天房",description="聊天房")
public class ChatRoom implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 聊天房id
     */
    @ApiModelProperty(value="聊天房id")
    private Integer chatRoomId;
    /**
     * 类型，1语音房，2电影房
     */
    @ApiModelProperty(value="类型，1语音房，2电影房")
    private Integer type;
    /**
     * 名称
     */
    @ApiModelProperty(value="名称")
    private String name;
    /**
     * 语音或电影url
     */
    @ApiModelProperty(value="语音或电影url")
    private String url;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date createDate;
    /**
     * 更新时间
     */
    @ApiModelProperty(value="聊天房更新时间")
    private Date updateDate;
    /**
     * 账户id外键
     */
    @ApiModelProperty(value="账户id外键")
    private Integer accountId;

    public ChatRoom() {
    }
    public Integer getChatRoomId() {
        return this.chatRoomId;
    }

    public Integer getType() {
        return this.type;
    }

    public String getName() {
        return this.name;
    }

    public String getUrl() {
        return this.url;
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

    public void setChatRoomId(Integer chatRoomId) {
        this.chatRoomId = chatRoomId;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof ChatRoom)) return false;
        final ChatRoom other = (ChatRoom) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$chatRoomId = this.getChatRoomId();
        final Object other$chatRoomId = other.getChatRoomId();
        if (this$chatRoomId == null ? other$chatRoomId != null : !this$chatRoomId.equals(other$chatRoomId))
            return false;
        final Object this$type = this.getType();
        final Object other$type = other.getType();
        if (this$type == null ? other$type != null : !this$type.equals(other$type)) return false;
        final Object this$name = this.getName();
        final Object other$name = other.getName();
        if (this$name == null ? other$name != null : !this$name.equals(other$name)) return false;
        final Object this$url = this.getUrl();
        final Object other$url = other.getUrl();
        if (this$url == null ? other$url != null : !this$url.equals(other$url)) return false;
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
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $chatRoomId = this.getChatRoomId();
        result = result * PRIME + ($chatRoomId == null ? 43 : $chatRoomId.hashCode());
        final Object $type = this.getType();
        result = result * PRIME + ($type == null ? 43 : $type.hashCode());
        final Object $name = this.getName();
        result = result * PRIME + ($name == null ? 43 : $name.hashCode());
        final Object $url = this.getUrl();
        result = result * PRIME + ($url == null ? 43 : $url.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        final Object $accountId = this.getAccountId();
        result = result * PRIME + ($accountId == null ? 43 : $accountId.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof ChatRoom;
    }

    public String toString() {
        return "ChatRoom(chatRoomId=" + this.getChatRoomId() + ", type=" + this.getType() + ", name=" + this.getName() + ", url=" + this.getUrl() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", accountId=" + this.getAccountId() + ")";
    }
}



