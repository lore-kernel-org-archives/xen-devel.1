Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07048C531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 05:56:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369823.1618335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn8t9-0004cn-SV; Fri, 24 Jul 2026 05:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369823.1618335; Fri, 24 Jul 2026 05:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn8t9-0004cg-Pm; Fri, 24 Jul 2026 05:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1369823;
 Fri, 24 Jul 2026 05:56:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wn8t7-0004ca-T9
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 05:56:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn8t6-000Uhp-PU
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 07:56:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a62fe6d-e002-0a2a0a5209dd-0a2a4506e7b4-8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 07:56:00 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a62fe70-195a-0a2a45060019-d155802bf097-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 07:56:00 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so588075e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 22:56:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bb81dcsm20931457f8f.12.2026.07.23.22.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 22:55:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1784872560; x=1785477360; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkoC1q/+TkULbqjsuzqy2NXhO6ptDn3Eo/D9M+fgH5o=;
        b=ciZyLUu17GyHPtmvdUGRN52ucFY79sjcg7U3iYBB/R2P1aWnVEstFCo4fqrmkY+PbS
         EBuwyegbQ5n5CfiE8fCOQEKsvTIGsREbzarlkPzh6Xk97vpRhQ98RVrI0tYIMwz+GWt0
         FFhkPRyhekHbPDqfyTy+VFwgq2UhzjTvFIkIYvXm7Twe30CFnz00Lg4kNVTS4LarXbsY
         RYOxHesbpC8iFWVkzhU8rxMUUNDAwy9esLMRQdu+wEm3VVvbhwnrjm1BmvvE0vLpQ+K6
         g+OHUg+XaYrQy7qWAlg9S3NYiAAAvgwdkFTzRyEKJd7255ZihUTxEISUA3FhqviIyyG7
         rj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784872560; x=1785477360;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkoC1q/+TkULbqjsuzqy2NXhO6ptDn3Eo/D9M+fgH5o=;
        b=ayLm+40wN6/UE8+BFRaZK/aJP/UbPEkrE4ApW7Se843nceoIS50jHRv7CCzyaF/SVJ
         2kfjLmADXj4YPjHZ5Zsr2i67jkOvJCwAcV5rd7uounN5YCyI53o9N/YQWQuGVIGVJrIb
         xiRF3w1fZo1wH044Ea/pw94Mg6guyCQOSO0S3A3wjVII41tZlV3AD9G+41VmIcYY24jh
         Opcf6vIIRkcRt9X502xfj8jKB+2q/tfRR2Azbq2xTZdD5uMZDPyzgZK3mXTiI4fbpwLD
         lXPqe3Ci7/3GRNgBu4FHaCZxa2IlCod89ByP6SqjjDTskYQU8mh4V07Q27D2LZ3bjqCM
         OQ4g==
X-Forwarded-Encrypted: i=1; AHgh+RouMor0fkz59sEWMiOZX7P4a5w69dkrHWlvYuxcjsgFkWSi7PWGV2mknD1Ckf7ku589lqbp3VIUQmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyc0Qa2bmK+S9g42Ok8cJ3iW3HlVyijs98SlOcjiwggkhpp9y4f
	r8pAekVHDoImdncTjF3U9rk1dRtDhLtxxfV2Vr8fZgOtAJOnsfC1F/uKtBYlghEmCw==
X-Gm-Gg: AR+sD104k978LcqieYIHg19lZiorFFn68vMmqk56p6zhKRLlFCbWtQa2l28VMFSIBGJ
	DndWkHFNUhAehZ5UaAs8C0DT2PLtEK+7u6JLSvagDoFSXu541Ueu4TiIoP89oOjRUs1ySVLTKSg
	VKsT86l2kGCBPon4blzj+6jlJ+w87Any4+gUp4J+Tb2tQ1jvBB4LRnIjj+SB9JlwotB6FKqoePw
	yUQQsAMKt6/uTd4uLQA2E657ANR4N7vBpcUgIhN+Y9gJVFzvyePUnsSsWFgWGXhDhya2mxfASF1
	ceIQy10V5iNz8iecADwFAvAq1fp5vfSqDGb4G7cj0QIm3z1qRhmAmhosQxesWATBjo8CB9igggM
	ckhfhWlsTmCWGxGWc0CoDez1+yv57NjTohzoYKdeORk27B99Nv+tDHB9qvy5nO8+wi5uhEtaA/V
	HLHjm9uqSRsrwjL7I1B2J1e0V9KYNaSuqF+NvVXdAystRQrPCg+ziQ3A8cN8/cofii9TGBRbY46
	5xKpyR+DjMPgDs=
X-Received: by 2002:a05:600c:4708:b0:495:5172:6620 with SMTP id 5b1f17b1804b1-49573d13256mr61631005e9.31.1784872559906;
        Thu, 23 Jul 2026 22:55:59 -0700 (PDT)
Message-ID: <0e54d0d4-3d99-4def-be22-4a7a6f3b2b36@suse.com>
Date: Fri, 24 Jul 2026 07:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260720162819.308326-1-taka@valinux.co.jp>
 <20260720162819.308326-2-taka@valinux.co.jp>
 <88b09f24-13c6-427b-b7a9-aa631e59420a@suse.com>
 <OS9P286MB7222C0714304BA316DD42A4382C02@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB7222C0714304BA316DD42A4382C02@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1784872560-1F8CB77B-8050B1D8/0/0
X-purgate-type: clean
X-purgate-size: 1173

On 24.07.2026 01:59, Hirokazu Takahashi wrote:
>>> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
>>> +    {
>>> +        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling)
>>> +             || !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling)
>>> +             || !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
>>
>> In v6 the || here were correctly placed. Why did they move?
> 
> I saw other code using leading || and tried to match that, but I'll revert it back.

Just to clarify: Looking at surrounding code and matching style is perfectly
valid. We generally (there are exceptions, e.g. when we try to slowly
transition style of a file) aim at having consistent style within a file.
However, our own style is still preferred, and mandated when new files are
added which aren't taken from elsewhere. Hence ./CODING_STYLE is still your
primary reference. And from other style aspects of the tiny snippet above
it is already clear that it is written in Xen style. Hence ./CODING_STYLE
is it for the case here, plus (sadly) any unwritten rules (like,
unfortunately, that of placing operators in line-wrapped expressions).

Jan

