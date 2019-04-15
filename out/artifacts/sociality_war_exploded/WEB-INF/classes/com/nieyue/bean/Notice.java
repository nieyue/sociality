package com.nieyue.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告
 *
 */
@ApiModel(value="公告",description="公告")
//@Data
public class Notice implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 公告id
     */
    @ApiModelProperty(value="公告id")
    private Integer noticeId;

    /**
     * 标题
     */
    @ApiModelProperty(value="标题")
    private String title;
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
    @ApiModelProperty(value="更新时间")
    private Date updateDate;

    public Notice() {
    }
    public Integer getNoticeId() {
        return this.noticeId;
    }

    public String getTitle() {
        return this.title;
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

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof Notice)) return false;
        final Notice other = (Notice) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$noticeId = this.getNoticeId();
        final Object other$noticeId = other.getNoticeId();
        if (this$noticeId == null ? other$noticeId != null : !this$noticeId.equals(other$noticeId)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
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
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $noticeId = this.getNoticeId();
        result = result * PRIME + ($noticeId == null ? 43 : $noticeId.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $content = this.getContent();
        result = result * PRIME + ($content == null ? 43 : $content.hashCode());
        final Object $createDate = this.getCreateDate();
        result = result * PRIME + ($createDate == null ? 43 : $createDate.hashCode());
        final Object $updateDate = this.getUpdateDate();
        result = result * PRIME + ($updateDate == null ? 43 : $updateDate.hashCode());
        return result;
    }

    protected boolean canEqual(Object other) {
        return other instanceof Notice;
    }

    public String toString() {
        return "Notice(noticeId=" + this.getNoticeId() + ", title=" + this.getTitle() + ", content=" + this.getContent() + ", createDate=" + this.getCreateDate() + ", updateDate=" + this.getUpdateDate() + ")";
    }
}



