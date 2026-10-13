Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADE4CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446837.1662933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZ21-0005sq-5K; Tue, 13 Oct 2026 09:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446837.1662933; Tue, 13 Oct 2026 09:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZ21-0005si-1V; Tue, 13 Oct 2026 09:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1446837;
 Tue, 13 Oct 2026 09:42:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZ1z-0005sc-MV
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:42:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZ1y-007I8L-Hp
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:42:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdfd10-2eae-0a2a0a5409dd-0a2a450ac8e8-18
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:42:46 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdfd16-f2d2-0a2a450a0019-d155dd30e9d8-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:42:46 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1594310f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 02:42:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0967affsm3752255f8f.1.2026.10.13.02.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 02:42:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1791884566; x=1792489366; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxuJO6v0t7axAJy1A/2p0M1yzgOxBdQjnXoQINhCbgw=;
        b=gX7y0vwgv+DEB1YqOhgZeUZbS/SC939ldNqM+6k5pJFQBtIbntdevbstxi+SyJ06ER
         dECj2wopTVXKpqleBebYdYR+IrN7QWOxEuj95071WVEAUpkdPvV9BTwACRYWy8mKS/Bh
         1KX6V6RjG285xjEHKFO/jIUHvDU2PwFTPfkhzNol9K1csXgXN2QVNF8uB8mUF7U2PVia
         W3xbEMqqNMUFC9ZG5AKZhwXFW0cJqIpeKOvuzgEWik7T7XEQKOH8MzEdNWBYvPt/xzdS
         htqFkUfU3apbuHvE3JKFbcijpahUrFtN3EeHKBDz8qAV9xKifZlLgLhywPoVLqlqF3OU
         vvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884566; x=1792489366;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxuJO6v0t7axAJy1A/2p0M1yzgOxBdQjnXoQINhCbgw=;
        b=whl+T5CNZpPU+PG4W9WhZqZwGIIrn7WQLHjo+8N1G5HRaKwoqWVD6k7RhlCf4/Vhl2
         ny+5ur55GAjNmIJ+JLc1hu5mUuAKP1xiqTqtAejjrvzemYToI9HotGkcRXZNGrsXxXKH
         BjhwGrf+QfVso8k2y9jh7blqisYdg4j6Mm0QX9krV+aclLphzXMWaJVlb55w7sFkicuo
         mucrb+g7z95XSQ07uMNc19it2W/zap2wx5cWZr9IUaYW60SFbTWKjg8PLOEPvHpJsEaA
         cdbzIr8LaklgtHwa9Z6p+U3DJZCaxONZ2tbr6GH1qiqw4DrXhGvrFzId1DP3DQkATdDT
         BlKw==
X-Forwarded-Encrypted: i=1; AKwUvBxDeP+ucmU4gLTSpwH7FA8kjvB4wMe4Yr78qXF7V573FBkIcrpZhrW/9iVS6Uyoij7qIZBfIr4lJ74=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI4YuNl+E5C1j88xc3JnUvymf1Hat/iPAvSWeFA0G3O0/m9uP0l
	fWsuc5uxrJg9+a0XiBHU+xLAEA/cceu5VhEnKoG33kQzGkWFVbQKeEtsTzRAlN7u4w==
X-Gm-Gg: AYBFou0OWtRZiZqyPwvhmm+J8qDW1TYWG64jYTatrHcf7AlrsEaX0tgmvDkMTmhPInv
	sVtEaUkC/xqQ6xLU8BZ3Oyza+lsIZtJGRAton6DFlRQqOWwYIAMgZFmxcDsjUaBFR8EUT7My9Nj
	bnK27ZQCewrUYmqDQvAxsG/dRsnMQdm7qx9A9dUxlu6Gx7Tc/X29FlPY7yjM5OkI6F6tTW08otC
	uxkVymRtEwAL+CsHzIUWV8CRQPKm7fZyaL5HOpKUUYsiJRspurJYWz194QfB3FRzvJYOGGJSNV9
	vPLUc9xrMJAG8tYW7eqUimd/qx8VkvnWetTl1na9WuDL1A0kKORD6YWQmW8Or6SlkabD7sOECW5
	I92UlD7fIKSrzHxVhKaj4+zhwnftjT3NHkggx3DKHffXIpD4rtTJsNb0AI9f8fyDHjyVDKeRWyk
	EaYHAvz89hzCt3+KH7hsCY/fKEyDtLLBaF4y1/g3rkoW+3MsVBcPOpdfB00yQwdFW05pggCmlsK
	KcRfFN1iwcXjitx7bqBP4qK7TEWKgAcTIfDQKjGfRKpuyMTaWULEmrKFGxj2g==
X-Received: by 2002:a05:6000:260b:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-48dba9dd11bmr24009612f8f.35.1791884565756;
        Tue, 13 Oct 2026 02:42:45 -0700 (PDT)
Message-ID: <8b1e612d-395c-46ad-b327-2718dd9d83cb@suse.com>
Date: Tue, 13 Oct 2026 11:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace/vvmx: Correctly report TRC_HVM_NESTEDFLAG flag
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1791882665.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@vates.tech>
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
In-Reply-To: <1791882665.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791884566-526DECFC-AFCB57BD/10/78276251493
X-purgate-type: spam
X-purgate-size: 1944

On 13.10.2026 11:09, Teddy Astie wrote:
> Currently all VMEXITs are reported as if it occured "non-nested",

Nit: s/ it / they /

> even when the vCPU is in "guest mode". Making distinguishing
> "nested virt" VMEXIT to regular ones much harder.

Same for entries, as it looks.

> Fix this by adding TRC_HVM_NESTEDFLAG flag when the guest is in guest
> mode, matching the svm logic.
> 
> Fixes: ??? (???)
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> I can't really find the commit that introduced vVMX. But I guess it
> would be the candidate for the fixes tag.

For the exit aspect I'd suggest 3bafd4a90995 ("Nested VMX: VM exit handler of
n2-guest"). Changes to vmx_vmenter_helper() came later, so I'd leave it at
that.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4209,9 +4209,13 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>      __vmread(VM_EXIT_REASON, &exit_reason);
>  
>      if ( hvm_long_mode_active(v) )
> -        TRACE_TIME(TRC_HVM_VMX_EXIT64, exit_reason, regs->rip, regs->rip >> 32);
> +        TRACE_TIME(TRC_HVM_VMX_EXIT64 |
> +                   (nestedhvm_vcpu_in_guestmode(v) ? TRC_HVM_NESTEDFLAG : 0),
> +                   exit_reason, regs->rip, regs->rip >> 32);
>      else
> -        TRACE_TIME(TRC_HVM_VMX_EXIT, exit_reason, regs->eip);
> +        TRACE_TIME(TRC_HVM_VMX_EXIT |
> +                   (nestedhvm_vcpu_in_guestmode(v) ? TRC_HVM_NESTEDFLAG : 0),
> +                   exit_reason, regs->eip);

SVM code uses a local boolean to avoid the separate (and now also repeated,
considering the later use) nestedhvm_vcpu_in_guestmode() invocations. Thoughts
towards introducing such a local here as well? (I don't quite understand why
they also use nestedhvm_enabled() when setting that boolean:
nestedhvm_vcpu_in_guestmode() would better return false for domains with
nested not enabled.)

Jan

