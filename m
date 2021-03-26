Return-Path: <SRS0=uMCZ=IY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B648C433C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 09:59:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5B561A3F
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 09:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5B561A3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101672.194578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPjFf-0005Ls-2M; Fri, 26 Mar 2021 09:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101672.194578; Fri, 26 Mar 2021 09:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPjFe-0005Ll-VV; Fri, 26 Mar 2021 09:59:34 +0000
Received: by outflank-mailman (input) for mailman id 101672;
 Fri, 26 Mar 2021 09:59:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPjFd-0005Lg-8e
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 09:59:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29738bd0-6755-4c67-aeee-358015ab20e9;
 Fri, 26 Mar 2021 09:59:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58033AB5F;
 Fri, 26 Mar 2021 09:59:31 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 29738bd0-6755-4c67-aeee-358015ab20e9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616752771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EefDx3s95a3NNDv079RRGFdwcL8W8EVFMp36n+zAiKw=;
	b=oSn3g2UVSkWI87sEwy3eYprfIYZaGtM24r1sTzjCZQe3NEOWM71Mpko3pgL2wsvt5mtI7a
	+nXNd9LNtjtrnAvtk/3DnXPVgQfoxO2fI7U6PZvgUzc6tMMoizDaV6juKKMuEohmo03mw8
	DwqCk8soLr7yGSAaS/QXeEq7rC9c2Hs=
Subject: Re: [PATCH 1/2] x86/hpet: Factor
 hpet_enable_legacy_replacement_mode() out of hpet_setup()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325165224.10306-1-andrew.cooper3@citrix.com>
 <20210325165224.10306-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ef41d04-cff0-5828-8373-af5f42a4f857@suse.com>
Date: Fri, 26 Mar 2021 10:59:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325165224.10306-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.03.2021 17:52, Andrew Cooper wrote:
> ... in preparation to introduce a second caller.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Generally
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but I think there's one small code change needed plus I have two
nits (and I expect that this change wouldn't be committed without
patch 2, as making the function non-static isn't warranted
otherwise):

> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -754,11 +754,70 @@ int hpet_legacy_irq_tick(void)
>  }
>  
>  static u32 *hpet_boot_cfg;
> +static u64 __initdata hpet_rate;

Use uint64_t as you move this here?

> +bool __init hpet_enable_legacy_replacement_mode(void)
> +{
> +    unsigned int id, cfg, c0_cfg, ticks, count;
> +
> +    if ( !hpet_rate ||

I think you need to also honor opt_hpet here.

> +         !((id = hpet_read32(HPET_ID)) & HPET_ID_LEGSUP) ||

I don't think I see a need for the assignment and hence the local
variable. Dropping it would make the code easier to read imo.

Jan

