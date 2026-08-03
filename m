Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE26C55179
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 11:13:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381383.1624978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqqbP-0002XC-NQ; Mon, 03 Aug 2026 11:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381383.1624978; Mon, 03 Aug 2026 11:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqqbP-0002X4-KF; Mon, 03 Aug 2026 11:13:03 +0000
Received: by outflank-mailman (input) for mailman id 1381383;
 Mon, 03 Aug 2026 11:13:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqqbO-0002Wy-32
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 11:13:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqqbM-00EqOR-UG
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 13:13:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a7077b7-2eae-0a2a0a5409dd-0a2a4501d6f4-0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 13:12:55 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a7077b7-5984-0a2a45010019-d155802ee440-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 13:12:55 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso12807485e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 04:12:55 -0700 (PDT)
Received: from [192.168.1.109] ([78.173.117.153])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49808199a5csm317148575e9.4.2026.08.03.04.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 04:12:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785755575; x=1786360375; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n15kLGrJ+FWpwmzVHEDI31BEOzMm4iFVML/1saYo8ro=;
        b=r/j3k3rL3Ndi8EtK411WXb2szOgSQ/bhwXJPWLxZz+CsXK8XvyRW6ETJ7eMFeo/F9r
         5S8EV2i2HpWy8vm4Ne9bQKiI6AR6fPUPaO67PKh0HP4S45EiRiKK78qlNKXIK11/t5gG
         VGOGqpZWZeeO+N3yeEuZwc1L6ZuS7XWBH4jC9JqZ6f3BOGP8I3/4EnL2CPMJY21iB5Ik
         h+4gz7dtbgpzGw+r2dFF3qp/TMkxo+TcdCGbOnMiShnj0F60kS4yVjwB3GuDzZEu7ZCI
         i/1Y1h2taYvPXjWvRA0jvRBs4Sp2kzywBKNMIUXVKA+V5NXqgjMqlHvHYkAD7h6rerwK
         iyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755575; x=1786360375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n15kLGrJ+FWpwmzVHEDI31BEOzMm4iFVML/1saYo8ro=;
        b=fCBUDRDWKPoKrS21NUdkCIxtuvz1QvwwPjrAkNmpckCR/p+ljgMcpTNLcgFqSTQmVA
         QE11iEzMDF+4VS4slEU6j2vedrpFb7ZpT9EJAnAolFzJjMOJPocRQ6d0vb2NzGpz/Fy1
         Bb2Mv9gNK+K5Knrx4jTBvnKmXGZKy7iD++1yZpKGnqFnZBU5+oQXZ29FhHSA1+xL4Yxt
         SOsUiRbEO3YYdSSlQIKehD/aTjn/WjRaatvDAMKqWti0y6mtSDTefdXf5CLgMPXKCuqd
         28hXqR2lnSUJGdAOCoP+6dfcSZIfcFgMfO5qM1On0zvWEVLKFu0DOr5DLEZlOIXUPLDQ
         vRQw==
X-Forwarded-Encrypted: i=1; AHgh+RrwqVaptoUzrKAy05aFLeTUoYjNQmZd61C7WPPt7VerfxjtwCc9NXYus35OEWjSyHrnuQetzFriD6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGoMpQIcH2GhoaDmVKCblaK83IalHZi+1EOYHZr4Bz1rJq+qAd
	qbUsvTa/N4Djd6hyOE7cZGRhM4ehTBekhJfwSCbUt6iJSewKQ8XPvPIo
X-Gm-Gg: AR+sD12u0ClY4xO7CnKSZU7x6gob4laFzZIn4Z2Cnq8SHmAIwYYHCzRejtKQMz0tczu
	JFMuIGbAOi18MwAdPoo/VP093kWTa6EgYJ2s+UXMQ7YcMIlUPyfT4I65cIeOcHbD6UeGzg/3pCN
	fNaroslCTit4RvToz47xyXGWvDM4Jd0TqJHVb965bk6Tjg5QOs5jdFUwo+9hykzErJHcoDNSdfi
	m37Gtz04IT/50irEfG+ucu7hwfD85EUD1VmaZGcju8mZnubYXInvKp97ldKeXlHNho0VV6l0qei
	e9KhF1lM8GrT9T4BkZhaCwnr0BI2iGrGKN//kUvOsTEUN56ElKf+iwdHpKZT4FUXIqWWDDQU7pm
	/5TMq+7R8h7uNF/dZeZPYGbJPK7miLpLAB5Rlr2BVM65IiSKbmDyIi96Rgwz1V+yG7bV24LbAR3
	oYpmHsTyFJAPariC+Z3/4RsQBMvatYSa4pI6d8YObe2fAys6AlX3AUW0QLsusc5m1NemkSgi/0Z
	q9sFUw=
X-Received: by 2002:a05:600c:628c:b0:496:c0f6:78d6 with SMTP id 5b1f17b1804b1-4980c64b5a7mr227722965e9.2.1785755574994;
        Mon, 03 Aug 2026 04:12:54 -0700 (PDT)
Message-ID: <6a6a04dc-0d8c-4b7a-a190-09113b3b68cd@gmail.com>
Date: Mon, 3 Aug 2026 14:12:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] xen/sched: split scheduler vtable from scheduler
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, oleksii.kurochko@gmail.com
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
 <b90e2fa6-0725-4f39-8a5f-31b02c8aef72@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <b90e2fa6-0725-4f39-8a5f-31b02c8aef72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785755575-BC75B757-76A94DF6/0/0
X-purgate-type: clean
X-purgate-size: 4743

Hi Jürgen,

On 8/3/26 13:34, Jürgen Groß wrote:
> On 03.08.26 07:06, Furkan Caliskan wrote:
>> Each struct scheduler currently doubles as both a scheduler
>> backend's static vtable (name, opt_name, sched_id and every
>> function pointer) and the per-cpupool runtime object that
>> scheduler_alloc() allocates. Because these are the same type,
>> scheduler_alloc() memcpy()s the entire vtable into a fresh heap
>> allocation for every cpupool it creates. With N cpupools running
>> the same scheduler, this duplicates N copies of identical function
>> pointers and identifying fields that never differ between
>> instances - the only fields that are genuinely per-cpupool are
>> sched_data and cpupool.
>>
>> This series splits the vtable out into its own type, struct
>> sched_ops, so it can be shared by every cpupool using a given
>> scheduler instead of copied per cpupool. struct scheduler is left
>> holding only what is actually per-instance: a pointer to the
>> shared sched_ops, plus sched_data and cpupool.
>>
>> The series is structured as introduce/migrate/remove, so that
>> every commit builds and boots on its own:
>>
>>    - The first patch adds struct sched_ops, REGISTER_SCHED_OPS(),
>>      and a sched_ops_array[] alongside the existing schedulers[],
>>      extending every lookup path (scheduler_alloc(),
>>      sched_get_by_name(), scheduler_init()) to search both arrays.
>>      This is purely additive - no scheduler uses it yet.
>>
>>    - The next five patches each migrate one scheduler backend
>>      (credit, credit2, rtds, arinc653, null) from struct scheduler
>>      to struct sched_ops. Each is small, mechanical, and
>>      independently bisectable, with no behavioral difference, since
>>      scheduler_alloc() builds an identical runtime struct scheduler
>>      regardless of which array a match is found in.
>>
>>    - The final patch removes the old schedulers[] and
>>      REGISTER_SCHEDULER() path now that nothing uses it, shrinks
>>      struct scheduler down to { ops, sched_data, cpupool }, and
>>      updates every accessor in private.h accordingly.
>>
>> Furkan Caliskan (7):
>>    xen/sched: introduce struct sched_ops as a shared scheduler vtable
>>    xen/sched: credit: migrate to new sched_ops
>>    xen/sched: credit2: migrate to new sched_ops
>>    xen/sched: rtds: migrate to new sched_ops
>>    xen/sched: arinc653: migrate to new sched_ops
>>    xen/sched: null: migrate to new sched_ops
>>    xen/sched: remove old scheduler registration, shrink struct scheduler
>>
>>   xen/arch/arm/xen.lds.S      |   2 +-
>>   xen/arch/ppc/xen.lds.S      |   2 +-
>>   xen/arch/riscv/xen.lds.S    |   2 +-
>>   xen/arch/x86/xen.lds.S      |   2 +-
>>   xen/common/sched/arinc653.c |  11 +---
>>   xen/common/sched/core.c     |  80 ++++++++++++++++-------------
>>   xen/common/sched/cpupool.c  |   6 +--
>>   xen/common/sched/credit.c   |   5 +-
>>   xen/common/sched/credit2.c  |   5 +-
>>   xen/common/sched/null.c     |   5 +-
>>   xen/common/sched/private.h  | 100 +++++++++++++++++++-----------------
>>   xen/common/sched/rt.c       |   5 +-
>>   xen/include/xen/xen.lds.h   |   8 +--
>>   13 files changed, 116 insertions(+), 117 deletions(-)
>>
> 
> You have a series here which is adding 116 lines and removing 117.
> 
> Patch 7 alone is removing 248 lines while adding 67 lines.
> 
> So in the end there is a single patch in this series which has more code
> churn than the complete series when added in one go.
> 
> IOW: making this just a single patch would be easier to review than the
> last patch alone, let alone all the temporary modifications which would
> be gone when merging all patches into one. And with that you could even
> drop some of the renaming you did (e.g. in the linker file), making the
> diff even smaller.
> 
> I agree with the overall goal, but I'm sparing my time doing a thorough
> review of the series in this shape.
> 
> 
> Juergen

My first instinct was actually to just send this as one patch. I split 
it up because I wanted each scheduler's conversion to be its own small, 
bisectable commit, but you're right that it's not worth it here. 

I will squash it into a single patch and resend. But I would still like 
to rename SCHEDULER_ARRAY to SCHED_OPS_ARRAY in the per-arch linker files 
and other related variable names in other files, since they now hold 
sched_ops entries rather than struct scheduler ones, and I think the name 
should reflect that. 

Thanks for the feedback,

Furkan Caliskan


