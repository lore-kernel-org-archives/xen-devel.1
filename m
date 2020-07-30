Return-Path: <SRS0=aecc=BJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C179C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2020 19:37:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1F220809
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2020 19:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nosEZRlw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1F220809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EN9-0002IJ-IL; Thu, 30 Jul 2020 19:37:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1EN7-0002I6-QH
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:37:45 +0000
X-Inumbo-ID: 23c205c8-d29c-11ea-ab18-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23c205c8-d29c-11ea-ab18-12813bfff9fa;
 Thu, 30 Jul 2020 19:37:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10FC02072A;
 Thu, 30 Jul 2020 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596137864;
 bh=3y9x+7BSRSZTvCMlMArJSQ3LD2BZ4Ov0frjO4ThCT98=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nosEZRlwIwD7zScZB/rHNn6sSGp8nnm0xOR+a6bZ/+OuHit1hl/9jLpmg8TVgaXeo
 TfSOIKD95XAdD6KQ+RDX68UXqPwbn+ls5GciGfiRYf4Zs4YpXhN7t9plz/bLGg7oRc
 zdOiwqowu0Ts+pSzksVNV/0OomDLmXPkt2nX5NGU=
Date: Thu, 30 Jul 2020 12:37:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 3/7] xen/arm: decode: Re-order the includes
In-Reply-To: <20200730181827.1670-4-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2007301219061.1767@sstabellini-ThinkPad-T480s>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-4-julien@xen.org>
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

Might wanna mention the change from asm/guest_access.h to
xen/guest_access.h. Anyway:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/decode.c | 5 +++--
>  xen/arch/arm/kernel.c | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 8b1e15d11892..144793c8cea0 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -17,11 +17,12 @@
>   * GNU General Public License for more details.
>   */
>  
> -#include <xen/types.h>
> +#include <xen/lib.h>
>  #include <xen/sched.h>
> +#include <xen/types.h>
> +
>  #include <asm/current.h>
>  #include <asm/guest_access.h>
> -#include <xen/lib.h>
>  
>  #include "decode.h"
>  
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index f95fa392af44..032923853f2c 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -5,6 +5,7 @@
>   */
>  #include <xen/domain_page.h>
>  #include <xen/errno.h>
> +#include <xen/guest_access.h>
>  #include <xen/gunzip.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -14,7 +15,6 @@
>  #include <xen/vmap.h>
>  
>  #include <asm/byteorder.h>
> -#include <asm/guest_access.h>
>  #include <asm/kernel.h>
>  #include <asm/setup.h>

