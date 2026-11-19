Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B2606A331
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v02AmGpd
Received: from list by lists.xenproject.org with outflank-mailman.1496413.1694953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU2ZG-00052A-5n; Thu, 19 Nov 2026 13:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496413.1694953; Thu, 19 Nov 2026 13:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU2ZG-000520-1U; Thu, 19 Nov 2026 13:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1496413;
 Thu, 19 Nov 2026 13:52:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU2ZF-00051r-AZ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:52:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU2ZE-0055YR-N8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:52:48 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afeff24-e002-0a2a0a5209dd-0a2a4503ae1c-36
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 14:52:48 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afeff30-fae8-0a2a45030019-d155dd2bf1b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 14:52:48 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so872873f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 05:52:48 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 ([2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a6560962adsm10873356f8f.41.2026.11.19.05.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 05:52:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795096368; x=1795701168; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENNzSwIqA5Ncj0gO7zFehwir7rUMkcBKItRmAT+qnHg=;
        b=v02AmGpd67H34+ehkvNCuNjompmUk8gikXj62vgQFavahzG3AkkrMp/L2FrxbTOGgE
         1OXBiaLSZ2N4cYFz6wOp0jqbcmrpCUBBb5pzM+b6QF5gEudjMQH4oj05AspiV2sB0RFv
         NNk5PTBERx8jUeEEtmS4KOwRcosmtvK9Zg0525xj88gUbKvwUPBh/0HC5qGo07MmNXcT
         cVoBcfvwTlpQ/4WtPJzmWSvFx4FI1nrzUBHhoUH/zkQLF3XkdZL3uKC4MuBKO7dGMYB2
         yRkmd8tiMngDx9cmQYz7FXrB4QyFUv1RZuabhwgzjI8c1MFprY5IuCDSocFPpo6Y6Gwp
         VPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096368; x=1795701168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENNzSwIqA5Ncj0gO7zFehwir7rUMkcBKItRmAT+qnHg=;
        b=mybrz9CR4sziYfSIX5Uv4KA5rnTCl5v98D0hBt6uCTgebwAwAxIIvkOY5IZeeZEoZU
         AUDmxeoVf0QdTg5fWlKXP2iK980222YMWqICLL61bLxS9q8OG3hoc457ofPFLeqt3UIv
         7Z7U7vXVHS0Hm+SMJmv8HGw0qMA0+tAlTdx6Cgb8vomT4YNK6vhefCGMPXgNYJ91zbVj
         PuTVjVAn1spQpd3os5RaANqAritGA0OAWIQHJoIYQZ+N+IJMf2zN3gwHo1Y68TCT+7IW
         9O1Femh80nLXTR3U7iTaKddRoz4BpHQzs/TK9PUBGhWkI2tvpsugeSo+6l2G7HK6adRy
         W04g==
X-Forwarded-Encrypted: i=1; AL+hErEtX95bXLeFu51nn8t7p9ebPlUUW4hfVYCLe+eStRcoiv2lMnnAbNJQuzH63I55daHlElEp1q5v7QY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8+E/YAq2y2sFpS5hDjhOh5W35piyiGBmETdVcANHjzjqS3YWNP
	FEfl29q+zt74FjVUVghRw5wVQruqNHSmh1PcUTUWtMvLoCn4rWCYJSoN
X-Gm-Gg: AZFdTZcbtMqCsOwDJKLRKd084FhG84fuVM3ihMEv51EmFJEfUcls/4tiSiOf7Eukk/U
	93/N/flWQvR4o4MEP9boL+VECQNM1Tg2ZfS19p4LSTrVqJoYh/XUCDRR0RO6w+0PRuxIj2Qj1ru
	NKTnBHY7XoecopRU+2jCgOCTtyENjmsSQdKwuQcfNGispQgoGxR/+wKCf7SmaZ3L3MGAiruPlxE
	G5W5DJ92Fdh7gUoRkMab/R/+Lxio4/51WtA2FCBAvl8ocVV9iwmjUQkTjQJ3CiaK4uBqvKxLe0e
	H1inHJS6g5xc4VmDvb+EldUQjXtLRWi5zJpQOV3nJgfict015kCMX4noW67zkv8EtxfNPxvrA0+
	G11afKixQBOYaBbNqJiF/QkTDT57sMd0BS85+7Um3LVCjESgnn3vJT084QramwVYfEtLdxrZbQc
	D+Ab0izNe5o1lEEWZOA75up8cg4KJIS31j+sb+O9rVh/+/ve4DLVp5/5Lb1G+l3/Zlx9zvmE3wH
	G10s7jyjVRICvfJrrFDJ2v8TYHV+0OdVSJSs9QSEfa6Q4L4dAGtGhZJsNSU0JNGkjIqeUqrIwGC
	WTdGNETUAfymWw+05HzO2Wjjw8Bd3Zdi8mcnTN9ei1D+e+IDBCfjEWu0lY5FDX/DIertyDe7eHE
	1NCnRpuJdkw==
X-Received: by 2002:a05:6000:2990:10b0:48e:870:7791 with SMTP id ffacd0b85a97d-4a63ac6b6b0mr9316232f8f.26.1795096367708;
        Thu, 19 Nov 2026 05:52:47 -0800 (PST)
Message-ID: <7deceb1b-bf57-4e0b-9181-da1d638fda70@gmail.com>
Date: Thu, 19 Nov 2026 14:52:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: vsbi: add SBI TIME extension
To: Hiago De Franco <hfranco@baylibre.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>, Ronaldo Nunez <rnunez@baylibre.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1795096368-6D4D74E9-CAAF17B7/10/73395122804
X-purgate-type: spam
X-purgate-size: 4995
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 12:59 PM, Hiago De Franco wrote:
> Xen reports SBI v0.2 but does not implement the TIME extension, so the
> guest probe fails and Linux falls back to the legacy SBI v0.1 SET_TIMER
> call.

Nit: the probe itself doesn't fail, it reports the extension as
unavailable. Maybe something like:

   "Xen reports SBI v0.2 but does not implement the TIME extension, so
    SBI_EXT_BASE_PROBE_EXT reports TIME as unavailable and Linux falls
    back to the legacy SBI v0.1 SET_TIMER call."

> 
> The fallback is deprecated and only available when the guest is built
> with CONFIG_RISCV_SBI_V01, so a guest built without it never arms the
> timer.
> 
> Implement the TIME extension and handle SET_TIMER() by programming the
> vCPU virtual timer through vtimer_set_timer(). With the extension
> registered, SBI_EXT_BASE_PROBE_EXT reports TIME as available and Linux
> selects the v0.2 path.
> 
> Assisted-by: DeepSeek:v4.1-flash
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
> Hello,
> 
> This is a prerequisite for removing the legacy v0.1 from the guest
> configuration.

I don't think removing legacy v0.1 is the best idea, as there could 
still be guests that only support v0.1 or, for some reason, prefer to 
use it. Therefore, both functionalities should remain available and be 
configurable in one way or another.

> 
> Tested by booting dom0less Linux guest, which prints "SBI TIME
> extension detected". To test this, I used the fork from Oleksii [1]
> (branch riscv-next-upstreaming) to boot linux guest with dom0less.
> 
> Since this is an isolated patch and applies to the xen master branch, I

Please note, though, that development happens on the staging branch; 
master lags behind it, so patches should be based on staging. This one 
applies to staging as is.

> decided to send the patch. Please let me know if this is not correct.

Generally speaking, I can't say whether this is right or wrong. IMO, we 
should have a policy that we all agree on. If I'm not mistaken, Bruno 
invited you to our weekly Xen RISC-V meetings, and we have one today. It 
would be great if you could join us so we could discuss these things.

At this point, the patch does look independent and ready to go. However, 
another option would be to take the patch to the riscv-next-upstreaming 
branch, apply it there, and verify that it works. That said, this might 
not be the best general approach.

The patch is currently targeting upstream/staging, which cannot boot any 
guests. Strictly speaking, it is therefore difficult to verify how the 
patch works without fetching [1], switching to the mentioned branch, and 
applying the patch there. In this sense, the fact that staging cannot 
currently boot a guest creates a kind of "logical dependency".

So, technically, we could proceed with this patch as it is. However, if 
you could join today's meeting, it would be good to discuss how we 
should handle similar situations with future patches and agree on a 
general upstreaming policy.

> 
> [1] https://gitlab.com/xen-project/people/olkur/xen
> ---
>   xen/arch/riscv/vsbi/Makefile         |  1 +
>   xen/arch/riscv/vsbi/time-extension.c | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
> index 8ce470f787c5b04f985dfb76d076025b49ddef19..31ff8e86d1a20500b9321c826c1e48c0f84cde84 100644
> --- a/xen/arch/riscv/vsbi/Makefile
> +++ b/xen/arch/riscv/vsbi/Makefile
> @@ -1,3 +1,4 @@
>   obj-y += base-extension.o
>   obj-y += core.o
>   obj-y += legacy-extension.o
> +obj-y += time-extension.o
> diff --git a/xen/arch/riscv/vsbi/time-extension.c b/xen/arch/riscv/vsbi/time-extension.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6bf23f5708d45d2f671bb15f423f209fb250525a
> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/time-extension.c
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +
> +#include <asm/current.h>
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vsbi.h>
> +#include <asm/vtimer.h>
> +
> +static int vsbi_time_ecall_handler(unsigned long eid, unsigned long fid,
> +                                   struct cpu_user_regs *regs)
> +{
> +    ASSERT(eid == SBI_EXT_TIME);
> +
> +    if ( fid != SBI_EXT_TIME_SET_TIMER )
> +        return SBI_ERR_NOT_SUPPORTED;
> +
> +    vtimer_set_timer(&current->arch.vtimer, regs->a0);
> +
> +    return SBI_SUCCESS;
> +}
> +
> +VSBI_EXT(time, SBI_EXT_TIME, SBI_EXT_TIME, vsbi_time_ecall_handler);

Nit: VSBI_EXT() already expands to a definition ending in "};", so the
trailing ';' produces an empty declaration at file scope. 
base-extension.c doesn't have it; I'd drop it here too.

With Nits fixed:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

