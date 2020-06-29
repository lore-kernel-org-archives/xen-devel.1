Return-Path: <SRS0=/qc5=AK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48828C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 05:18:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D5B2312B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 05:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D5B2312B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpmAY-0004hY-6u; Mon, 29 Jun 2020 05:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K18G=AK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jpmAW-0004hT-5j
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 05:17:24 +0000
X-Inumbo-ID: cfed52a0-b9c7-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfed52a0-b9c7-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 05:17:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 326E3AD76;
 Mon, 29 Jun 2020 05:17:22 +0000 (UTC)
Subject: Re: [PATCH fsgsbase v2 4/4] x86/fsgsbase: Fix Xen PV support
To: Andy Lutomirski <luto@kernel.org>, x86@kernel.org
References: <cover.1593192140.git.luto@kernel.org>
 <f07c08f178fe9711915862b656722a207cd52c28.1593192140.git.luto@kernel.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <714d4c04-5907-885f-e23b-baef662f1080@suse.com>
Date: Mon, 29 Jun 2020 07:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f07c08f178fe9711915862b656722a207cd52c28.1593192140.git.luto@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.20 19:24, Andy Lutomirski wrote:
> On Xen PV, SWAPGS doesn't work.  Teach __rdfsbase_inactive() and
> __wrgsbase_inactive() to use rdmsrl()/wrmsrl() on Xen PV.  The Xen
> pvop code will understand this and issue the correct hypercalls.
> 
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>   arch/x86/kernel/process_64.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> index cb8e37d3acaa..457d02aa10d8 100644
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@ -163,9 +163,13 @@ static noinstr unsigned long __rdgsbase_inactive(void)
>   
>   	lockdep_assert_irqs_disabled();
>   
> -	native_swapgs();
> -	gsbase = rdgsbase();
> -	native_swapgs();
> +	if (!static_cpu_has(X86_FEATURE_XENPV)) {
> +		native_swapgs();
> +		gsbase = rdgsbase();
> +		native_swapgs();
> +	} else {
> +		rdmsrl(MSR_KERNEL_GS_BASE, gsbase);
> +	}
>   
>   	return gsbase;
>   }
> @@ -182,9 +186,13 @@ static noinstr void __wrgsbase_inactive(unsigned long gsbase)
>   {
>   	lockdep_assert_irqs_disabled();
>   
> -	native_swapgs();
> -	wrgsbase(gsbase);
> -	native_swapgs();
> +	if (!static_cpu_has(X86_FEATURE_XENPV)) {
> +		native_swapgs();
> +		wrgsbase(gsbase);
> +		native_swapgs();
> +	} else {
> +		wrmsrl(MSR_KERNEL_GS_BASE, gsbase);
> +	}
>   }
>   
>   /*
> 

Another possibility would be to just do (I'm fine either way):

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index acc49fa6a097..b78dd373adbf 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -318,6 +318,8 @@ static void __init xen_init_capabilities(void)
  		setup_clear_cpu_cap(X86_FEATURE_XSAVE);
  		setup_clear_cpu_cap(X86_FEATURE_OSXSAVE);
  	}
+
+	setup_clear_cpu_cap(X86_FEATURE_FSGSBASE);
  }

  static void xen_set_debugreg(int reg, unsigned long val)


Juergen

