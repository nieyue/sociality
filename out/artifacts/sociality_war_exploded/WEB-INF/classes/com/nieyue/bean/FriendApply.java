package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 好友申请
 *
 */
@ApiModel(value="好友申请",description="好友申请")
public class FriendApply implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 好友申请id
     */
    @ApiModelProperty(value="好友申请id")
    private Integer friendApplyId;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date createDate;
    /**
     * 更新时间
     */
    @ApiModelProperty(value="好友申请更新时间")
    private Date updateDate;
    /**
     * 申请人id外键
     */
    @ApiModelProperty(value="申请人id外键")
    private Integer accountId;
    /**
     * 被申请人id外键
     */
    @ApiModelProperty(value="被申请人id外键")
    private Integer friendAccountId;
    /**
     * 状态，默认1申请中，2已同意，3已拒绝
     */
    @ApiModelProperty(value="状态，默认1申请中，2已同意，3已拒绝")
    private Integer status;

    public FriendApply() {
    }

    public Integer getFriendApplyId() {
        return this.friendApplyId;
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

    public Integer getStatus() {
        return this.status;
    }

    public void setFriendApplyId(Integer friendApplyId) {
        this.friendApplyId = friendApplyId;
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

    public void setStatus(Integer status) {
        this.status = status;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof FriendApply)) return false;
        final FriendApply other = (FriendApply) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$friendApplyId = this.getFriendApplyId();
        final Object other$friendApplyId = other.getFriendApplyId();
        if (this$friendApplyId == null ? other$friendApplyId != null : !this$friendApplyId.equals(other$friendApplyId))
            return false;
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
        final Object this$status = this.getStatus();
        final Object other$status = other.getStatus();
        if (this$status == null ? other$status != null : !this$status.equals(other$status)) return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $friendApplyId = this.getFriendApplyId();
        result = result * PRIME + ($friendApplyId == null ? 43 : $friendApplyId.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        final Object $accountId = this.getAccountId();
        result = result * PRIME + ($accountId == null ? 43 : $accountId.hashCode());
        final Object $friendAccountId = this.getFriendAccountId();
        result = result * PRIME + ($friendAccountId == null ? 43 : $friendAccountId.hashCode());
        final Object $status = this.getStatus();
        result = result * PRIME + ($status == null ? 43 : $status.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof FriendApply;
    }

    public String toString() {
        return "FriendApply(friendApplyId=" + this.getFriendApplyId() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", accountId=" + this.getAccountId() + ", friendAccountId=" + this.getFriendAccountId() + ", status=" + this.getStatus() + ")";
    }
}



