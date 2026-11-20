Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081CC606A325
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhuXPe5f
Received: from list by lists.xenproject.org with outflank-mailman.1497944.1695976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUL3k-0005Pt-Q4; Fri, 20 Nov 2026 09:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497944.1695976; Fri, 20 Nov 2026 09:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUL3k-0005Pm-MT; Fri, 20 Nov 2026 09:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1497944;
 Fri, 20 Nov 2026 09:37:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUL3j-0005Pf-Rz
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:37:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUL3j-003Tyr-3y
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:37:31 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b0014d5-bab6-0a2a0a5309dd-0a2a450c915e-22
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:37:31 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b0014da-f479-0a2a450c0019-d1558032a5f4-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:37:31 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so7338535e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 01:37:31 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865a2sm72167205e9.3.2026.11.20.01.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 01:37:30 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795167450; x=1795772250; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqUuUquKtFDB4xPieVk83eo/cNmlTyLpF8DLPMJvnaw=;
        b=qhuXPe5f3UDwULUuUTbbVrdsvjIPn0PL8UNX+BgwmhR+pXxZ3E5Rgk2I9Q8xmg1yYJ
         qXslWG0uQ4shML0nqnVgMemI8sCezMkc/XDhdiFQUi8uqn0SKCgsPRQVRw7Q/bFLCuYD
         KD0ShNtXH0+FG39iM7pbyEMLphWRZbhq1BrssuCvIBOOdXN9+bmphechum99eNVFnggT
         EzkwRx1+spvYTeQMMtnUwUIoDQ0Zte45rKDY+FJ3uMUAzD5xMvQNzHV2xWeSFpxlf+I9
         7IxUoCi+c+CmSVd6Zv/rVFsWwWJRcTNQAE7Fm6pdc82bFM3naM4B9gaGGnkMQTXtTAX/
         fgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167450; x=1795772250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqUuUquKtFDB4xPieVk83eo/cNmlTyLpF8DLPMJvnaw=;
        b=QHPnSCc7FbSnCEoyrYYkuAHWUN67L5Q9WUFPMgaeAcgL86ht0rCeKrwl28NrdNaUZE
         AYN4r5pE0K8qMqWpPInOjpvqSxfjYmOz4vTLSR3rqoYwiX/S5Ckanz/OafWPzs6bh+db
         NT58JFgVVSZpTA+GL/JVHOdqADB+TXqkTi2TvHWKYe2gHKkdODX5Kr3gf195YgHtsCbe
         +saZWwRDr+i8BbQAmZPjtgS1A8AOO/fTlL2z//TNRq7X5Q3S7vJiKyr9mWTAgzoRCeBY
         9rrCfbnTXoe30nBf7BrzWNeLH6H9lo7jZLKVNhcyPsEVK62Ox+D7fwCH2DeL+SSghqGB
         YgfQ==
X-Forwarded-Encrypted: i=1; AL+hErFXTbvihgTs7oUUZNZ//oO76RaMCnRnyLOqf3/fBUDMa65G+fXPJur9JavNav+JqiE9WsZ6+Tcp9hs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+rvLx6kqMG0dOgs9Q6MdhbOr7ZQo3kJSzsiWZ+84U0+9mN2qP1
	+p17jI+yjwRA6TfTyZoH2TnIBQr/RlxQfoE9Y+WlaoRdyvTDMeDlsSqC
X-Gm-Gg: AYBFou1ZIMfoMHRBKSgqSjOS2TaTgu63tbfnl6imeHp2h2kvadu43WehTtChyQT9zrd
	vSjo6WCPajBR1OJiijEUauOzcgENmD2as/8KnUMGJBlDDWwpff5ralC79QolVZmR6Uy3MQ2qzyQ
	Yaq4aPdadDrd15rQnobbByvfIeUrGXQ3AOxl6ZHPZug/3IwQ5cy3Xumx+syGoQi12JRAb9B5MSU
	z39dy9ufhzwkyKIjF1hvJoJjR1y4KkZjgPePboCdcBsFNEqm8dCjVUeS/lpIdncZTmhqSMdVSmu
	TDaGaOY7uhrZNnky/VwfVMcJjwADapWM45bKjPYmp+z3T07WNopqIl+SDL4krXJJ5yvUDpv5tPz
	wj01FCZN6VFVi85zlPLLqo01vP11M1uTb4neN9HMdNh0gUCYQtkWRjfeXClzWR0+/XMH9OGNF0F
	2V4KxtKH+Hpb/6Xb5u4iW0TYY2P11XM3wV7f1kHtvmUk7yD+YJG86E422VAoRJmHAr97Wrr3GEc
	+8MYE2qWCsFmZnLE3ySbj6k/6vBLIJk5FSfuuC1EGBJDGic1CQQtI1kzotbOmAfvDbdbJUDK5PL
	mAVO+pK1VarzpaDNfeetUaoSGGjfL7ZwXTIoZfEpPZwCNnpwDxKCBSRiiGFguXbb1lraSRFoCP4
	C1w==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr52496065e9.7.1795167450429;
        Fri, 20 Nov 2026 01:37:30 -0800 (PST)
Message-ID: <4259e4ce-c21d-404d-be89-41eef1232819@gmail.com>
Date: Fri, 20 Nov 2026 10:37:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/26] emul/vuart: add global UART emulator
 configuration knob
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-15-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-15-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1795167451-5290EA5B-31259928/10/73395122804
X-purgate-type: spam
X-purgate-size: 5413
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce new command line setting `vuart=domid[:compatible,name]` for
> configuring UART emulator per given domain.

A new command line option needs an entry in
docs/misc/xen-command-line.pandoc; I don't see one in the series.

> 
> Only one domain is supported for now.
> 
> Format:
>    domid      - vUART owner domain ID
>    compatible - vUART compatible string, must match with one of the
>                 registered emulators
>    name       - vUART user-friendly name used for searching for one of
>                 the pre-defined guest I/O resources
> 
> compatible string and name are optional, if skipped, platform default

Is `name` really optional? Look my reply below ([A]).

> values will be chosen.
> 
> Note, documentation update is not covered in this patch.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/vuart.c | 85 +++++++++++++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
> index bd3b756fb4d6..0df29540b1b6 100644
> --- a/xen/common/emul/vuart/vuart.c
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -6,8 +6,10 @@
>   
>   #include <asm/types.h>
>   
> +#include <xen/ctype.h>
>   #include <xen/err.h>
>   #include <xen/resource.h>
> +#include <xen/param.h>

Inclusion of headers should be sorted in alphabetical order so please 
put xen/param.h before xen/resouce.h.

>   #include <xen/sched.h>
>   #include <xen/vuart.h>
>   #include <xen/xvmalloc.h>
> @@ -18,6 +20,89 @@
>   extern const struct vuart_emulator vuart_array_start[];
>   extern const struct vuart_emulator vuart_array_end[];
>   
> +static domid_t __read_mostly opt_vuart_domid = DOMID_INVALID;
> +static const struct vuart_info * __read_mostly opt_vuart_info;

Only a single domain can be given a vUART, and a later vuart= silently
replaces an earlier one. If that's the intended scope, the
documentation should say so.

> +
> +static const struct vuart_info vuart_supported[] = {
> +#define VUART(c,n,t,a,s,i) { \
> +    .compatible = c, \
> +    .name = n, \
> +    .flags = VUART_CONSOLE_INPUT, \
> +    .base_type = t, \
> +    .base_addr = a, \
> +    .size = s, \
> +    .irq = i, \
> +}
> +#ifdef CONFIG_VUART_NS16X50
> +        VUART("ns16550", "com1", IORESOURCE_IO, 0x3f8u, 8u, 4u),
> +        VUART("ns16550", "com2", IORESOURCE_IO, 0x2f8u, 8u, 3u),
> +        VUART("ns16550", "com3", IORESOURCE_IO, 0x3feu, 8u, 4u),
> +        VUART("ns16550", "com4", IORESOURCE_IO, 0x2feu, 8u, 3u),
> +#endif /* CONFIG_VUART_NS16X50 */

COM3 and COM4 are at 0x3e8 and 0x2e8 (e.g. Linux's
arch/x86/include/asm/serial.h). 0x3fe and 0x2fe fall inside the COM1 and
COM2 ranges (0x3fe is COM1's MSR), so a guest wouldn't find com3/com4
where it looks for them, and the emulated range would overlap the
neighbouring ports.

Also, this table describes legacy PC COM ports, i.e. it's x86-specific,
but it lives in the arch-independent framework. For the RISC-V port I
had to limit it to CONFIG_X86. Could it move to x86 code, or into 
ns16x50.c, with the framework only parsing the option?

> +#undef VUART
> +};
> +
> +static int __init cf_check vuart_parse_cmdline(const char *s)
> +{
> +    const char *compat = "ns16550";
> +    size_t compat_len = strlen(compat);
> +    const char *name = "com1";
> +    size_t name_len = strlen(name);
> +    const char *end;
> +    domid_t domid;
> +    unsigned int i;
> +
> +    /* vuart=domid:compatible,name */
> +    if ( !isdigit(*s) )
> +        return -EINVAL;
> +
> +    domid = simple_strtoul(s, &end, 0);
> +    if ( domid >= DOMID_FIRST_RESERVED )
> +        return -EINVAL;

The value is truncated to domid_t before the range check, so e.g.
vuart=65537 is accepted as domain 1. Also, base 0 makes vuart=010 mean
domain 8. I'd parse into an unsigned long with base 10 and check that
before assigning:

     unsigned long val = simple_strtoul(s, &end, 10);

     if ( end == s || val >= DOMID_FIRST_RESERVED )
         return -EINVAL;

     domid = val;


> +
> +    if ( *end == '\0' )
> +        goto match_defaults;
> +
> +    if ( *end != ':' )
> +        return -EINVAL;
> +
> +    compat = end + 1;
> +
> +    while ( *end && *end != ',' )
> +        end++;
> +    if ( *end != ',' )
> +        return -EINVAL;

[A] So once ":compatible" is given, ",name" is mandatory: 
vuart=1:ns16550 is rejected. The Kconfig help in 16/26 documents
'vuart=<domid>:<compatible>[,com[1-4]]', i.e. the name as optional;
one of the two needs adjusting.

Also, the comment then should be adjusted too.

> +
> +    compat_len = end - compat;
> +    if ( !compat_len )
> +        return -EINVAL;
> +
> +    name = end + 1;
> +    name_len = strlen(name);
> +    if ( !name_len )
> +        return -EINVAL;
> +
> + match_defaults:
> +    for ( i = 0; i < ARRAY_SIZE(vuart_supported); i++ )
> +    {
> +        if ( compat_len != strlen(vuart_supported[i].compatible) ||
> +             strncmp(compat, vuart_supported[i].compatible, compat_len) )

Nit: this matches the compatible exactly, while 
vuart_match_by_compatible() (01/26) matches a prefix; it would be good
to use one rule for both.

~ Oleksii

