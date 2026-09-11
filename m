Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5279CC88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:05:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416663.1645629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50wo-0004N8-1U; Fri, 11 Sep 2026 13:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416663.1645629; Fri, 11 Sep 2026 13:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50wn-0004N1-V7; Fri, 11 Sep 2026 13:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1416663;
 Fri, 11 Sep 2026 13:05:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x50wm-0004Mv-Qf
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:05:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50wm-005pvc-7S
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:05:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa3fc9e-8faa-0a2a0a5109dd-0a2a450a9382-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:05:40 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa3fca4-f2d2-0a2a450a0019-4a7de18cbbb3-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:05:40 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e64ccso6723485e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:05:40 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60a8a89esm73262655e9.1.2026.09.11.06.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 06:05:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789131940; x=1789736740; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zmE59oDQYCOIkXrARnvd4zfPyqXNyb7u5+pGaoGcC4=;
        b=sUf0Cbvd+Z7g1KZvrDt8gComDbiFn9+jKM+dFlyaRQOIAEv7v0mKl8rWrsLMrmmsp5
         bcFmO+VKOaBmyMHVRJrJz8nf8LQgKPZgJCq4uObGCt0rJ9k+olIhMdvRACLdpXRI9Pzr
         vbgK7a/WD2t3i2x/1opsU9jdan/FkyO7gdIspAWoQ4zl/0zN3+fgUL0YBxz68gE3vaqd
         KwTi/4HbWlEIMzZ/hHmQ+y5BrxYxIXP9upZNv81jm3dqGr0SH4JXj0leVT5zrdLClH29
         Ta4S8t90cMDdLOPs6HiT3cFagWSwZQnarg2Ye5/47BBGXNoXDWkYUk9RNK34hFAiUvvl
         +SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131940; x=1789736740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zmE59oDQYCOIkXrARnvd4zfPyqXNyb7u5+pGaoGcC4=;
        b=X7ZYiAht1064CN34PEcavmvxGohiJOIhzIjRtzWVK2ugqVn2sSKUMHoEBaE2bEM7rJ
         FCx0n4NrcUmo0UU4I9507RcI4berSDBvUJdEgdih6oInh3QKiAweg42HNJDSZWvCdqlg
         w8QPnncpw/8Valq9shLBJSUIqSwHX3wnru7fi3qQJRcn70p/QAstEE4l1D2qKZody5Cb
         Jb/RwgMn+TPmncKC4fuY/KrMe3Os7Khed/F4kB++TIUFy96BsipKie3hdrwoMDXvQsEj
         nidowTA0gPV5GuHy/ww7gvClC7gdgQQsAu8er1USVz8/4fxFb0Jtp11+9sKhO8YwmbzY
         S0UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMQR4DOnBX7XdzBdYlveS2jud18RyKQKVeslZPj0B6fkhueJdQIIzzGfvc1C90PRL7RnmycxuFQKs=@lists.xenproject.org
X-Gm-Message-State: AFuF++nXn1XLPJT53NAtMt3Ol8M/gWolBqkUdcpipeFOoM1ekAs7e9jd
	5ExCZqMfLU0pPZO3fmuhJt0oucvKu4M6Or8hOJtayHOI/2jbB5pI9gwC
X-Gm-Gg: AYBFou3pbMFlnJWvYU0EfrEiDPjG8wPss6JqUjxFz2+1iM6BesCETZkGtyPTojBW4VH
	kvj2neWGFhvolUZragd7sv4l62wTRwub1+zIh3rh5+CqU0gFKH0RxVkp6jpJiqQx1cHVqlr76My
	fsZIf2lJWixp4/B28WclluHqYLi5VMndPPh0ZP6Wdj2My4Zdi+uWrQdJ0+6RdPhpyMhfQqdSCJB
	zWbq6X7KMetuc9FfQqoweL88VSiQUYRXcnUIHcd80ZOfqzu2XwZJpnmLbeI8yubp0nLWxF8nTdJ
	RKDOpxrk8L8taPLvfK9iZGDkIOjBRpknllcIKUZevm3gi+NSvJaJj4+xU3b92sa1D+fqJbxHeOm
	TdWGTzb81pIbtpClOLbckhQuRSW55JfgtXKP+GFy6CPpqSke7iwRurnAeZktIR+Vk8CmLR/uDvF
	GqJhzBfKYuLGedBvahvrc1OfDT+9uETHfcWg2vSstI4fSr0JARGh5CqnDRieFqNvdeuus7B/FMF
	kQ4Eqk=
X-Received: by 2002:a05:600c:19c8:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e619f3ae1mr87489695e9.10.1789131939528;
        Fri, 11 Sep 2026 06:05:39 -0700 (PDT)
Message-ID: <8f9dee8f-b973-4b64-81be-f600103b0a3f@gmail.com>
Date: Fri, 11 Sep 2026 16:05:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xen/sched: rtds: add per-cpupool admission control
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <7fb66cfd-b1b0-4f58-b35c-229aa679f737@gmail.com>
 <1a24d3e6-8ea5-4016-b795-ce1bc9a63fb7@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <1a24d3e6-8ea5-4016-b795-ce1bc9a63fb7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1789131940-4ACDBCFC-D2B37286/0/0
X-purgate-type: clean
X-purgate-size: 2952


On 9/11/26 15:57, Jürgen Groß wrote:
> On 11.09.26 14:25, Furkan Çalışkan wrote:
>>
>> On 8/26/26 07:57, Furkan Caliskan wrote:
>>> RTDS currently has no admission control: nothing stops the sum of
>>> all admitted units' (budget/period) reservations in a cpupool from
>>> exceeding what its pCPUs can actually provide. Once that happens,
>>> the global-EDF deadline guarantees the scheduler is built around no
>>> longer hold for any unit sharing that pool.
>>>
>>> This series adds admission control to prevent that, tracks and
>>> report utilization, and makes the check toggleable per cpupool so
>>> an operator can disable it if they intentionally want to overcommit.
>>>
>>> Patch 1 introduces the core mechanism: a running utilization total
>>> per cpupool, a fixed-point representation of a unit's (budget/period),
>>> and a capacity check enforced in rt_alloc_udata()/rt_free_udata() -
>>> the lifecycle hooks that catch every new unit's default reservation.
>>>
>>> Patch 2 extends the same check to domctl, so growing an existing
>>> reservation via xl sched-rtds is checked too.
>>>
>>> Patch 3 reports a cpupool's admitted utilization agains its capacity
>>> via the 'r' debug key.
>>>
>>> Patch 4 makes admission control itself toggleable per cpupool
>>> (enabled by default) via sysctl.
>>>
>>> Patch 5 wires that toggle through libxl and adds -s/-a to
>>> xl sched-rtds, and documents it.
>>>
>>> Furkan Caliskan (5):
>>>    xen/sched: rtds: add global-EDF utilization admission control
>>>    xen/sched: rtds: enforce admission control in xl sched-rtds
>>>    xen/sched: rtds: report utilization and cap via debug key
>>>    xen/sched: rtds: make admission control cpupool-wide toggleable
>>>    tools: expose admission control toggle via xl sched-rtds
>>>
>>>   docs/man/xl.1.pod.in                 |  20 +++
>>>   tools/golang/xenlight/helpers.gen.go |  23 +++
>>>   tools/golang/xenlight/types.gen.go   |   4 +
>>>   tools/include/libxl.h                |   4 +
>>>   tools/include/xenctrl.h              |   6 +
>>>   tools/libs/ctrl/xc_rt.c              |  40 ++++++
>>>   tools/libs/light/libxl_sched.c       |  46 ++++++
>>>   tools/libs/light/libxl_types.idl     |   5 +
>>>   tools/xl/xl_cmdtable.c               |   8 +-
>>>   tools/xl/xl_sched.c                  | 103 +++++++++++++-
>>>   xen/common/sched/rt.c                | 205 ++++++++++++++++++++++++++-
>>>   xen/include/public/sysctl.h          |   5 +
>>>   12 files changed, 463 insertions(+), 6 deletions(-)
>>>
>>
>> Hi Juergen,
>>
>> Can I get a review on this series please?
> 
> I was quite busy preparing for Xen summit. I'm planning to do the review on
> the train to Munich. :-)
> 
> 
> Juergen

Okay, thanks

Furkan


