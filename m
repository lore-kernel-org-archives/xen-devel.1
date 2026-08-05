Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E58C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:40:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383024.1626280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXAX-0001Io-Li; Wed, 05 Aug 2026 08:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383024.1626280; Wed, 05 Aug 2026 08:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXAX-0001Ih-H2; Wed, 05 Aug 2026 08:40:09 +0000
Received: by outflank-mailman (input) for mailman id 1383024;
 Wed, 05 Aug 2026 08:40:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXAW-0001Ia-O3
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:40:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXAU-00EDlS-Ud
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:40:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f6e4-5cb7-0a2a0a5109dd-0a2a450a8f22-12
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:40:06 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f6e6-f2d2-0a2a450a0019-d155802eddcc-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:40:06 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so6480415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:40:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e04c2a1sm73635405e9.14.2026.08.05.01.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:40:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785919206; x=1786524006; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jA5HpDKU3mE94gRzH25Q1Upi+BYpu+RmxlAHFb4abds=;
        b=cyv7L5cS6mKU22GIR2JWZ8UDuGiFX3CaDLNKUZG0zTJ8yjHrD/O7AjKs4GYG89cfKy
         vI8RNjPRqVniu8xpUJAy5HTlejRx0ty4pbcLLhhwCZVZKBEMBYcW17+jwo2R2RhR7f3M
         SCMBwT/gyhfPY4dhZnhv+1tKOc/B1xA1Y3fBhn17DFyqNYneC2ItN9MEHtKfs4UpnUtc
         9UciQhvEke5QJu/V4Ii7CcgN21DJkFUbfrm4twkFhGSOqlBJqsO/CQwm8cX3T3Z/LB7j
         Ufkymgf+eEMkTy3dgHwbPdqFBmkQkYMFNg/Bt6lc1uW3nfeCsWRFiMs38tYC8P6pEdAl
         kPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919206; x=1786524006;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jA5HpDKU3mE94gRzH25Q1Upi+BYpu+RmxlAHFb4abds=;
        b=f7UpKW/5VG7ksQ14FAjuS+6f7NrjR+lnFlSSLIWDYd0j8sWfrKTe+IgwvKMhr9unPQ
         s7IO6xqBW0Z7uMKIjmpG1HQ8VG+CaQLKoJIBzj//ziYDRWUfdYJSf0cah6Dv84BVE8h4
         Tchm2roVgOldKSSxZI7QWF8VvGqAakHxBvZb3EECo0cSrSAoyxt4GsIivnsPMXW76HgN
         wqp7Jb0Khs6Ht+oi4DuG36yT3Sxyw1PuFVGtbt5XRxb75HT2cJI9H3YL5wZ+G0MetX1A
         OSXFgznO1MEQlo3zfFO09UY2FcLkBEPLngZ/f2nGuV9AcrC4xDeryIg4kJ6OwRfTxTKy
         ruTg==
X-Forwarded-Encrypted: i=1; AHgh+Rrj/po9QEjOpHd6WoZvNn1+fLz83rvaR95Ftwtmz0kUbtImpr+wbBpm4CayC5gOiFek0iMF7XkA8/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+cpvUGWsvmmouwWnnovTLSMi3Cmt1REIobt4j/ZDo6ANqxpAZ
	Rn++WIbL3TM0HUyEuQl4mExj+0VsgYnHRV81CuCvbcWnPgzw43k6jssI194mwZnlbA==
X-Gm-Gg: AR+sD13E5FdnD7EBbHTZd89LDWyFe0p/d5u42jBO/xvkR7mfQnTFA/eu1hVBhMcIms+
	yY4BXM8Wed+smjhZbbbYbkfkDzgPrnxe7Tdf7HW0TQRWez+/h8RY8Eky4XN4AzFi04J+qZRsmmB
	uF3NOAsRh+r/vR8xZZLdIfeEkX/ccOy5Iy5gm/0eF+UqqWAwPFhSFXcUVZYAQG4aPh4Z8NOHsWB
	fXTbUe3J3t7xQxgFp+qL62MVtqXwd7r0LFQvlYMzW7UH+GGl11RyT09vxjUQ3Y1EhByoRmlzD/q
	0J/XjOzQbKudKmWko7XTZbeALPDAelCHN+2bvia3TgJBbI5cYUTr3DjimbY2/edTNESMZGnbbnr
	Oci5X2JNy2NlT1w8ry6g0Yiio3nfGqJVRmqm6R/dGfRIJEZ4B/KHbMlIITOiju/KgfqnLghtcEm
	BOT6OA6BQzPTOmazbHsxWJvtstBGiGJGdW63bnIgniXmWHpK9w+n1wN9o0YzSTSzXZLVWRw0WI+
	t1/8fmmPTOg5t6l+95Qz6kqRiG209NGRCTuIwgVaXX17jcntjrk
X-Received: by 2002:a05:600c:1d0a:b0:495:78af:78e5 with SMTP id 5b1f17b1804b1-4994e70de03mr55446075e9.1.1785919206212;
        Wed, 05 Aug 2026 01:40:06 -0700 (PDT)
Message-ID: <5e7d500e-7403-4a64-8e4d-50f1031716ba@suse.com>
Date: Wed, 5 Aug 2026 10:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/xen: Remove redundant config dependency on
 X86_LOCAL_APIC
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-2-jgross@suse.com>
 <08441834-6087-4cfe-8d56-ba660564384e@suse.com>
Content-Language: en-US
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
In-Reply-To: <08441834-6087-4cfe-8d56-ba660564384e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785919206-4ABD8CFC-B6B09FA4/0/0
X-purgate-type: clean
X-purgate-size: 478

On 05.08.2026 10:37, Jan Beulich wrote:
> On 05.08.2026 10:21, Juergen Gross wrote:
>> CONFIG_XEN depends on CONFIG_X86_LOCAL_APIC already, so the dependency
>> of CONFIG_XEN_PVHVM on CONFIG_X86_LOCAL_APIC can be dropped.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hmm, looking at patch 2 I wonder: Isn't it XEN's dependency which wants
dropping? XEN_PV shouldn't require X86_LOCAL_APIC, should it?

Jan

