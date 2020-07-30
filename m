Return-Path: <SRS0=aecc=BJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD45C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2020 19:38:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8E62084D
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2020 19:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAC0+LiC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8E62084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1ENC-0002JI-RW; Thu, 30 Jul 2020 19:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1ENC-0002J6-9i
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:37:50 +0000
X-Inumbo-ID: 26b5209e-d29c-11ea-8dc2-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26b5209e-d29c-11ea-8dc2-bc764e2007e4;
 Thu, 30 Jul 2020 19:37:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A5172072A;
 Thu, 30 Jul 2020 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596137869;
 bh=RFAlICnEc9FrvRTqUwCKvIKJ1QviHL6rkJpZKNuh0aE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MAC0+LiCnE908RDpLWh+/BmpkhA9BYWc6OsWHHUb9u7conPumofr1YvjMlkZN3xco
 7RoQLc2e0XsqjStt68IB/m+2P8F5VLvUCnqYQ71XoKr6Hi0L5Yjr87UGn/XscKAWO4
 yR+DU79/2t40j3VJSuI5XDflNva0X4DAV9O7L2tk=
Date: Thu, 30 Jul 2020 12:37:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 4/7] xen/arm: guestcopy: Re-order the includes
In-Reply-To: <20200730181827.1670-5-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2007301220000.1767@sstabellini-ThinkPad-T480s>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-5-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Jul 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> We usually have xen/ includes first and then asm/. They are also ordered
> alphabetically among themselves.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/arm/guestcopy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index 7a0f3e9d5fc6..c8023e2bca5d 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -1,7 +1,8 @@
> -#include <xen/lib.h>
>  #include <xen/domain_page.h>
> +#include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
> +
>  #include <asm/current.h>
>  #include <asm/guest_access.h>
>  
> -- 
> 2.17.1
> 

