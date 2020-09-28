Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9178C4741F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 15:21:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BC5208FE
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 15:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="y03hKh0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98BC5208FE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMuxD-0008AI-Rg; Mon, 28 Sep 2020 15:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yrr7=DF=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kMuxB-0008AC-Nl
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:20:37 +0000
X-Inumbo-ID: 70bbdb22-c787-4247-a5f0-3ee13fb8e4c8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70bbdb22-c787-4247-a5f0-3ee13fb8e4c8;
 Mon, 28 Sep 2020 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=YGONM3GPn62RNR7P8HJyqSDX16Ug6pMLAww7VeHn+SE=; b=y03hKh0v0x4QUK8I/kQCdA2vaR
 j4MlMcRxyAMm6e7hEU8mpbOFVhVU0ZZgIiaXG6PJXaLpYWNnzs3+aAgV6WlXiMNf12A2LAPojSPJt
 rmG54fNhkTceIV/BQS1LuFLQk4rm0QqoI4id1gIIfQMaytoeWiPZRgDdRirhnOv+oyJU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kMuxA-00062d-BA
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:20:36 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kMuxA-0008K6-98
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:20:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kMux6-0001Lv-W7; Mon, 28 Sep 2020 16:20:33 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24433.65344.748102.591216@mariner.uk.xensource.com>
Date: Mon, 28 Sep 2020 16:20:32 +0100
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgross\@suse.com" <jgross@suse.com>,
 "wei.liu2\@citrix.com" <wei.liu2@citrix.com>,
 "konrad.wilk\@oracle.com" <konrad.wilk@oracle.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 2/2] libgnttab: Add support for Linux dma-buf offset
In-Reply-To: <20200520090425.28558-3-andr2000@gmail.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-3-andr2000@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Oleksandr Andrushchenko writes ("[PATCH 2/2] libgnttab: Add support for Linux dma-buf offset"):
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add version 2 of the dma-buf ioctls which adds data_ofs parameter.
> 
> dma-buf is backed by a scatter-gather table and has offset parameter
> which tells where the actual data starts. Relevant ioctls are extended
> to support that offset:
>   - when dma-buf is created (exported) from grant references then
>     data_ofs is used to set the offset field in the scatter list
>     of the new dma-buf
>   - when dma-buf is imported and grant references provided then
>     data_ofs is used to report that offset to user-space

Thanks.  I'm not a DMA expert, but I think this is probably going in
roughly the right direction.  I will probably want a review from a DMA
expert too, but let me get on with my questions:

When you say "the protocol changes are already accepted" I think you
mean the Linux ioctl changes ?  If not, what *do* you mean ?

> +/*
> + * Version 2 of the ioctls adds @data_ofs parameter.
> + *
> + * dma-buf is backed by a scatter-gather table and has offset
> + * parameter which tells where the actual data starts.
> + * Relevant ioctls are extended to support that offset:
> + *   - when dma-buf is created (exported) from grant references then
> + *     @data_ofs is used to set the offset field in the scatter list
> + *     of the new dma-buf
> + *   - when dma-buf is imported and grant references are provided then
> + *     @data_ofs is used to report that offset to user-space
> + */
> +#define IOCTL_GNTDEV_DMABUF_EXP_FROM_REFS_V2 \
> +    _IOC(_IOC_NONE, 'G', 13, \

I think this was copied from a Linux header file ?  If so please quote
the precise file and revision in the commit message.  And be sure to
copy the copyright informtaion appropriately.

> +int osdep_gnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
> +                                         uint32_t flags, uint32_t count,
> +                                         const uint32_t *refs,
> +                                         uint32_t *dmabuf_fd, uint32_t data_ofs)
> +{
> +    abort();

I'm pretty sure this is wrong.

This leads me to ask about compatibility, both across versions of the
various components, and API compatibility across different platforms.

libxengnttab is supposed to have a stable API and ABI.  This means
that old programs should work with the new library - which I think you
have achieved.

But I think it also means that it should work with new programs, and
the new library, on old kernels.  What is your compatibility story
here ?  What is the intended mode of use by an application ?

And the same application code should be useable, so far as possible,
across different plaatforms that support Xen.

What fallback would be possible for application do if the v2 function
is not available ?  I think that fallback action needs to be
selectable at runtime, to support new userspace on old kernels.

What architectures is the new Linux ioctl available on ?


> diff --git a/tools/libs/gnttab/include/xengnttab.h b/tools/libs/gnttab/include/xengnttab.h
> index 111fc88caeb3..0956bd91e0df 100644
> --- a/tools/libs/gnttab/include/xengnttab.h
> +++ b/tools/libs/gnttab/include/xengnttab.h
> @@ -322,12 +322,19 @@ int xengnttab_grant_copy(xengnttab_handle *xgt,
>   * Returns 0 if dma-buf was successfully created and the corresponding
>   * dma-buf's file descriptor is returned in @fd.
>   *
> +
> + * Version 2 also accepts @data_ofs offset of the data in the buffer.
> + *
>   * [1] https://elixir.bootlin.com/linux/latest/source/Documentation/driver-api/dma-buf.rst
>   */
>  int xengnttab_dmabuf_exp_from_refs(xengnttab_handle *xgt, uint32_t domid,
>                                     uint32_t flags, uint32_t count,
>                                     const uint32_t *refs, uint32_t *fd);
>  
> +int xengnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
> +                                      uint32_t flags, uint32_t count,
> +                                      const uint32_t *refs, uint32_t *fd,
> +                                      uint32_t data_ofs);

I think the information about the meaning of @data_ofs must be in the
doc comment.  Indeed, that should be the primary location.

Conversely there is no need to duplicate information between the patch
contents, and the commit message.

Is _v2 really the best name for this ?  Are we likely to want to
extend this again in future ?  Perhaps it should be called ..._offset
or something ?  Please think about this and tell me your opinion.

> +int osdep_gnttab_dmabuf_exp_from_refs_v2(xengnttab_handle *xgt, uint32_t domid,
> +                                         uint32_t flags, uint32_t count,
> +                                         const uint32_t *refs,
> +                                         uint32_t *dmabuf_fd,
> +                                         uint32_t data_ofs)
> +{
> +    struct ioctl_gntdev_dmabuf_exp_from_refs_v2 *from_refs_v2 = NULL;
> +    int rc = -1;
> +
> +    if ( !count )
> +    {
> +        errno = EINVAL;
> +        goto out;
> +    }
> +
> +    from_refs_v2 = malloc(sizeof(*from_refs_v2) +
> +                          (count - 1) * sizeof(from_refs_v2->refs[0]));
> +    if ( !from_refs_v2 )
> +    {
> +        errno = ENOMEM;
> +        goto out;
> +    }
> +
> +    from_refs_v2->flags = flags;
> +    from_refs_v2->count = count;
> +    from_refs_v2->domid = domid;
> +    from_refs_v2->data_ofs = data_ofs;
> +
> +    memcpy(from_refs_v2->refs, refs, count * sizeof(from_refs_v2->refs[0]));
> +
> +    if ( (rc = ioctl(xgt->fd, IOCTL_GNTDEV_DMABUF_EXP_FROM_REFS_V2,
> +                     from_refs_v2)) )
> +    {
> +        GTERROR(xgt->logger, "ioctl DMABUF_EXP_FROM_REFS_V2 failed");
> +        goto out;
> +    }

This seems just a fairly obvious wrapper for this ioctl.  I think it
would be best for me to review this in detail with reference to the
ioctl documentation (which you helpfully refer to - thank you!) after
I see the answers to my other questions.

> +int osdep_gnttab_dmabuf_imp_to_refs_v2(xengnttab_handle *xgt, uint32_t domid,
> +                                       uint32_t fd, uint32_t count,
> +                                       uint32_t *refs,
> +                                       uint32_t *data_ofs)
> +{

This function is very similar to the previous one.  I'm uncomfortable
with the duplication, but I see that
   osdep_gnttab_dmabuf_{imp_to,exp_from}_refs
are very duplicative already, so I am also somewhat uncomfortable with
asking you to clean this up with refactoring.  But perhaps if you felt
like thinking about combioning some of this, that might be nice.

What do my co-maintainers think ?


Regards,
Ian.

