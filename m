Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AE6CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 13:01:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451823.1666674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHhYQ-0001az-Dx; Fri, 16 Oct 2026 13:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451823.1666674; Fri, 16 Oct 2026 13:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHhYQ-0001as-BE; Fri, 16 Oct 2026 13:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1451823;
 Fri, 16 Oct 2026 13:00:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHhYP-0001am-Ko
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 13:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHhYP-00BI3v-1G
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:00:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad22008-e002-0a2a0a5209dd-0a2a4503e226-2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 15:00:56 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad22008-fae8-0a2a45030019-d155802cf0ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 15:00:56 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso29903355e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 06:00:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf05009csm40328065e9.10.2026.10.16.06.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 06:00:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792155656; x=1792760456; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VzQasMx3AclanLA//drErojCbGFBcuIocNUtysrGL4=;
        b=WZ/KqLzC5ROOIOis6e4mTWHlKj+SWUsqZCa7y4II3W5VEmfaloaHpiC53Y4f8luZmi
         d985irvzkDoQTjfgU+uEWq0WvINe+clbFHmv7L6tbwlsZHLXC73aWvJcatcZ1534RVU+
         TWTb8PbtBlA/YxE7eij+L89969m/dLA6YesHRO/Vmex929YShcTx6TnMk09f1TFKPVvy
         pj6MP4ggvj9Oj9K6hmTPxMmnwN2jllYphXm3Q+nx4mCYPUwYiXHTJKIW5qX2ZTPVUEDX
         MObB4Hp68znK/398rMnzRdWwHnT/qo+Mf9WpoyzXxdvsvId4WBpeFSU8EiftCeBJjJuJ
         2Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155656; x=1792760456;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VzQasMx3AclanLA//drErojCbGFBcuIocNUtysrGL4=;
        b=HXxMw+yfAKqFu98G8GziPR8A4ayOX7FbMZLq7VvzhEQgCHcIJEnCO5LX0YXonM+9um
         RNIJW+/U4FY47inVNwdnwxQ8Mt+wLi+xJM6H0w3233/gkD91etb+cU9FLp4007hLLLlK
         NnSvouzHDO1Rlgf1qYjEqF5P5DSyNEa5qKf7tgFmkHm6auOYHmEE94otnHVpkWQQOGIR
         5AJywgWUe+l4wKAUlSaa87dpqtHY1Yles72+1RfJWVN5D9EQsLaVZqDY3Q7OWtGysDIv
         emmMXngo5uJkEW75yGRqFBnaXboXqObswbsHPniv5GqG4T4iACnGSvDleJIOra30tVIP
         /rGg==
X-Gm-Message-State: AFq9FYK+oau3jPtrLgrJiloMV+XXcNSqvmQMKlVlOdYZ3xKKDP9rhd3p
	jQRzZrhIJ31OPDZ3z8B7gMT73WjaMpILSS8GmoVMCC/vHGhqqOfgYSlU2ci103JooQT/m+z1aoy
	T4MHOaw==
X-Gm-Gg: AYBFou1gytP/A90N0CZUdakjn2pmTRIKD66VPP6P7TfBOnAmor408nfJDn4uKf43aEK
	iepUVDgqFTYg+lkXUs4Bgz93Agh9T5+dDb/2OQJ3tqRj1BWJwvEzRJ3S6OXW3+IhkesbYSSc5Xw
	67ma+PLSgApOqm6s2pRJaPqbKtnajQ8PICsczD0JjYYioRdwuvNreCF5tsK5JTo7WYTe27WsmNQ
	GTH0uih/GaOC/xCNJf5h4FuQNJTVkDvMV3YJbj1GM0ZYsaq/BR3z5+VLAQG/5+RUNBYV73KyIdY
	7zGER1KCAoITen7gT98oJ5thxuSYqM+3rzFLRPGOZdnqHRL1TQ41m2LGjMRvRnfUspcFU3kK36P
	AZV+akqUTmzrI0Lc0rkiMlHYZRA6dr2kMb9YYHLcNW9Mf78pv1botat7NSRrBaZLQhwmcGPSI3z
	r7+JBM5lSLsw2ucjVkh3w6x3S5/5ulpt57IdqnW2oAlWBobJfubwvZFyGaZOMgcdOqXHvrTq1sN
	LDI0wpt5qdz8qsErJ4DLrZBtvxLKoQ6Lkry0GC/HnoFiMndZnXZk2IHTYalyA==
X-Received: by 2002:a05:600c:8518:b0:4a1:7ecc:b23c with SMTP id 5b1f17b1804b1-4a18e49879dmr417473045e9.6.1792155656301;
        Fri, 16 Oct 2026 06:00:56 -0700 (PDT)
Message-ID: <37a6531e-0908-4453-acf2-4174966ac4c2@suse.com>
Date: Fri, 16 Oct 2026 15:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
 <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
 <2f04c46d-f533-4eda-9bd1-8b8e100dff07@suse.com>
 <1792150520.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@vates.tech>
 <25337ffe-67fe-4db9-8407-2f227eebaf32@suse.com>
 <1792155284.8631fc262581453bbf619ec5b2062170.1a144c773b70008425@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <1792155284.8631fc262581453bbf619ec5b2062170.1a144c773b70008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1792155656-6E2D04E9-6721D603/10/78276251493
X-purgate-type: spam
X-purgate-size: 3032

On 16.10.2026 14:54, Baptiste Le Duc wrote:
> 
> 
> On 10/16/26 2:51 PM, Jan Beulich wrote:
>> On 16.10.2026 13:35, Baptiste Le Duc wrote:
>>> On 2026-10-15 18:04 +0200, Jan Beulich wrote:
>>> Based on Andrew's answer to your question on GitHub [1], I see two options
>>> for handling a DT that doesn't advertise the scheme in effect. Please
>>> feel free to choose one.
>>>
>>> 1) Trust the probe and fix up riscv_isa on a mismatch. This avoids having
>>> people edit their DTs, and is safe as, per Andrew, the spec has only ever
>>> allowed these two schemes:
>>>
>>> /*
>>>   * The privileged spec allows exactly two schemes for the PTE A and D bits:
>>>   *  1) hardware sets them on access and on write.
>>>   *  2) accessing a page whose A and/or D bit is clear raises a page fault,
>>>   *     so that software can set them (ratified as Svade).
>>>   *
>>>   * Hence an implementation without Svade uses the hardware scheme (1), and one
>>>   * that faults on clear A/D bits implements Svade, whether or not it says so.
>>>   *
>>>   * Rather than trusting the DTS alone, probe the scheme in effect with a write
>>>   * through a PTE whose A and D bits are clear. If the DTS does not advertise
>>>   * it, replace it by the probed scheme. As the spec has only ever allowed
>>>   * these two schemes, this is safe even on implementations that predate Svade
>>>   * and Svadu.
>>>   */
>>> static void __init check_ad_scheme(void)
>>> {
>>>      bool has_hw_scheme = probe_hw_ad_update();
>>>      const char *scheme_name = has_hw_scheme ? "Svadu" : "Svade";
>>>      enum riscv_isa_ext_id ext = has_hw_scheme ? RISCV_ISA_EXT_svadu
>>>                                                : RISCV_ISA_EXT_svade;
>>>
>>>      /* Fix DTS in case of mismatch */
>>>      if ( !riscv_isa_extension_available(NULL, ext) )
>>>      {
>>>          printk(XENLOG_WARNING
>>>                 "CPU implements %s but the DTS does not advertise it\n",
>>>                 scheme_name);
>>>          __clear_bit(RISCV_ISA_EXT_svade, riscv_isa);
>>>          __clear_bit(RISCV_ISA_EXT_svadu, riscv_isa);
>>>          __set_bit(ext, riscv_isa);
>>>      }
>>>
>>>      printk(XENLOG_DEBUG "CPU is using %s A/D bits scheme\n", scheme_name);
>>> }
>>
>> Yes, if the assumption is that this would be used only when neither extension
>> is advertised, then I agree (taking Andrew's response into account). I'm sorry,
>> this has been quite a bit of back and forth, but hopefully we're now all on the
>> same page.
> Ok thanks, great to hear. Just to not mistaken, when you said "would be 
> used only when neither extension is advertised" it would means that in 
> other cases where there would be a mismatch between what the DTS 
> advertised and what the CPU actually support we should panic?

No, what I meant was that likely we shouldn't even probe there. We don't probe
other extensions; I don't see why we shouldn't trust DT here. The outlier is
when DT lacks any information.

Jan

