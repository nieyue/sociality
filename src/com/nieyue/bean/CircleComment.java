package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 朋友圈评论
 *
 */
@ApiModel(value="朋友圈评论",description="朋友圈评论")
public class CircleComment implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 朋友圈评论id
     */
    @ApiModelProperty(value="朋友圈评论id")
    private Integer circleCommentId;
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
    @ApiModelProperty(value="朋友圈评论更新时间")
    private Date updateDate;
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

    public CircleComment() {
    }

    public Integer getCircleCommentId() {
        return this.circleCommentId;
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

    public Account getAccount() {
        return this.account;
    }

    public void setCircleCommentId(Integer circleCommentId) {
        this.circleCommentId = circleCommentId;
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

    public void setAccount(Account account) {
        this.account = account;
    }

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof CircleComment)) return false;
        final CircleComment other = (CircleComment) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$circleCommentId = this.getCircleCommentId();
        final Object other$circleCommentId = other.getCircleCommentId();
        if (this$circleCommentId == null ? other$circleCommentId != null : !this$circleCommentId.equals(other$circleCommentId))
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
        final Object this$account = this.getAccount();
        final Object other$account = other.getAccount();
        if (this$account == null ? other$account != null : !this$account.equals(other$account)) return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $circleCommentId = this.getCircleCommentId();
        result = result * PRIME + ($circleCommentId == null ? 43 : $circleCommentId.hashCode());
        final Object $content = this.getContent();
        result = result * PRIME + ($content == null ? 43 : $content.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        final Object $accountId = this.getAccountId();
        result = result * PRIME + ($accountId == null ? 43 : $accountId.hashCode());
        final Object $account = this.getAccount();
        result = result * PRIME + ($account == null ? 43 : $account.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof CircleComment;
    }

    public String toString() {
        return "CircleComment(circleCommentId=" + this.getCircleCommentId() + ", content=" + this.getContent() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", accountId=" + this.getAccountId() + ", account=" + this.getAccount() + ")";
    }
}



