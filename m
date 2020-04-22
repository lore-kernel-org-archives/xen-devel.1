Return-Path: <SRS0=FTuz=6G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7D9C54FCB
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 13:44:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A2902073A
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2020 13:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="k89ZoeMU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A2902073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRFfD-0005ll-53; Wed, 22 Apr 2020 13:43:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+vI=6G=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRFfB-0005lf-Jh
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 13:43:41 +0000
X-Inumbo-ID: 4659c788-849f-11ea-9285-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4659c788-849f-11ea-9285-12813bfff9fa;
 Wed, 22 Apr 2020 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JqRFwaQIjIR+ZrZsM+AUU9yy9fZziYRfNHECZiMPR6E=; b=k89ZoeMUNHdMX0S42JEFASMi6p
 aElH8CQcOMDcAnyI20BCrkamvS+q/ME4RvHXox1KifR+azkOFoRRvI3iWZ/aa0enPkfIkVbyMGJVX
 /WMR6iGIdiZgJja665hv3SNxvVsRZFe3zruC0bRVmlFffvzro99alrFWgNp0u6kt4oc4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRFf8-0007AQ-TO; Wed, 22 Apr 2020 13:43:38 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRFf8-0007ea-LP; Wed, 22 Apr 2020 13:43:38 +0000
Subject: Re: [PATCH] xen/grants: fix hypercall continuation for
 GNTTABOP_cache_flush
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200422130753.14713-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ae77443-2703-614a-adfc-65bfacf27185@xen.org>
Date: Wed, 22 Apr 2020 14:43:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422130753.14713-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 22/04/2020 14:07, Juergen Gross wrote:
> The GNTTABOP_cache_flush hypercall has a wrong test for hypercall
> continuation, the test today is:
> 
>      if ( rc > 0 || opaque_out != 0 )
> 
> Unfortunately this will be true even in case of an error (rc < 0),
> possibly leading to very long lasting hypercalls (times of more
> than an hour have been observed in a test case).
> 
> Correct the test condition to result in false with rc < 0 and set
> opaque_out only if no error occurred, to be on the safe side.
> 
> Partially-suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/common/grant_table.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 96080b3dec..5ef7ff940d 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3626,12 +3626,12 @@ do_grant_table_op(
>           if ( unlikely(!guest_handle_okay(cflush, count)) )
>               goto out;
>           rc = gnttab_cache_flush(cflush, &opaque_in, count);
> -        if ( rc > 0 )
> +        if ( rc >= 0 )
>           {
>               guest_handle_add_offset(cflush, rc);
>               uop = guest_handle_cast(cflush, void);
> +            opaque_out = opaque_in;
>           }
> -        opaque_out = opaque_in;
>           break;
>       }
>   
> @@ -3641,7 +3641,7 @@ do_grant_table_op(
>       }
>   
>     out:
> -    if ( rc > 0 || opaque_out != 0 )
> +    if ( rc > 0 || (opaque_out != 0 && rc == 0) )

I don't understand this change. If you look at the implementation of 
gnttab_flush() it is not possible to have opaque_out non-zero with rc = 0.

So what's the point of the second condition?

>       {
>           /* Adjust rc, see gnttab_copy() for why this is needed. */
>           if ( cmd == GNTTABOP_copy )
> 

Cheers,

-- 
Julien Grall

