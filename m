Return-Path: <SRS0=54zI=A4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF10C433E2
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2020 14:44:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D31208DB
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2020 14:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="naC9b/nL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D31208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwRbB-0000f5-EQ; Fri, 17 Jul 2020 14:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwRbA-0000f0-CI
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:44:28 +0000
X-Inumbo-ID: 03eb714a-c83c-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03eb714a-c83c-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5At1Ml5+qHgjsWRq1Z5+lMTAMXO06N/EWtui0mPzDY4=; b=naC9b/nLAcnCK2YKWKxtAmobBy
 zsmgygEVraeR7o0ym+c3hXTamQ1NrVLVpENUgF0IN8YBIJ/KermppqnCAz2CmkyJxnk0xqGaWfn61
 4ASfuf6SpooO1AdKUbc2klF9qvvu5y2lGdUld2BOE1jg/+VD29Ps+C3CLSq1CUd7eLlo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwRb9-0008Do-IK; Fri, 17 Jul 2020 14:44:27 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwRb9-0002cD-Bc; Fri, 17 Jul 2020 14:44:27 +0000
Subject: Re: [PATCH 4/8] Arm: prune #include-s needed by domain.h
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
 <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d836dc7f-017b-5048-02de-d1cb291fbc3b@xen.org>
Date: Fri, 17 Jul 2020 15:44:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 15/07/2020 11:39, Jan Beulich wrote:
> asm/domain.h is a dependency of xen/sched.h, and hence should not itself
> include xen/sched.h. Nor should any of the other #include-s used by it.
> While at it, also drop two other #include-s that aren't needed by this
> particular header.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -2,7 +2,7 @@
>   #define __ASM_DOMAIN_H__
>   
>   #include <xen/cache.h>
> -#include <xen/sched.h>
> +#include <xen/timer.h>
>   #include <asm/page.h>
>   #include <asm/p2m.h>
>   #include <asm/vfp.h>
> @@ -11,8 +11,6 @@
>   #include <asm/vgic.h>
>   #include <asm/vpl011.h>
>   #include <public/hvm/params.h>
> -#include <xen/serial.h>

While we don't need the rbtree.h, we technically need serial.h for using 
vuart_info.

I would rather prefer if headers are not implicitly included whenever it 
is possible.

Cheers,

-- 
Julien Grall

