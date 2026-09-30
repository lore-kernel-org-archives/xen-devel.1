Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F9CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 09:38:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436984.1655675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBqlm-0004rx-OB; Wed, 30 Sep 2026 09:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436984.1655675; Wed, 30 Sep 2026 09:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBqlm-0004rq-LC; Wed, 30 Sep 2026 09:38:34 +0000
Received: by outflank-mailman (input) for mailman id 1436984;
 Wed, 30 Sep 2026 09:38:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBqlk-0004rk-Uz
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 09:38:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBqlj-004XVQ-7e
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:38:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcd88a-e002-0a2a0a5209dd-0a2a4508cb3a-38
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 11:38:31 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcd896-f659-0a2a45080019-4a7de18c8857-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 11:38:31 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffbd83a92so31478775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 02:38:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a015a3fa16sm27647115e9.0.2026.09.30.02.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 02:38:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1790761110; x=1791365910; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDBtH038ap79UlEYFLZmNz1/uOMJu+6MVtx929qem8w=;
        b=WegxrsxH5POVtCUg86lp0tQ2ckq6iNKPhqIMp6pYwgxTM95TT3BDc+XKtxPta2rTLj
         tjWYo84bgryHzOUZ6FlJkMH+LA99xemMRLELWT0CdHNBmloQzeikUQcbPHDF/h1QwegN
         Qb/0nTyaMJ2+sXFrghAG5Fg1qwTVbcn0Wi3UYaySKQi84JQRR5fDe5KseZ0XMuJAX8JS
         nHSQqx6+qK7ylYzusaYqvZOX8Fskr+54KL9nnIxTX4pJ108LqzrByzmCPFXMNHeghHol
         SijuqqYhyNl3swF0hISruQr3kKYcnSDr9rEt38DAoxa3I8wzj+gWkhYMzSCp+1tgRXdr
         dmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761110; x=1791365910;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDBtH038ap79UlEYFLZmNz1/uOMJu+6MVtx929qem8w=;
        b=W7wuCTnDMDRVwkRqTrkg0cumSQKPySc90nxVCN+t6SfBG1VkwTk63itH6AqFk9ZXWR
         c4GA3o0n65OLAWZWwWr1vixD4XRKsJPeNR/xisCE5u+urteofvktorS5Idpw4P2WHLkP
         OYDRLd5F1Y/Cs0iUcoWfB/3b45VIbYFCNNvYWZj2n4icofC+WOrAhnK33WuXWTZf/Xtj
         rQsGNM11A3AOBvsnlRomOR9P9pi8+WGbVq3dyj4XebXguI1G4POoIhH4juL2pgwjVuYu
         Idjw63NRvFOjvg/zMWX9pKrjzqOw2x0hx2lYyz6yAw3gmBjVgdRRvNXY7mvIe8pqGxA2
         4j5w==
X-Forwarded-Encrypted: i=1; AKwUvBydmiqHjiVT2m05+r2us2nOh3pRvejWis/45uuiXRawP8XdxygxU2NAlfK0twsgnDF+24K1b13wSKc=@lists.xenproject.org
X-Gm-Message-State: AFuF++nMn/Wsk0FlJNvAwBjgWSTiT7uGHG2APdbrqyN+/jdag5bfOAj+
	J/aL3/3Pcr058qlAPdrJPvMH6B3m9l9Hx5QXm0/uZKABTkxkg+mQtsvRhITSqg0eAg==
X-Gm-Gg: AYBFou0eGrz8MEG99OM9iTxmRH+IXpgu6DuirH3wVNpd9SDgx6Zda8LJDitozGIRgIl
	r74cPYCC95bndFF2+9sn4hvDPHm/ea6UZ+YHMtqs7SrCqAG+Th499USDLo1RiqNLTvjuhUxC2I9
	PN6IUeAHdC5FXFObt4AfixOa3R8p9Jb+zv4ozB9J9zgWyKeLJVBsiqssJhZgjQqQox/s2RmZ5hy
	MUBCj7uQfbdIzFSPREc/lHBdCtsUwPkFtFdmRYvNBx3BrykL2OqP1qvY05JF1NaQEf6ipWbaDgc
	60KdfAYH72Cb2UYElaUF1FKPwvLdTZ0OtyJ0q1ldyP4msReOBwVd3ySR9jzp4xf3gABUQjp60hV
	PHfVp0oVRDL2VRZcmZ0F/pQeEgeRQqYXJ3/9+wOnKroOuXYTwldGyj9+S0/ZFSN8WgqgdJNrvrE
	4vVbWc2aYG3ZlJU0j9EUNPhNMMHmSggCuEJ7zQAImxE64zeu6B3TRKpV1zBdNpFw8M9KCFMPGgb
	L0Gx2SOXQ64Wv92uW6x5IXPPnuWaO1HfmtVOOdILihl6sCLJGlO/Y+YeLbATQ==
X-Received: by 2002:a05:600c:4e42:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-4a01afe84a4mr14374245e9.5.1790761110591;
        Wed, 30 Sep 2026 02:38:30 -0700 (PDT)
Message-ID: <7a2a00f1-9810-4c3e-b70d-076d325bb4ca@suse.com>
Date: Wed, 30 Sep 2026 11:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] vm_event: vmx: Allow intercepting hypervisor MSRs in
 debug builds
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790251049.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4@vates.tech>
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
In-Reply-To: <1790251049.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790761111-D6F5F87B-ECDC32F5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1212

On 24.09.2026 13:57, Teddy Astie wrote:
> MSRs that are not covered by MSR bitmap (e.g hypervisor range) are
> unconditionally intercepted by hardware and don't need any specific handling.
> 
> However, vmx_set_msr_intercept() wrongly ASSERT() if the MSR is a part of the
> hypervisor range. Fix it by skipping the ASSERT() in this case.
> 
> This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR
> to configure a MSR intercept in the hypervisor range (0x40000000–0x40001fff).

I don't follow here: Why's the hypervisor range special? Any MSR outside
the two ranges covered by the bitmap would trigger that assertion,
wouldn't it?

Even independent of that, perhaps it may be better to use ...

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -986,7 +986,7 @@ void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
>          if ( type & VMX_MSR_W )
>              set_bit(msr, msr_bitmap->write_high);
>      }
> -    else
> +    else if ( !((msr >= 0x40000000U) && (msr <= 0x40001fffU)) )
>          ASSERT(!"MSR out of range for interception\n");
>  }

...

    else if ( !monitored_msr(msr) )

here?

Jan

