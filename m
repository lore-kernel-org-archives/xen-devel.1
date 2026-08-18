Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EC5C5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393438.1632243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDMB-00085K-LE; Tue, 18 Aug 2026 06:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393438.1632243; Tue, 18 Aug 2026 06:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDMB-00085D-Gl; Tue, 18 Aug 2026 06:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1393438;
 Tue, 18 Aug 2026 06:31:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwDMA-000854-Br
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:31:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDM9-00Fm39-2h
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:31:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83fc37-2eae-0a2a0a5409dd-0a2a45069a56-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:31:28 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83fc40-195a-0a2a45060019-d155dd30d19f-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:31:28 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso3681093f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:31:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0fb867sm122553415e9.10.2026.08.17.23.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 23:31:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1787034688; x=1787639488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyDZfjycO+TTdRa1W0Sw5Qj3fcufPDCKiGcdnnbOdM4=;
        b=J6rb29liKALwB/VIl9civCOEMeDDxSTVA1EdHKPYkq1aAwkFAROcagYsGOB1UabaOQ
         mo4+1CFES3qZ+sA25MmUNoEOkzAaUMe07F/RjTCd1Ke+TcfOAemhDxmLd+0QHQJWYB8J
         s0PB1y2LGoApV43GMcxG7UXABJsfGO97VHqlAQZ+Cq3hxjGU6thdb9KezlD0Hm3W0ZtN
         SykVfWlXjC7o7OkuKyQbnI/IKH7GwTp+heB9bKV3jHCKBSCUNY7DJEGfYgnPwNbY1zCj
         wwTA9jIHNNJ2azO449e6bsigToF5qzW5CYsdCMNFzfNb8Qf+tqeaLm+4EDxzXc8HUFUM
         Kxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034688; x=1787639488;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyDZfjycO+TTdRa1W0Sw5Qj3fcufPDCKiGcdnnbOdM4=;
        b=GK+A/IRjaqsWIoLNSW/3xomiX1PjuCxl0JMxGKyqUFw71rS+XED2bWrfaca6Ofhsr8
         CcJJ+WDZr1OInKO89KHZrAs3dsxPmiFtH3mYSg5AwbTjT1fEjVbsWpPXdr9WU4ss+IQu
         kOrV7ZZn3eFKL9RtVUNIwXGN4DN2BmXqOjJcvzu55LifvN3UyyE8F7GTyPJ+vKIEbBWk
         rODlA6IM/l8XgtRDMsEmDTfseS0lwvE9OrgDsnQZkEBe+U2f8CLfsokhoAF/T4SCnc5D
         k/hHAJpcrP3hoYChHtH7rJF0tuoCtK0UiFHB4bGqvFoxr1VgVOWsbdDailUq2sLkL/PR
         C8Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rp59qLliUe7UB4ZvSVjR+LrHniwq/7Koa8yguTWYg0A479peMXEjh8tZeS3wLbtuat9YnVMkewqkmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2yrMzzLviwj39qwqjwjgVGFlWgh3MrKx1tR3UoMtmuQePgOnd
	MBdFjdX8AJ6MaMjgyYWbrwe4GfYl/wJH9fXIiMV14Zqdzl9jiOhM7C1nwQaT490HIC6FvgzizH2
	+Rf4BiQ==
X-Gm-Gg: AR+sD10YCXkI5HfCx3U0XBFZtaNzWtOopXslH4RYHMTnZss98alkQPgnYI9yHX9X07P
	MIrd1EOpyEiLIDiu+LqqFYPggjmZt84Md+Qcqj5DYnRO78shlhCJxesDGYWPjHXRvh7ud1bZrc7
	iiF0Jv6mCxpH8oClT0lo717tmNDTnru0aD1IB4YukcR4IVh8hl2swDWHQn6qkLNY/H1URYvVJcC
	WNgCU8fxnZPfZ0NF9gjkKqEKGietmm1G4Xo+jAuhq2Hp+EeNs1mO6hB09lZ4kR8I4b96nL67Xm1
	19Sd1NLAA+HwnYgILIHAuuTCXmqPM8wLBJv6hhAXpRB8u1WIkjMlNjQYG9uuAla4od1F9lWe7Q9
	4BG80RU6r4E7zI7wMTeTc50HED+FjzHPB6aLwd+NfHFOInsdMLL48BGoN0s4xuiyPCKijDzo7bw
	SBYvngM7FquzXPIaJPxQT1XxJeokNbSwNARW9CAQbH8ET2FNqoAoJB3gNmS5CIGkprLMyHphSpJ
	/Ltmzvq9KKDNtC1snaA5nvKRGtUjC5l7dlkDJsZ/M3IocVgzimy
X-Received: by 2002:a05:600c:1f91:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4998797d111mr413171765e9.15.1787034688334;
        Mon, 17 Aug 2026 23:31:28 -0700 (PDT)
Message-ID: <e3e692f6-c9f6-4ed9-9212-fa61521f22e6@suse.com>
Date: Tue, 18 Aug 2026 08:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/emul: Rename the x86_seg_* system segments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260814185841.1757421-3-andrew.cooper3@citrix.com>
 <20260817121129.1787344-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260817121129.1787344-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787034688-FEC7777B-BEE320B9/0/0
X-purgate-type: clean
X-purgate-size: 1313

On 17.08.2026 14:11, Andrew Cooper wrote:
> @@ -131,18 +131,21 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>  #define SEG(s, r) ({                                                        \
>      s = (struct segment_register)                                           \
>          { 0, { (r)->s ## _ar }, (r)->s ## _limit, (r)->s ## _base };        \
> -    /* Set accessed / busy bit for present segments. */                     \
> +    /* Set accessed bit for present segments. */                            \
>      if ( (s).p )                                                            \
> -        (s).type |= (x86_seg_ ## s != x86_seg_tr ? 1 : 2);                  \

From this, ...

> +        (s).type |= 2;                                                      \

... this wants to be 1, while ...

>      check_segment(&(s), x86_seg_ ## s); })
>  
>          rc = SEG(cs, regs);
>          rc |= SEG(ds, regs);
>          rc |= SEG(ss, regs);
>          rc |= SEG(es, regs);
> -        rc |= SEG(tr, regs);
>  #undef SEG
>  
> +        tr = (struct segment_register){
> +            0, { regs->tr_ar | 1 /* Busy */ }, regs->tr_limit, regs->tr_base };

... this wants to be 2. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

