Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038CDE81BD3
	for <xen-devel@archiver.kernel.org>; Mon,  9 Feb 2026 16:00:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1225661.1532216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTgX-0001S8-MZ; Mon, 09 Feb 2026 16:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225661.1532216; Mon, 09 Feb 2026 16:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTgX-0001S1-ID; Mon, 09 Feb 2026 16:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1225661;
 Mon, 09 Feb 2026 16:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpTgW-0001Ru-TY
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:00:24 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70916f8d-05d0-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:00:22 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1322212f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:00:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2facsm28076279f8f.9.2026.02.09.08.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:00:21 -0800 (PST)
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
X-Inumbo-ID: 70916f8d-05d0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770652822; x=1771257622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QsQcnTvDD0fMCYRZAqWuqIi6lF3Ggl8vSR3JqaKNiUI=;
        b=J4q8WUaEAVqswwQ2rQ6khUnqwgtbuWpiysWw17Re0FHGbHvkq6jvtMpkbOVn3Z6uI/
         a2lqUNVA/aRrMa4XAiU9q4rcg8xAwqFm66+IWtcopUQmhaHPHbQBPpMd2lDTSuqhQOXS
         OFCRd89+Vr2nVe+E9eE4vQ38ZTZSWhhBhw5Gc7f9tXtSWpG4ggDERy8bmUSqCsNpxmIJ
         hBaq/dB5Zc19dWxJhGGICEpHALmIvPpGlSr2pRIXRosK8ekM+R4oq7N0L6eu0+50hgCj
         X5bml27kX/7eDgIr6sYND/4ksON8ZPhiAXJsx7Qb2vzJ7pxeR0X6Ncbcq9/HWoetzVNm
         QnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770652822; x=1771257622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsQcnTvDD0fMCYRZAqWuqIi6lF3Ggl8vSR3JqaKNiUI=;
        b=hF1tHbt0ePNUTm+rgg47ImzlURk+ot1wUAiCorvs/rXI7CMijmA0UJIvJUuqmD3O99
         BSOAB7riuZW4rpW7vZvgzp9yyMisXtpCCvYf1jY23elgCr4gQul55B7xEu4DT63X2vnv
         QpXVXMQQpfV+iknJsYfEF9j+/z3MnFXNWdDvtHOC1XN5EJDFoa3sJzCezY7t5Pm5vgmh
         cMO2a1gcjWhZ5VK/EvEJLLX2rqvKKHZHcJEmwiAmbhKfEVZXufBv6FrFP6Y07K4iZpKd
         JuhOlKkZ+0Wr7rRQOaM5toHcXfMZ+LKKxfbRDdxDMYuQ3dBaABml8ds/wc04du+mLL4L
         +FRA==
X-Gm-Message-State: AOJu0YyrOenssLfODTT7A9DsGWnUmQnK4NZjzAs5o8h8emVglHzH0kop
	/PNhBo15GyMFfa+9clnV5R0BgWeRAAR+vZVsIsMILtMP3UFmlBtooLdlpRIFV1WiarIBwmRVB60
	2Xcc=
X-Gm-Gg: AZuq6aJZJKy3hckKNETkYFBnUh/9sSnh+CBaVcf3UDiLaPYcdnD7xlLux/kzht/J+Un
	yRqF5NsUklB2qulDXacY93sATjE0Ix4kO+4GGP8NIHJrCSI4RTIQFZtEVpK0kSCs/kgZY/RlW1M
	asHSMRTwPnMHUy2ciDFr0mkxmYNK4Ka3Ap7gxE3g6KWsu5i2tQ63Wleo0uKq0pkHxKN8p6r+t/w
	BXMr3RhaRAK8hSG6jMZ/eU12OSplIOsPSxpATB+ntifT9kOi6xp/THrzwyvvv/sJVDfbeQSxurk
	m91fblj5ccKzRXFaR4ANrk6CSwvrhzxSkdzzBwTbhJqU58DWVcCUKmGbA8BB36UC94/rExgjAvo
	gtWK1hiJclJB+ICpXBShy+U16/x/df8QTRs2GIU0UP/yqH8ROv4fiB4BnCpg1mjNk1KhgM4hXj/
	PelLRJkCAi7IARuWqJybwrXH3nw64UFbAYZOfzvqK/0VHxd8cR7hhSSoaNef/E/UKqV0mdYv3ci
	8E=
X-Received: by 2002:a05:6000:238a:b0:430:f59d:4dfc with SMTP id ffacd0b85a97d-4362933beffmr14537989f8f.9.1770652821926;
        Mon, 09 Feb 2026 08:00:21 -0800 (PST)
Message-ID: <e62b2f28-0b4b-44a9-84b7-c8f2d0313009@suse.com>
Date: Mon, 9 Feb 2026 17:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
 <aYoA0jgj99Ani0mF@Mac.lan>
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
In-Reply-To: <aYoA0jgj99Ani0mF@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.02.2026 16:44, Roger Pau Monné wrote:
> On Mon, Feb 09, 2026 at 11:31:15AM +0100, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -623,10 +623,12 @@ int paging_domain_init(struct domain *d)
>>      INIT_PAGE_LIST_HEAD(&d->arch.paging.freelist);
>>      mm_lock_init(&d->arch.paging.lock);
>>  
>> +#ifdef CONFIG_LOG_DIRTY
>>      /* This must be initialized separately from the rest of the
>>       * log-dirty init code as that can be called more than once and we
>>       * don't want to leak any active log-dirty bitmaps */
>>      d->arch.paging.log_dirty.top = INVALID_MFN;
>> +#endif /* CONFIG_LOG_DIRTY */
> 
> Could you possibly init this field from paging_log_dirty_init()?  As
> to avoid having more ifdef churn in paging_domain_init().

Hmm, I was wondering the same, but then trusted the comment. Looks like it
may be stale, though.

Jan

