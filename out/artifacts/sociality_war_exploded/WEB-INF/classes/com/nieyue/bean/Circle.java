package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 朋友圈
 *
 */
@ApiModel(value="朋友圈",description="朋友圈")
public class Circle implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 朋友圈id
     */
    @ApiModelProperty(value="朋友圈id")
    private Integer circleId;
    /**
     * 内容
     */
    @ApiModelProperty(value="内容")
    private String content;
    /**
     * 点赞数
     */
    @ApiModelProperty(value="点赞数")
    private Integer praisePoints;
    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date createDate;
    /**
     * 更新时间
     */
    @ApiModelProperty(value="朋友圈更新时间")
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

    public Circle() {
    }

    public Integer getCircleId() {
        return this.circleId;
    }

    public String getContent() {
        return this.content;
    }

    public Integer getPraisePoints() {
        return this.praisePoints;
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

    public void setCircleId(Integer circleId) {
        this.circleId = circleId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setPraisePoints(Integer praisePoints) {
        this.praisePoints = praisePoints;
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
        if (!(o instanceof Circle)) return false;
        final Circle other = (Circle) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$circleId = this.getCircleId();
        final Object other$circleId = other.getCircleId();
        if (this$circleId == null ? other$circleId != null : !this$circleId.equals(other$circleId)) return false;
        final Object this$content = this.getContent();
        final Object other$content = other.getContent();
        if (this$content == null ? other$content != null : !this$content.equals(other$content)) return false;
        final Object this$praisePoints = this.getPraisePoints();
        final Object other$praisePoints = other.getPraisePoints();
        if (this$praisePoints == null ? other$praisePoints != null : !this$praisePoints.equals(other$praisePoints))
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
        final Object this$account = this.getAccount();
        final Object other$account = other.getAccount();
        if (this$account == null ? other$account != null : !this$account.equals(other$account)) return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $circleId = this.getCircleId();
        result = result * PRIME + ($circleId == null ? 43 : $circleId.hashCode());
        final Object $content = this.getContent();
        result = result * PRIME + ($content == null ? 43 : $content.hashCode());
        final Object $praisePoints = this.getPraisePoints();
        result = result * PRIME + ($praisePoints == null ? 43 : $praisePoints.hashCode());
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
        return other instanceof Circle;
    }

    public String toString() {
        return "Circle(circleId=" + this.getCircleId() + ", content=" + this.getContent() + ", praisePoints=" + this.getPraisePoints() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ", accountId=" + this.getAccountId() + ", account=" + this.getAccount() + ")";
    }
}



