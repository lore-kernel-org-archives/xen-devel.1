Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F58C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:52:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389977.1630551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUuH-0003XC-NO; Thu, 13 Aug 2026 12:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389977.1630551; Thu, 13 Aug 2026 12:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUuH-0003X5-K5; Thu, 13 Aug 2026 12:51:37 +0000
Received: by outflank-mailman (input) for mailman id 1389977;
 Thu, 13 Aug 2026 12:51:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuUuG-0003Wx-18
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:51:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUuE-003Bmt-Nu
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:51:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dbdc5-bab6-0a2a0a5309dd-0a2a45049c1e-26
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:51:30 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dbdd2-b57f-0a2a45040019-d1558035b97e-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:51:30 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so12595125e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:51:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982131261sm105839415e9.8.2026.08.13.05.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 05:51:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1786625490; x=1787230290; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmsAuvA1xU0GopwYnrPDvUMnEhRCq6saU29mAJvlakI=;
        b=fIJNotv52tdAvDzsnIkxfQeeJ5N0spIkWNHGGnPBuuMwlmHewOZbbII/PfV3IRjxWx
         8RpsKmlR6+zROy7p18+Af37XSwy66IZrmiwuuOehsDYdnz9rGUAO1Gm+MIVce4vW8V+9
         JmiojSmB3sS5kRg5YVPW1T6B8PFL4COruRtRdnegyV2pNhOSl7AroLiwpPOyz+H9SzI3
         i7kTTeY6B/430VwdzteasZdLOQKnHa4O5G6OS2yRYSpPJLf3vztsKjzXmed8SE3Ydnjo
         ZcrX2J2H0REBvcP4QLUjz3NIbAxB1k3QOEXIKRQl97XTJlLc4cAN6zThxlDI+qeF0UnK
         nKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625490; x=1787230290;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmsAuvA1xU0GopwYnrPDvUMnEhRCq6saU29mAJvlakI=;
        b=KB0bk8yJyEvYaI2bH93o23wRY/yFzXK4yC8N2Oxqc+jUArWq1vdv6rW//jqIf8itx8
         NN4zwWxtyukrQIlFrS1qnI0dejZkCGSYre31zykNS7fU+5pEO0+6NswPEpAcALb+hBct
         rtUUJ5Eo7e4S87t3sL2U6YEnEhsR4KcaTp/Y37RLOjrZ5LLxil8xOcNHyHV0jMuhTReS
         myBuqEaCf5uQI0GE9xOKYgfueRfm4vdeoSvBe9fiuVT3uNg+eW1sze8HbcEAuiGkSujO
         DyHkpv6xNawLDNHLgZ7N0EKJh13Id0okYTuncrCU6NXJev6CVp0I+Oe1UMIu5thgsf3+
         VTiA==
X-Forwarded-Encrypted: i=1; AHgh+RqoY0uT9cSNjYV9joBTw3/LCZtgKRw+HTP4Dj+51P7qJWMT1fem0dWwUdoUJq9t4zWu42ud3Y47GDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn59pBgylJTdevJMqFTQ2IMj5Fp/yZuG4mMrmsXhYfviJhod45
	4jerrCQ6d7HWiSjLJoWczBKxOz8d9oxOTXgonkYTPttH8thVbt2/+67sxf/3fgpdhw==
X-Gm-Gg: AR+sD10eDgWKpIA4bBRMk9UBWaP4JjXFXOYVuf6R8kV7fHsP109ZDlRSSFt11u6KK53
	luZPHLxIc4Y2tAg/hS2kw9VTtDutaWOioiahmpx8NT7MQVHUAYtyXkofIKj41DrhXEGzCsxZelx
	Tvg9UgCpz6ydfPLziNxv9Jdbjkhtksxi5O09iiIT1l75SaCwoFuyuJfPQy66exEBuXJHO3uKEGe
	3zylyjqrZzMQKPo0hVWM5jt/7XrmJVtwhTQcE0Wt1y8RHkN+6tWtKIbDJKjA0rzB/4o4cqksRQh
	4qH8Brkf81dhKR4R1jgg3gEiki2UW50K/fdIPFWqZg6nYMqwudJ3zb0UumVeZWg0RJCJ2GQsH4w
	i+odNBxFW+nbxqJERhTQ0LHa8X6KxJFeBii7SyC8VNE5cf18YK/RrGjtMicOn5b0ChmeOkNmJUb
	QsodPr64B0VBg7BKCUVtBzVnY2WD+tqmEchUJiOE8NgNvH35PjkraqqT1X2iEdFkjZzOE9mdooe
	zsJEV2trx+dW4a7BAx86zPeH2QBWpcKJugIEOu/45er+ZD28uSR
X-Received: by 2002:a05:600c:5494:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49983f10706mr35687265e9.9.1786625489979;
        Thu, 13 Aug 2026 05:51:29 -0700 (PDT)
Message-ID: <630afaa0-f4b4-474f-8763-fa6ee377f34c@suse.com>
Date: Thu, 13 Aug 2026 14:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86: extend do_mmu_update() to support returning the
 old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
 <20260727150615.1373200-4-kevin.lampis@citrix.com>
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
In-Reply-To: <20260727150615.1373200-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786625490-51AD0B50-0381B76D/0/0
X-purgate-type: clean
X-purgate-size: 4403

On 27.07.2026 17:06, Kevin Lampis wrote:
> A new parameter write_back_old when set will return the old PTE value.
> 
> - The new PTE value in req.val must be 0, this is for clearing only.

As per Teddy's comment it needs to be determined whether we really want to
limit this to "clear". Even if we do for now, naming of the new sub-op may
want to be such that relaxing later is an option.

> - The PRESERVE_AD flag is rejected with -EINVAL because preserving
>   Accessed/Dirty bits into a zero'ed PTE doesn't make sense.
> 
> - Only l1 PTEs are supported because they are the most frequent and have the
>   biggest performance impact.
> 
> - The old PTE value is passed back to the guest through the req.val field
> 
> If the write_back_old flag is not set then the old behavior is preserved
>   do_mmu_update -> mod_l1_entry -> UPDATE_ENTRY -> paging_write_guest_entry
> 
> The new get_and_clear call chain looks like this
>   do_mmu_update -> mod_l1_entry -> update_intpte -> paging_cmpxchg_guest_entry
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Apart from the above only a couple of cosmetic comments, as based on other
replies to this series things will likely change quite a bit here.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3988,11 +3988,12 @@ long do_mmuext_op(
>      return rc;
>  }
>  
> -long do_mmu_update(
> +static long __do_mmu_update(

No need for two leading underscores (making the identifier a reserved one),
when one will do. In fact with this becoming a local helper, I question the
need for a prefix altogether: Just mmu_update() would likely do.

> @@ -4144,13 +4145,41 @@ long do_mmu_update(
>                  switch ( page->u.inuse.type_info & PGT_type_mask )
>                  {
>                  case PGT_l1_page_table:
> -                    rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> -                                      cmd, v, pg_owner, NULL);
> +                {

Why this curly brace, when there are no declarations?

> +                    if ( !write_back_old )
> +                        rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> +                                          cmd, v, pg_owner, NULL);

Even this little bit of churn could be avoided if you inserted ...

> +                    else

                    if ( write_back_old )

... above the existing code, and ...

> +                    {
> +                        l1_pgentry_t ol1e;
> +                        if ( unlikely(req.val != 0 ||
> +                                      cmd == MMU_PT_UPDATE_PRESERVE_AD) )
> +                        {
> +                            rc = -EINVAL;
> +                            break;
> +                        }
> +
> +                        rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> +                                          cmd, v, pg_owner, &ol1e);
> +
> +                        if ( !rc )
> +                        {
> +                            req.val = ol1e.l1;
> +                            if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
> +                                rc = -EFAULT;
> +                        }

... a separate "break" here.

> +                    }
>                      break;
> +                }
>  
>                  case PGT_l2_page_table:
>                      if ( unlikely(pg_owner != pt_owner) )
>                          break;
> +                    if ( unlikely(write_back_old) )
> +                    {
> +                        rc = -EINVAL;

rc already is -EINVAL when make it here, isn't it? That's also leveraged by
the owner check visible in context. (Same for the further cases below,
obviously.)

> @@ -4198,6 +4237,11 @@ long do_mmu_update(
>                      break;
>  
>                  case PGT_writable_page:
> +                    if ( unlikely(write_back_old) )
> +                    {
> +                        rc = -EINVAL;
> +                        break;
> +                    }
>                      perfc_incr(writable_mmu_updates);
>                      paging_write_guest_entry(v, va, req.val, mfn);
>                      rc = 0;

Below here there's a copy of this PGT_writable_page handling, which looks
as if it also wants to reject write_back_old being true.

Jan

