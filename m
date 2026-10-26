Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF9606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KTTnkl9Z
Received: from list by lists.xenproject.org with outflank-mailman.1461098.1672049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIKf-0003Ez-G5; Mon, 26 Oct 2026 10:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461098.1672049; Mon, 26 Oct 2026 10:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIKf-0003Es-DM; Mon, 26 Oct 2026 10:53:37 +0000
Received: by outflank-mailman (input) for mailman id 1461098;
 Mon, 26 Oct 2026 10:53:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLIKe-0003El-8L
 for xen-devel@lists.xen.org; Mon, 26 Oct 2026 10:53:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIKd-00CqTS-E0
 for xen-devel@lists.xen.org; Mon, 26 Oct 2026 11:53:35 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf312c-bab6-0a2a0a5309dd-0a2a4502d596-6
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 11:53:35 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf312f-6ca4-0a2a45020019-d155dd34c910-3
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 11:53:35 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so1628678f8f.3
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 03:53:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb9cesm16404094f8f.27.2026.10.26.03.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 03:53:34 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793012015; x=1793616815; darn=lists.xen.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5VXy3Jq0W6UUJoLekGL4KjcTVX70TQ0tOiUDRg1tCo=;
        b=KTTnkl9ZkL+YqPH5rmaVdW+voZVIBE2FBE84oRpOf19QjrLmQjbKMagSU463pAoKVg
         rJl68onV8cKAYZlQcb9gKKPiINYAUuQDTxdrr+FdZyLyVZIbbPD5fjjxAaRbl+WVl1iy
         No2gVhQwDH+jCKD4JZaqNJB5+et9qIFA2Rh3BR3exWcqxHPrp+Lv+59fisa45Yn0G+1z
         lRO6PYBjJi5iSlrdckezAQa9PcD7Qq5NeIwFrpxeDTCqwG0JKoYN42VmcZtEaUXA2Bgx
         puZYAlBr1cnDuLhnxf90whFEhJ7BG7vMSGPoNXJjEjX4A+eUWsPsT3COpYOIKB1NGOGz
         xkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012015; x=1793616815;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5VXy3Jq0W6UUJoLekGL4KjcTVX70TQ0tOiUDRg1tCo=;
        b=F5mQFFhYSp9uKs7RgHblsJrOjgOCA/9FEF+0aHkCPI7n4+8g84SFH04+sMG7r3GFLU
         c4uiu0o1UmQwb+E4P+ofzRcn8Wja6GuUnp2RWBSHLI1/WODyOoJSR8gNhmpUDa9r1vzc
         Em1TDU5lFvXyujzUPJqb7yasiCcj1HLV9EbXvUTrBaaZzUt79Pv6kZk7/Rt5deYUzyZi
         JRWSZSlJXno9+pTC7gBCUSHry7q8Xoqx+fxDvxFihTVlWaDJqnxYfGTvRnaHSO3CMKrP
         s9vjNcvzosW7SfarTTkHcnwrC5x4PT4t0GeXkCi6FHKkSVG838THE4Pv41UEySU/4SyM
         dFHw==
X-Forwarded-Encrypted: i=1; AKwUvBz/USkD27tSlV8Sf+3sP+moyXd2oHmZxB6W+RMt0OuBY3HJBHLSSqUNXVSPMwaAB91PnHLmKicGn78=@lists.xen.org
X-Gm-Message-State: AFq9FYIwQKcQa+k2y2fc2mXaB1UPU7jFEq3E4l6ZlUbNEdvyshjv6Ta9
	5lbxl4T9uhj+zA4vmf0fJpgcyWrkTTMp/3s4D+I21YHJ0vc3z0RvOynFM/zov+Byrw==
X-Gm-Gg: AYBFou3VzzjxyOzwSDkOgDNJ79GZ4VyIQKwqVVmLs2NoxW8IHrMWlKLHlgs5RkfJkK1
	U31Yo/ME33wCN5FrumBYZ7rHblAFZLbdcInJ7HN4VJ8od5MzPM8MGoMsszIZmTYuN/zhUGlnNSP
	QdQfh1PaYOmW1P2zVv0AIanu97dqnzviaypBBf8bvqrrrK4GR1QyUpEK+jU/23Aa7/po0BiQHzi
	Q0WLqR1PivUfqXjxXdwozPhz1b8iIbq7DsvIPbjamguBUHl1iT1gn6s69F5Fa+0TaUO7h5YQd9c
	DeqSo5sxLAas1yk8rQlRGt4Faqgcbl6qASWJEFoJbZwjhFNC4/gwp3kOE3IqaPPcllLN1Mw3FMz
	l4FKFHg8wo8wYOZrUNY4N9y5eYLp10jbVfQkxXcrTMWTZGQcOyn5ZGRc4sVpJ5EsP1Cel/QILk0
	RkaaSYPnMVbhel6942BOgDsb200Hi2vAxakohu+xR7ZDpGlztfGUVlLCpTrnoWR3esXWIB6Tl3e
	lNJQmzhJ0JjVYGk0AUu0WLPe7yR54ndjv+24pHwnmL3On+PtwVpmB+MocLra+JudFKhPLPJMhFB
	VF4wnGudYWC+ObtJuKlMbVwKUwqhO2tGZ8Y7QQsVx0U=
X-Received: by 2002:a05:6000:4b14:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48e3eb932b2mr11946300f8f.27.1793012014518;
        Mon, 26 Oct 2026 03:53:34 -0700 (PDT)
Message-ID: <ad48ac1c-176d-407f-87e1-ae303e8eb195@suse.com>
Date: Mon, 26 Oct 2026 11:53:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
 <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
 <b35c6a2f-753c-4691-aa9f-f67f2f7f37ef@cortex-media.de>
 <eff24ce3-bb48-4d2b-993c-65974d3af00e@cortex-media.de>
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
In-Reply-To: <eff24ce3-bb48-4d2b-993c-65974d3af00e@cortex-media.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793012015-321D72AC-DEFD27F6/10/78276251493
X-purgate-type: spam
X-purgate-size: 8293
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.10.2026 13:32, Peter Deggendorfer wrote:
> 
>> Hi Andrew,
>>
>> Thanks a lot for the quick response.
>>
>>
>>> On 23/10/2026 8:32 am, Peter Deggendorfer wrote:
>>>> Hey Xen Team,
>>>>
>>>> I'm hitting a reproducible hypervisor panic in the AMD non-fatal MCE
>>>> polling path on a Ryzen 9 5950X (Zen 3). Eight occurrences since
>>>> 2026-09-09, between 12 hours and 2 weeks apart, always CPU 2.
>>>>
>>>> Environment
>>>> -----------
>>>> Xen:   4.20.4-pre (Debian 4.20.3+127-gc42374a105-0+deb13u1), and still
>>>>         present in 4.20.5-pre (Debian 4.20.4+39-gf1e1321c87-0+deb13u1)
>>>> dom0:  Linux 6.12.111+deb13-amd64 (Debian trixie), PV, 32 vCPUs
>>>> CPU:   AMD Family 25 (0x19) Model 33 (0x21) Stepping 2, Ryzen 9 5950X,
>>>>         microcode 0x0a201210
>>>> Cmdline: dom0_mem=4096M,max:4096M ucode=scan console_timestamps=datems
>>>>
>>>> The panic
>>>> ---------
>>>> (XEN) [2026-10-19 08:58:18.727] Xen BUG at
>>>> arch/x86/cpu/mcheck/mce_amd.c:100
>>>> (XEN) CPU:    2
>>>> (XEN) RIP:    e008:[<ffff82d04028a650>]
>>>> mce_amd.c#mc_ec2type.part.0+0/0x10
>>>> (XEN) rbx: 0000000000000445   r12: 0000000000000011   r15:
>>>> 0000000000000446
>>>> (XEN) Xen code around <ffff82d04028a650>:
>>>> (XEN)  90 90 90 90 90 90 90 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90
>>>> 90 90
>>>> (XEN) Xen call trace:
>>>> (XEN)    [<ffff82d04028a650>] R mce_amd.c#mc_ec2type.part.0+0/0x10
>>>> (XEN)    [<ffff82d04028a699>] S mc_amd_recoverable_scan+0x39/0x40
>>>> (XEN)    [<ffff82d04028cfdd>] S mcheck_mca_logout+0x42d/0x840
>>>> (XEN)    [<ffff82d04028a35c>] S
>>>> amd_nonfatal.c#mce_amd_checkregs+0x1c/0x100
>>>> (XEN)    [<ffff82d040240e8c>] S smp_call_function_interrupt+0x4c/0x90
>>>> (XEN)    [<ffff82d0403123d5>] S do_IRQ+0x2a5/0x650
>>>> (XEN)    [<ffff82d040201915>] S common_interrupt+0x135/0x150
>>>> (XEN)    [<ffff82d0402883ca>] S 
>>>> cpu_idle.c#acpi_idle_do_entry+0x8a/0x140
>>>> (XEN)    [<ffff82d0402887cf>] S
>>>> cpu_idle.c#acpi_processor_idle+0x1ef/0x650
>>>> (XEN)    [<ffff82d040302cf1>] S domain.c#idle_loop+0xc1/0x130
>>>> (XEN) Panic on CPU 2
>>>>
>>>> The outlined mc_ec2type.part.0 contains nothing but the ud2, so this is
>>>> the "unreachable" default branch of mc_ec2type() -- the extended error
>>>> code matches none of MC_EC_TLB_TYPE, MC_EC_MEM_TYPE, MC_EC_BUS_TYPE.
>>> I think it's safe to just drop the BUG().
>>>
>>> That code is literally worse than useless, because if nothing else it's
>>> just hiding the diagnostics.
>>>
>>> I guess it means AMD have added new statuses.
>>>
>>>> Across the eight occurrences, r12 appears to be the bank index from the
>>>> loop in mcheck_mca_logout(), with rbx == 0x401 + 4 * r12 (MCi_STATUS)
>>>> and r15 == rbx + 1. Three different banks are involved: 10, 17 and 23.
>>>>
>>>> Not a hardware defect
>>>> ---------------------
>>>> - Started within days of upgrading two hosts from Debian bookworm
>>>>    (Xen 4.17) to trixie (Xen 4.20). They had run 3 years on 4.17 
>>>> with no
>>>>    incident.
>>>> - Three different banks, so not a single failing block.
>>>> - Updating to the current Debian package (4.20.5-pre, built 2026-10-16)
>>>>    changed nothing.
>>>>
>>>> Possibly related: 532988dccc19 ("x86/mcheck: fix mca_allbanks
>>>> updating").
>>>>
>>>> Also possibly related on the Linux side: 0422b07bc4c2 ("x86/mce/amd:
>>>> Filter bogus hardware errors on Zen3 clients"), where bogus MCA values
>>>> on Zen 3 are filtered rather than treated as errors.
>>>> https://ratatoskr.run/stable/2026/04/7143905
>>>  From above, you're on a Vermeer, not a Cezanne, so I don't think that
>>> Linux patch is relevant.
>>>
>>> However, your observation about "fix mca_allbanks updating" quite
>>> possibly is.  That was backported into Xen 4.20.1 as 247b708b1400a, and
>>> Debian has 4.20.3
>>>
>>> Are you able to experiment with that patch reverted?
>>>
>>> Alternatively, are you able to experiment with the BUG() removed?
>>
>> I went with dropping the BUG() rather than the revert.
>> Reverting 247b708b1400a should stop any bank from being read at
>> all, which is effectively what mce=false already does here, so I don't
>> expect it to tell us anything new. I'll run it too if you'd like.
>>
>> I'm not familiar with the Xen codebase, but I've built a package with
>> mc_ec2type() changed to:
>>
>>     if ( errorcode & MC_EC_TLB_TYPE )
>>         return MC_EC_TLB_TYPE;
>>
>>     printk(XENLOG_WARNING "MCE: unknown AMD error code %#x\n", 
>> errorcode);
>>
>>     return 0;
>>
>>
>> Crashes have been 12 hours to 2 weeks apart, so it may take a while
>> before I can report back.
> 
> After ~31 hours of uptime:
> 
> (XEN) [2026-10-25 04:06:27.260] MCE: unknown AMD error code 0
> 
> No panic, no wedged CPU, no RCU stalls, no hung guests. Host and all
> VMs running normally.
> 
> 
> I also dumped /dev/mcelog in dom0 and got the following records:
> 
> 00000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000020: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000030: 0000 0000 0000 0000 0200 0000 0000 0000  ................
> 00000040: 0010 0201 0200 0000 0000 0000 0200 0000  ................
> 00000050: 1c01 0000 0000 0000 0000 0000 0000 0000  ................
> 00000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 000000a0: 0000 0000 0000 0000 0200 0000 0000 0000  ................
> 000000b0: 0017 0201 0200 0000 0000 0000 0200 0000  ................
> 000000c0: 1c01 0000 0000 0000 0000 0000 0000 0000  ................
> 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 
> 
>>
>>
>>>> Diagnostics / workaround
>>>> ------------------------
>>>> mce_verbosity=verbose yields nothing useful.
>>>> max_cstate=1 made no difference. mce=false is the only thing that stops
>>>> it, and it is what I'm running now.
>>> The fact that mce=false isn't causing machine resets means it's clearly
>>> something the hardware thinks isn't fatal.
>>>
>>> But, I am concerned by the fact it's always on CPU 2, and multiple
>>> banks.  Is this true for both systems?
>>
>> To clarify one thing from my report: it is actually a single host whose
>> complete hardware (board, CPU, RAM) was replaced on
>> 2026-10-07, keeping only the disks and thus the installation. The
>> crashes happened both before and after that swap. 10 more hosts
>> with same hardware still run on bookworm (xen 4.17) for years now
>> without any incidents.
>>
>> So yes, always CPU 2. The bank index varies: on the current hardware
>> I have seen banks 23, 17 and 10 across four crashes, and banks 23 and
>> 17 on the previous hardware.
> 
> Regarding the output of /dev/mcelog: if my decoding is right, three
> things stand out. MCi_STATUS is zero, i.e. these banks are reporting
> nothing at all -- no error, no garbage value.

Well, things can't quite be that way: If MCi_STATUS was zero, the first
check in mc_amd_recoverable_scan() would prevent mc_ec2type() from
being reached in the first place. Its caller also checks MCi_STATUS_VAL
to be set.

What I find puzzling is this:

    errorcode = status & (MCi_STATUS_MCA | MCi_STATUS_MSEC);
    ectype = mc_ec2type(errorcode);

With errorcode (and mc_ec2type()'s parameter type) being uint16_t, what
use is it to include MCi_STATUS_MSEC in the mask? (Yet that's likely
unrelated to the issue at hand.) Considering how mc_ec2type() works, I
see no reason why status couldn't be passed to it directly (with the
parameter type widened to uint32_t). Then the BUG() there could perhaps
become BUG_ON(errorcode).

> Both records are again
> from CPU 2, and bank 23 is one of the banks that appeared in the
> panics, bank 16 is new.

Isn't it possible that the lack of 532988dccc19 ("x86/mcheck: fix
mca_allbanks updating") simply hid the issue previously?

Jan

