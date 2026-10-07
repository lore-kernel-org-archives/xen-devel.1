Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1480CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:35:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442047.1659576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN7H-0002AU-2L; Wed, 07 Oct 2026 08:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442047.1659576; Wed, 07 Oct 2026 08:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN7G-0002AN-U5; Wed, 07 Oct 2026 08:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1442047;
 Wed, 07 Oct 2026 08:35:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEN7F-0002AH-Kj
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:35:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEN7D-00Gxv1-MZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:35:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6042d-8faa-0a2a0a5109dd-0a2a4508dd6e-46
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:35:07 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6043b-f659-0a2a45080019-d1558035f18d-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:35:07 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso36516535e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 01:35:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1803040cbsm25389685e9.4.2026.10.07.01.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 01:35:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1791362107; x=1791966907; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNlrugeeqhDFnUlFOnug3O3G9mVKhBdJxg6dJhVlq44=;
        b=N6ezHND6zYvLX9jWqPAth3DuGRUk0OMuklhIFR8tWrKVh1khHBM+xsBDSvbyTQ+Ol6
         Ykl0YVs1EcpP5hnXg28NXrPLIa22TMCkih+hvkh8wwYRtwJ/d1bzJvqmR9Hz3qZBUOM2
         GQDzXAubEEYZPmnbchMnevh1Md6bb9QZlDfe9TOx0IlXi0q/wfB6frUox6jMoTOZirwo
         CGexqcjjD1ujyVRZo2ug9x7xsNXgPf8tb5acGx/CAld9gaHyeu4AIQwxggXhQzTnRUGB
         d4aAx/3pggFXde4xV/7VjeZbsvM5ECm8m1BjBGggMMHbB1/w/xw/wRSbzX0d7QN8JrtY
         wKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362107; x=1791966907;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNlrugeeqhDFnUlFOnug3O3G9mVKhBdJxg6dJhVlq44=;
        b=Hvrfg+giX93tYmZ9trbGAD1w0EbykcT8UvuVTDb/XuvYdv2K+KxeZqWrkiJB2l5dde
         GUcPGitkDVKHnZr8YJGxMTvXvn5AS+kFdgeOiBfXXb25K+XlVf9sSN+2tQ24tvXBMAh8
         Ts2rO2nqbF/Fxi+Qm7YkjmXpXQ5Nmq9H8Z9wxzUYqCxcy1OVjqTkiIbVLFL3hPYxLyEA
         S7c0HOCk6N8/TLI3MoNsn89W/mdrd8XrO9rJN0Lmw4qiA+J8z+nfSHV+0i7SGUrSa4EA
         kMWmkaAH3qCegRtu3anbGT3fPXwJ7PUCTC7COZnIafK1pwVnz+yi+Z6QGVQOVA/X0tsW
         yF+w==
X-Forwarded-Encrypted: i=1; AKwUvBxP1F/NHLilDEUz+65tXrZz51UFbj4SSLW7nIo5+0xHSndEvKW00wIUhyYnsau0qgie9V6SxPR00sA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kStGdLL3h2ew2yan9Xa/3AP76OFt7GLHIYEjMTCbnp1NtdFNW2
	say/sxG+k2Os0ULHja3kAwuimpxkynp9OxaLf6wvqwTOJKnjtVDcmBT/b8w+V533/w==
X-Gm-Gg: AYBFou3dmMySPmEm6H0xKk4pfONRp51wmQyzJFIWHtTpMiWiN+LsewTXbWjxz2tgSdj
	1GR38FNkpyAeEDjoWbcsgHd4K+SAmlfs5nriVqV9qFlTWjLKP+e7lYRBREwfAzWtFofhMWwImay
	/pC1Vgjnoad1GXUWmzwlFhaM9vnqPhckXSePT05wUgYA2C+QxjV+ZVr1iqAllHA9rNqt28BRm8m
	MVpdfJ5plt03gqeVm8FBlSp9R+TmcCPYdH7JdjGUyc0vSb668Y2A+tAeo4gDbZg4WE7MPT3RJkX
	pjf06nIdY8aKp2zKhzyBjv1d+bXwV/XqmkZeN9896U79FuSGYv4d1tYreLav1ibdzV3KD1TVA9X
	Ox10eKLt7MY6vp7NxW7mrbIEYZ2XrnLjOjiaQAIXVYKNAXrpc+qHLqoEwVEmKanRMphZF5xINnC
	5umN7RgPhO+/2ibZj7TbAncgiLXvwWTLbjlhNhxCe/9Gda5P05nkWJZ3Ltz7kglCiVTilYz8nUE
	EEm2Hr0Ffv7VYdj63bCt0GIe2Npjjf8P7icXsYDl6bNa8xf4sszdJM3ejn6I8Ajfr/T7QH//A==
X-Received: by 2002:a05:600c:46c4:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a180660fc7mr17504055e9.28.1791362106746;
        Wed, 07 Oct 2026 01:35:06 -0700 (PDT)
Message-ID: <7cadeebd-3ba7-4d8e-9874-aa5f4aeef93e@suse.com>
Date: Wed, 7 Oct 2026 10:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
 <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
 <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
 <22ed9e39767c74e820e964acc2e32a32@bugseng.com>
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
In-Reply-To: <22ed9e39767c74e820e964acc2e32a32@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791362107-D457487B-5A39C413/10/78276251493
X-purgate-type: spam
X-purgate-size: 3102

On 07.10.2026 07:45, Nicola Vetrini wrote:
> On 2026-10-06 18:09, Dmytro Prokopchuk1 wrote:
>> On 10/6/26 18:03, Jan Beulich wrote:
>>> On 06.10.2026 16:23, Dmytro Prokopchuk1 wrote:
>>>> Hiding .xen-syms.[013] assumed the almost-final image is always pass 
>>>> 2.
>>>> On x86 LAST_LINKING_PASS is 2, so .xen-syms.2 stays visible. On Arm
>>>> LAST_LINKING_PASS is 3 and the final image is .xen-syms.3, which was
>>>> hidden. Pass 2 is usually only a symlink, so Eclair saw no program 
>>>> link
>>>> and reported every translation unit as unreachable.
>>>
>>> When I did that work, rule 2.1 ended up clean for both ARM64-* 
>>> analysis
>>> jobs (iirc). Upon re-checking I now see that ARM64-amd has 177 
>>> violations
>>> (apparently that's what you talk about above), but ARM64-allcode has 
>>> none
>>> (https://gitlab.com/xen-project/hardware/xen/-/pipelines/2916569232).
>>>
>>>> Stop hiding pass 3. Passes 0 and 1 remain excluded.
>>>
>>> This will cause scanning of both passes 2 and 3, i.e. consume more 
>>> time
>>> and report duplicate violations when both passes are real linking 
>>> steps.
>>> I think we want to be smarter than that, to really scan exactly once. 
>>> I
>>> don't have a good idea just yet how to achieve that, though (and I was
>>> wondering already when putting together the original patch).
>>>
>>> Jan
>>
>> Hmm
>>
>> At the moment
>> (https://gitlab.com/xen-project/hardware/xen/-/pipelines/2917375773) I
>> see ARM64 R2.1 violations:
>> - 177 in AMD
>> - 249 in allcode
>>
>> Anyway, we can have if-else like this (copied from
>> automation/eclair_analysis/ECLAIR/tagging.ecl):
>>
>> -setq=target,getenv("XEN_TARGET_ARCH")
>> if(string_equal(target,"x86_64"),
>>      file_tag+({"xen_syms_tmp", "^xen/\\.xen-syms\\.[013]$"}),
>>      if(string_equal(target,"arm64"),
>>          file_tag+({"xen_syms_tmp", "^xen/\\.xen-syms\\.[012]$"})
>>      )
>> )
>>
>> ^^^ test pipeline is here:
>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2918571749
>>
>> BR, Dmytro.
> 
> In theory we could even generate a configuration file on the fly just 
> before invoking make. See e.g. [1] and [2]. In this way, we can 
> determine programmatically which is the linking step to consider, since 
> the logic involves some conditionals in the Makefile rules.

Hmm, yes, that looks promising.

> In any case 
> intercepting one more command that is just a symlink does not incur in a 
> big cost: only if the intercepted step is another linking command ~5 
> more minutes are needed.

Yet that's an issue, at least as long as the analysis jobs generally
determine pipeline overall latency. Plus with code size (almost) only ever
growing, that time is also only going to (almost) ever grow.

Jan

> [1] 
> https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/generate_ecl.sh?ref_type=heads
> [2] 
> https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/eclair_analysis/ECLAIR/generate-linker-symbols.sh?ref_type=heads
> 
> 


