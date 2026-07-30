Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3B2C531D0
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 06:42:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377177.1623376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpKTA-00015H-HZ; Thu, 30 Jul 2026 06:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377177.1623376; Thu, 30 Jul 2026 06:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpKTA-00015A-EI; Thu, 30 Jul 2026 06:42:16 +0000
Received: by outflank-mailman (input) for mailman id 1377177;
 Thu, 30 Jul 2026 06:42:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpKT9-00014T-8b
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 06:42:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpKT8-00GRxE-10
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:42:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6af239-e002-0a2a0a5209dd-0a2a450a9480-26
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:42:14 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6af245-f2d2-0a2a450a0019-d155802dbc63-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:42:13 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so11305875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 23:42:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498012168e7sm35019385e9.15.2026.07.29.23.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 23:42:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785393733; x=1785998533; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTHw4ouoEYc3Bsw7nfpsiEzD5mR19Y0mgVjpPmSqEns=;
        b=KbosETfGRjc+Vt+tntAknTVwS8cJ4u8fl2iHcghB4OlGaZ1oZJasafgBbknFhTf6u+
         Dq6q/AwH1OxjobRdvUzlkiPxtQDrXKTQt2cC1h9kdF1+PkcwMTLVDA9rAbRfKQEswYXQ
         /rPowj2OmYBwFwWM855rdhCakSKMgXDj1kjOxk8tJ8w/Xgn4w+dcVTHwjingGvhR5VDs
         pumzO4zNQkB+Y9Iz13WubFWNu0OjhlbxaBxDXM6IjbSqaqL2EF8gAB1IfOvAmDiMOT57
         g5qMlORoj39sWRZ/Gax4UD4ku6bPmUBFds2tjIHOG95RSmEmX5kP0Fbbjjia40ldt2H/
         Y4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393733; x=1785998533;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTHw4ouoEYc3Bsw7nfpsiEzD5mR19Y0mgVjpPmSqEns=;
        b=j6fn0/jIe6bU030b2iDHYhyZyPb0fTU07US9llBi19ngQC2GgukWsz70kcJMJxWicN
         8abXF/aLW/evGr5E3f5fqUVghVjI7Rs4cOOeci/joD9Oryth5o1GgMuvI2H0Q02lK8b2
         F0MjAtrHMAUNrf0A8Ov91u58qWQNPnr06uhRkwI1t1/vskRJ7XKRHSCzsj7192dXaqiY
         w6X+qEaTj92qbT2jHmlzEtVqVXuIXl6sw8bqFLX4JZnuXEC/D1tJS2egtZIQATVqj8nS
         ec/U8ppuDVK6Dsk9DenQZfqJzFZsg93bn/tiu4ojNDM45WP/WrMghvtjJFhqz8sbpFqf
         t2hg==
X-Forwarded-Encrypted: i=1; AHgh+RqDZL6H1JknlTNLRA6bdwl1TNMPqIxFGuV6uzu4eHzS11EcRVYU8z3p1miKQO7JS03PM75YpqKuPzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+pdmKyanNroTwHbYOx2+55+5pg63pwnVTFEko3Dl5lYz/YV3H
	Ho+Jkfq5pPIofDh5Cl20vH0/z+TTcmoMAesh+706zRpU6A/Ge1ztJ7KENOfmZ9qrmw==
X-Gm-Gg: AR+sD13fkVZ5dyJBZ0lI91dr3shiNak/PGOQFrsANv0htwKApc0N80vMI0xBbrl+FXn
	eem2gf2PibW9UUB7DEyA5VlVkkfozKgjeQsRwgEuvOXgdQxE5Eq9UA0sSL74eJg10Q0NdPjMmXL
	RmtCd4t7MNzuz0xF/p1Vw/zL4LDNG5GjEmPAQy1811E0m/mH/KzmF7GGnscV4fUDdJgsjPVcOO6
	AjtFWNJ6DUHjjnp8l+DnCceL1/pszRJ7n9SmeHTBJb0yJTbfTpLfaZcmc8UBmfbO+cmBmrJMIDA
	FWtdmN/6ZMFLJrOTFQqMY/sHjr6eLiSRSxbwwZwdaaxMg7YEfafr6tK5K/pdyra1wN567QCt3YA
	ZiQ/WC5CYB75mv+QjxspaFR7T3pMyjjIDqNJmNDzTovv+082Fe2JLUHqm4yyuq1Fwm+5CKVKoMB
	SL6rG+7YNDfsvlcC5JsWCXyMy1Zksp4l+VOgKbK7saqwwF/AarN1e6ntHmpu6Lo0MK0j8SgoBav
	qoK/6wV9axtzngRpdC8Br4KZqZNUXebGkQsi/AFJKLBYecRrtpF
X-Received: by 2002:a7b:cc14:0:b0:495:518a:d95a with SMTP id 5b1f17b1804b1-49800eac4b8mr9868055e9.29.1785393733525;
        Wed, 29 Jul 2026 23:42:13 -0700 (PDT)
Message-ID: <98911b08-cb5b-4211-949f-f800ecb48ffa@suse.com>
Date: Thu, 30 Jul 2026 08:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] keyhandler: add handler to show Xen command line
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260730061459.2702672-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260730061459.2702672-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785393733-4ABD8CFC-BD51A037/0/0
X-purgate-type: clean
X-purgate-size: 3511

On 30.07.2026 08:15, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 

First, you want to update Roger's email address that you use. This is now the
2nd patch that you sent to his old address, and the latest after sending the 1st
you should have noticed.

> Currently there's no way to print Xen command line on the emergency console
> for debugging purposes.
> 
> Add new keyhander 'C' to add (saved) command line printout for debugging
> the system.

If others think spending a precious character on this, I think I won't attempt
to veto this, but I'm definitely not going to ack such. More importantly though
you shouldn't be using a character that's already in use.

Nevertheless a few comments below.

> Also, fix indentation for KEYHANDLER() entries in 'keyhandler' array.

"fix" as in "break"? Patch context alone doesn't make clear at all why you'd
do this. Looking at the full source I think I can see why you think something
may be wrong there, but I don't think it is - the earlier block outside of the
#ifdef-s is different in this regard, imo.

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -232,6 +232,11 @@ void __init cmdline_parse(const char *cmdline)
>  #endif
>  }
>  
> +const char *cmdline_get(void)
> +{
> +    return saved_cmdline;
> +}

To accompany both this use and the pre-existing ones, perhaps it's time to
mark saved_cmdline[] __ro_after_init (in a separate patch preferably)?

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -28,7 +28,7 @@ static unsigned char keypress_key;
>  static bool alt_key_handling;
>  
>  static keyhandler_fn_t cf_check show_handlers, cf_check dump_hwdom_registers,
> -    cf_check dump_domains, cf_check read_clocks;
> +    cf_check dump_domains, cf_check read_clocks, show_cmdline;
>  static irq_keyhandler_fn_t cf_check do_toggle_alt_key, cf_check dump_registers,
>      cf_check reboot_machine, cf_check run_all_keyhandlers;
>  
> @@ -60,15 +60,17 @@ static struct keyhandler {
>      IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all diagnostics", 0),
>  
>  #ifdef CONFIG_PERF_COUNTERS
> -    KEYHANDLER('p', perfc_printall, "print performance counters", 1),
> -    KEYHANDLER('P', perfc_reset, "reset performance counters", 0),
> +        KEYHANDLER('p', perfc_printall, "print performance counters", 1),
> +        KEYHANDLER('P', perfc_reset, "reset performance counters", 0),
>  #endif
>  
>  #ifdef CONFIG_DEBUG_LOCK_PROFILE
> -    KEYHANDLER('l', spinlock_profile_printall, "print lock profile info", 1),
> -    KEYHANDLER('L', spinlock_profile_reset, "reset lock profile info", 0),
> +        KEYHANDLER('l', spinlock_profile_printall, "print lock profile info", 1),
> +        KEYHANDLER('L', spinlock_profile_reset, "reset lock profile info", 0),
>  #endif
>  
> +        KEYHANDLER('C', show_cmdline, "show saved command line", 0),

Why not insert at the appropriate slot in the earlier block outside of any
#ifdef?

As to the help text - in how far is "saved" relevant there?

> @@ -512,6 +514,12 @@ static void cf_check do_toggle_alt_key(unsigned char key, bool unused)
>             alt_key_handling ? "alternative" : "normal");
>  }
>  
> +static void cf_check show_cmdline(unsigned char key)
> +{
> +    printk("'%c' pressed -> showing saved command line\n", key);
> +    printk("%s\n", cmdline_get());
> +}

If this lived in kernel.c, the new cmdline_get() wouldn't be needed at all.

Jan

