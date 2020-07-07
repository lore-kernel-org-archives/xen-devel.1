Return-Path: <SRS0=v0bc=AS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B2BC433DF
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2020 09:39:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBEC0206CD
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2020 09:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBEC0206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsk42-0007kQ-1I; Tue, 07 Jul 2020 09:38:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E+9W=AS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jsk40-0007kL-LA
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 09:38:56 +0000
X-Inumbo-ID: acfe9118-c035-11ea-8d3d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acfe9118-c035-11ea-8d3d-12813bfff9fa;
 Tue, 07 Jul 2020 09:38:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7BE1AB3D;
 Tue,  7 Jul 2020 09:38:55 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] xen/privcmd: Mark pages as dirty
To: Souptick Joarder <jrdr.linux@gmail.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
 <1594059372-15563-3-git-send-email-jrdr.linux@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8fdd8c77-27dd-2847-7929-b5d3098b1b45@suse.com>
Date: Tue, 7 Jul 2020 11:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594059372-15563-3-git-send-email-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Paul Durrant <xadimgnik@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.07.20 20:16, Souptick Joarder wrote:
> pages need to be marked as dirty before unpinned it in
> unlock_pages() which was oversight. This is fixed now.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Suggested-by: John Hubbard <jhubbard@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>
> ---
>   drivers/xen/privcmd.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 33677ea..f6c1543 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -612,8 +612,11 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>   {
>   	unsigned int i;
>   
> -	for (i = 0; i < nr_pages; i++)
> +	for (i = 0; i < nr_pages; i++) {
> +		if (!PageDirty(pages[i]))
> +			set_page_dirty_lock(pages[i]);

With put_page() directly following I think you should be able to use
set_page_dirty() instead, as there is obviously a reference to the page
existing.

>   		put_page(pages[i]);
> +	}
>   }
>   
>   static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
> 

Juergen

