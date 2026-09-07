Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E0C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:57:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410701.1641496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3VA7-0005PH-Nr; Mon, 07 Sep 2026 08:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410701.1641496; Mon, 07 Sep 2026 08:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3VA7-0005P8-Jw; Mon, 07 Sep 2026 08:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1410701;
 Mon, 07 Sep 2026 08:57:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3VA5-0005Ok-Qt
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:57:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3VA4-00EsAq-Nj
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 10:57:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7c64-e002-0a2a0a5209dd-0a2a4504ce30-4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:57:08 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7c64-b57f-0a2a45040019-d1558029d949-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:57:08 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49b96837ca3so25901435e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 01:57:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7740d44sm654838095e9.15.2026.09.07.01.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 01:57:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1788771428; x=1789376228; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b1TuQi8hJ+/5nCdhhrLQiTB7nR8a5uYW4Q3nMNx7rA=;
        b=Q5+2SPeq7TrA4U1FiNCzDfZdqU9szglQ1cDDaULGwxbl0TeO70FwsdRazihcrxgF5b
         ST/YAuOSrcBrJ9/JSRCy8Lmdt97vpR6lPvv9Tc+qEM8n6n6Y8HbByUNtGys8NguxUYkX
         tfFwG2HNTDokUoUkPAwxmRTO7qB7406jPO4zxStGUR6Wk4OPoU/eGOYm5jhJB9s+JYuG
         EiIT7w2GmQTaTpS5/5NUHdq5GU7SQT051OW52CNAG+MEv7VHQZJaG+TQ19r612Vkijae
         bNvWxAhdKH49i0J4RcxTpVZxEQBL//a+T6Fvg7vHUjY8mYiLoc6FJuFnH/sy0UUmTmLO
         2mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771428; x=1789376228;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b1TuQi8hJ+/5nCdhhrLQiTB7nR8a5uYW4Q3nMNx7rA=;
        b=FvQfMR7xJu8xu3i4T27g0txf8Q5w+b2RUyjoaT1pv4M8WY9eHwZBHWi8J8qXuYAFXj
         kdjiXkJOdqiQfx3kwjm1UQTq8e/jUurwDntrxjqAa/h/XMq26AYMlRQvUmNd6RIaMsLh
         hg76/NyD2V1G0dMQ45dcE8m20dV4oIqr9dKrLbso80R6lcd+2FeFcAv+X5JRPAsJP9ik
         zAIeDE3Y/UghK+7KmMKLQyoLtWswk+kXb9iH0upu6S9+Sj0ZahCm4Fdlly4Q1ttGk/3q
         mkKRLRYkvGEU2ed5928SNa2pGCL39lnWrY1/DhOX7xG6OwtkqyPeYycOLLJv7wuDIZ6X
         PGdA==
X-Gm-Message-State: AFuF++nbY/e6M4dROB4/x0/ldlq10Kam79WIDe2pf2x1lZCDOIBmujJE
	ISFDMiXuGzrcArIEbslqNi0lOHdevl0RbmL35oBxQobIHOneJUeiDoWgfSvDsExUIQ==
X-Gm-Gg: AYBFou05IK7H9dHPsmJBm9ozVSFVm4Vz50aojWmljuefXdyaT5I45JzyvDEayBobsan
	TaYc4JBmp6V4+Bl3le4l534lKe2eb1BmE+SikvdV1Eqq2mlMhBFh5LLgXXafW1oxAd9RIpd7g92
	ScBI1Qj0rYSOPLC3UKp7G7fPxMkgOOP/74GQtg9ikfZH+X1akbycv1285SDp65YWl2Kf370D3sE
	auAhxECApzApaaDKh7NpfkukMdUcNxZdhflzzmSXsedbgEwVXOxRe8LpGBOZFj46EJCd/4LlD2g
	JhkW+Y3Jn1l58IjeicNJiVbcGiIRMbMhM6TxncHAbs+UWDSQmUmDk8ANvfJAJ9IfFILL7gBj9Ix
	yv4ELBRhjyaFVAGBybqVOh+ZbSuTgU3AeMh0sK2vA3jpmLUlAQ1Fsm170liroZqlE0s7ePLv/Vv
	TlxWRq+cmprgirzTP0YaePHpEt/QyM53D/prM3ruq9fMDoL5c1tSqENHBmf4IfmkCPEYJK1VsHV
	CEVPMSwMsJfs98dcr9U8mo/spTYjMXsi9NVTWUYj2AdvPoJ8pea
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr117813685e9.14.1788771427931;
        Mon, 07 Sep 2026 01:57:07 -0700 (PDT)
Message-ID: <4591a5ee-5fd9-4caa-95b3-81ef9078e600@suse.com>
Date: Mon, 7 Sep 2026 10:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/viridian: Implement synthetic timer direct
 mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-3-ross.lagerwall@citrix.com>
 <aprgh1uBTItcDvbg@macbook.local>
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
In-Reply-To: <aprgh1uBTItcDvbg@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788771428-526CAB50-E8F2F81B/0/0
X-purgate-type: clean
X-purgate-size: 878

On 04.09.2026 17:15, Roger Pau Monné wrote:
> On Fri, Sep 04, 2026 at 03:15:15PM +0100, Ross Lagerwall wrote:
>> @@ -368,11 +379,18 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>>          if ( !(viridian_feature_mask(d) & HVMPV_stimer) )
>>              return X86EMUL_EXCEPTION;
>>  
>> +        new.as_uint64 = val;
>> +        if ( new.direct_mode &&
>> +             !(viridian_feature_mask(d) & HVMPV_stimer_direct) )
>> +            return X86EMUL_EXCEPTION;
> 
> Do we know whether native HyperV also injects a #GP in case of setting
> reserved bits on the register?
> 
> To keep the previous behavior, should Xen silently ignore the setting
> when not supported, like it did in the past?

I think so, yes (and I thought I had expressed this also in the v1 comments,
but apparently not, or not sufficiently clearly).

Jan

