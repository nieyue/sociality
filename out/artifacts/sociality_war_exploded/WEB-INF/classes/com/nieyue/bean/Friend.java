package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 好友
 *
 */
@ApiModel(value="好友",description="好友")
public class Friend implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 好友id
     */
    @ApiModelProperty(value="好友id")
    private Integer friendId;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date createDate;
    /**
     * 更新时间
     */
    @ApiModelProperty(value="好友更新时间")
    private Date updateDate;
    /**
     * 账户id外键
     */
    @ApiModelProperty(value="账户id外键")
    private Integer accountId;
    /**
     * 好友id外键
     */
    @ApiModelProperty(value="好友id外键")
    private Integer friendAccountId;

    public Friend() {
    }

    public Integer getFriendId() {
        return this.friendId;
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

    public Integer getFriendAccountId() {
        return this.friendAccountId;
    }

    public void setFriendId(Integer friendId) {
        this.friendId = friendId;
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

    public void setFriendAccountId(Integer friendAccountId) {
        this.friendAccountId = friendAccountId;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof Friend)) return false;
        final Friend other = (Friend) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$friendId = this.getFriendId();
        final Object other$friendId = other.getFriendId();
        if (this$friendId == null ? other$friendId != null : !this$friendId.equals(other$friendId)) return false;
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
        final Object this$friendAccountId = this.getFriendAccountId();
        final Object other$friendAccountId = other.getFriendAccountId();
        if (this$friendAccountId == null ? other$friendAccountId != null : !this$friendAccountId.equals(other$friendAccountId))
            return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $friendId = this.getFriendId();
        result = result * PRIME + ($friendId == null ? 43 : $friendId.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        final Object $accountId = this.getAccountId();
        result = result * PRIME + ($accountId == null ? 43 : $accountId.hashCode());
        final Object $friendAccountId = this.getFriendAccountId();
        result = result * PRIME + ($friendAccountId == null ? 43 : $friendAccountId.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof Friend;
    }

    public String toString() {
        return "Friend(friendId=" + this.getFriendId() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", accountId=" + this.getAccountId() + ", friendAccountId=" + this.getFriendAccountId() + ")";
    }
}



