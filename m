Return-Path: <SRS0=jOUd=6S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5408DC3A5A9
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 10:47:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302852071C
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 10:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302852071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYdW-0006CJ-4I; Mon, 04 May 2020 10:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVYdT-0006CD-Vx
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:47:44 +0000
X-Inumbo-ID: ae8d5802-8df4-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae8d5802-8df4-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 10:47:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9951AB3D;
 Mon,  4 May 2020 10:47:43 +0000 (UTC)
Subject: Re: [PATCH for-4.14 3/3] xen/x86: atomic: Don't allow to write
 atomically in a pointer to const
To: Julien Grall <julien@xen.org>
References: <20200502160700.19573-1-julien@xen.org>
 <20200502160700.19573-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9270c034-4a12-19b4-459f-45c95c9a5c48@suse.com>
Date: Mon, 4 May 2020 12:47:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502160700.19573-4-julien@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 18:07, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, write_atomic() will happily write to a pointer to const.
> While there are no use in Xen, it would be best to catch them at
> compilation time.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/include/asm-x86/atomic.h
> +++ b/xen/include/asm-x86/atomic.h
> @@ -63,6 +63,8 @@ void __bad_atomic_size(void);
>  
>  #define write_atomic(p, x) ({                             \
>      typeof(*(p)) __x = (x);                               \
> +    /* Check that the pointer is not const */             \
> +    void *__maybe_unused p_ = &__x;                       \

... along the lines of the similar case with guest handles I'd
like to suggest for the comment to be more precise: It's not
the pointer's const-ness you're after, but the pointed to
object's. Maybe "Check that the pointer is not to a const
type" or even just "Check that the pointer is not to const"?

Jan

