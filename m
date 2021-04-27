Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EC2C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 13:19:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA96860C3D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 13:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA96860C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118495.224651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNc6-00068P-Qn; Tue, 27 Apr 2021 13:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118495.224651; Tue, 27 Apr 2021 13:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNc6-00068I-Nh; Tue, 27 Apr 2021 13:18:54 +0000
Received: by outflank-mailman (input) for mailman id 118495;
 Tue, 27 Apr 2021 13:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNc5-000687-Ms
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:18:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4324aac7-6ebb-4042-bc7a-2298f692f18d;
 Tue, 27 Apr 2021 13:18:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C310AB1A0;
 Tue, 27 Apr 2021 13:18:51 +0000 (UTC)
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
X-Inumbo-ID: 4324aac7-6ebb-4042-bc7a-2298f692f18d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619529531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zOweu7VjQk5zycGCfzN3tNxUozmRx2KYeuQLH43qV44=;
	b=aXhiKBz2LEjQj6/e7wPjEk/z03jP6tAe8BgNmRbnYieeP0UGW0lM8JzOqxdtuKEQ99ZKXB
	yZXtBybyMkAwUpiOfa+iGARrjDxUzwA2GFb6m5WnVzVx+rtYcDCC1nhoRTjcrQpXOffNJ3
	joY0OKAbE2HrX/CZdjIfi5MfE71yu6o=
Subject: Re: [PATCH] x86/pv: Drop HYPERVISOR_COMPAT_VIRT_START()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210427130201.2142-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdc85c8d-db7c-e9cb-d436-317a31f96e69@suse.com>
Date: Tue, 27 Apr 2021 15:18:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427130201.2142-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.04.2021 15:02, Andrew Cooper wrote:
> This is pure obfuscation (in particular, hiding the two locations where the
> variable gets set), and is longer than the code it replaces.

Obfuscation - not just; see below.

> Also fix MACH2PHYS_COMPAT_VIRT_START to be expressed as a 1-parameter macro,
> which is how it is used.  The current construct only works because
> HYPERVISOR_COMPAT_VIRT_START was also a 1-parameter macro.

I don't mind this getting changed, but I don't think there's any
"fixing" involved here. Omitting macro parameters from macros
forwarding to other macros (or functions) is well defined and imo
not a problem at all. In fact, if at the end of all expansions a
macro evaluates to a function, it may be necessary to do so in case
covering not just function invocations is intended, but also taking
of its address.

> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -235,7 +235,7 @@ static bool check_descriptor(const struct domain *dom, seg_desc_t *d)
>              if ( b & _SEGMENT_G )
>                  limit <<= 12;
>  
> -            if ( (base == 0) && (limit > HYPERVISOR_COMPAT_VIRT_START(dom)) )
> +            if ( (base == 0) && (limit > dom->arch.hv_compat_vstart) )

I expect this (and a few more instances) to fail to build when !PV32.
It was the purpose of ...

> --- a/xen/include/asm-x86/config.h
> +++ b/xen/include/asm-x86/config.h
> @@ -254,21 +254,16 @@ extern unsigned char boot_edid_info[128];
>  
>  /* This is not a fixed value, just a lower limit. */
>  #define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
> -#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
> -
> -#else /* !CONFIG_PV32 */
> -
> -#define HYPERVISOR_COMPAT_VIRT_START(d) ((void)(d), 0)

... this to allow things to build in the absence of the actual struct
member.

Jan

