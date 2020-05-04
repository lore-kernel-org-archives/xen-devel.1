Return-Path: <SRS0=jOUd=6S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B347C3A5A9
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 14:56:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D929206B9
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 14:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D929206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVcVd-0004bu-5a; Mon, 04 May 2020 14:55:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVcVc-0004bp-Ch
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 14:55:52 +0000
X-Inumbo-ID: 5894f554-8e17-11ea-9d30-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5894f554-8e17-11ea-9d30-12813bfff9fa;
 Mon, 04 May 2020 14:55:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C469AA7C;
 Mon,  4 May 2020 14:55:52 +0000 (UTC)
Subject: Re: [PATCH 08/16] x86/shstk: Create shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c31d9d4d-76ea-1391-5f7d-fbb3f47e16ce@suse.com>
Date: Mon, 4 May 2020 16:55:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-9-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -748,6 +748,25 @@ void load_system_tables(void)
>  		.bitmap = IOBMP_INVALID_OFFSET,
>  	};
>  
> +	/* Set up the shadow stack IST. */
> +	if ( cpu_has_xen_shstk ) {

This being a Linux style function, you want to omit the blanks
immediately inside the parentheses bother here and in the for()
below.

> +		unsigned int i;
> +		uint64_t *ist_ssp = this_cpu(tss_page).ist_ssp;
> +
> +		/* Must point at the supervisor stack token. */
> +		ist_ssp[IST_MCE] = stack_top + (IST_MCE * 0x400) - 8;
> +		ist_ssp[IST_NMI] = stack_top + (IST_NMI * 0x400) - 8;
> +		ist_ssp[IST_DB]  = stack_top + (IST_DB  * 0x400) - 8;
> +		ist_ssp[IST_DF]  = stack_top + (IST_DF  * 0x400) - 8;

Introduce a constant for 0x400, to then also be used in the
invocations of write_sss_token()?

> +		/* Poision unused entries. */
> +		for ( i = IST_MAX;
> +		      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
> +			ist_ssp[i] = 0x8600111111111111ul;

IST_MAX == IST_DF, so you're overwriting one token here.

> --- a/xen/include/asm-x86/processor.h
> +++ b/xen/include/asm-x86/processor.h
> @@ -434,7 +434,8 @@ struct __packed tss64 {
>      uint16_t :16, bitmap;
>  };
>  struct tss_page {
> -    struct tss64 __aligned(PAGE_SIZE) tss;
> +    uint64_t __aligned(PAGE_SIZE) ist_ssp[8];
> +    struct tss64 tss;
>  };

Just curious - any particular reason you put this ahead of the TSS?

Jan

