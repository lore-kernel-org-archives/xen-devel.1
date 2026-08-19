Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A358C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:39:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395139.1633641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdhk-0003XZ-3I; Wed, 19 Aug 2026 10:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395139.1633641; Wed, 19 Aug 2026 10:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdhj-0003XS-VH; Wed, 19 Aug 2026 10:39:31 +0000
Received: by outflank-mailman (input) for mailman id 1395139;
 Wed, 19 Aug 2026 10:39:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwdhi-0003XM-4z
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:39:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwdhh-009luq-EW
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:39:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8587df-8faa-0a2a0a5109dd-0a2a450a8ba0-8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:39:29 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8587e1-f2d2-0a2a450a0019-d155802eccf5-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:39:29 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so8864795e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 03:39:29 -0700 (PDT)
Received: from [192.168.1.109] ([78.173.117.23])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0dd620sm47520725e9.13.2026.08.19.03.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 03:39:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787135969; x=1787740769; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AsA94VpHp480uzR+EFVVpqM0pDpJec2bgTbAJQQLnk=;
        b=VMojKCULcRb9k0u4x0fAMpmEBOqBGnE+hJiTffbrUYV+80YYsme4kotTC3GGkbx+05
         U8lPHvtYP6yLREcKovcNJo+VZzPAFXiqJRmLBnwojZLEhHOvlvEiHMMiqEAi9iEyr9ew
         5e/2SjcWJFY/ofZ7om3FgQFjzgoLBiRg8n9ZRT1MiVdfvlCoJgeMud7kwcmHiOncixcu
         AOy0fKkZAmP/ICRDbL6mKZStVSFPR77/xmqstaT3VBLx0fzqHArKeP5nSUWGWQeCwAi0
         mQKFrEDCAsNDpmmoMrfuoOel4aDZROgjgjU4NLpog/p4GF0VMlQ3tDi2qB8XBy+YwI40
         E9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135969; x=1787740769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AsA94VpHp480uzR+EFVVpqM0pDpJec2bgTbAJQQLnk=;
        b=R9tbzCBKeC5iaanWm0fMkJ7GDF1AcCLIv+JQhU4PoHpWFLMLYK4XtZHdyFhU99YUJY
         qxh5Pm2E5pojm4Hm7JhDfH5kkKaHnJyn6gD7FMukOvigBBJgHT6rjF6+sKsIOBAacZEB
         JK/hz7w/t1yoVReG6+n/lUACMM+63Z2kAiYbvPgNkxu2M/G23yA14x9IXLrZhp6f9XKh
         raG3/54SdE5Y0bYFQtYo0aHtVGy67LyIrJpY05rmECIVqMULbkqTIz0+VQ246cQR6cqw
         WI+iAzsO0Nd6vBPF4j1d/z0xtq7Kmd0DiWD2qsMS41n57sSiGQnzye3JiO5os6deZ6yH
         Rqfg==
X-Forwarded-Encrypted: i=1; AHgh+RpWox8lJAgBd3YwovQ/jB/e+hyDazhu7g7a1TtLPTWSwMIw4QxLmLKFelJ4FgNo+MxJFSPVwBz3YWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTJRp7YnigLI7NxT8MpY3yxrNzzoWrPkMpAYdrwxwRtDH2hr4S
	cco4FqMSxIu6bCqZj16VxlRYQmqC3jzZAyRq05ae5GViFLzuYcYx7Z+U
X-Gm-Gg: AR+sD11XNGdP3qrFGTsgJL3iWxYAzzbFvh/QVrPw/CJgqtMUvY+577ursZ78HfOLcUg
	j7wmY7bBaFMu+zbX7XGJwVsWfVZ0n/o2yR2mUIRF0lqb9BIkGc5qQSRxrBcqUtRGPovSJUsxfGr
	AYOMZFG81nw47d0DahodQLoYkiZ5ksF45pG/ZQBjLIYfIH06FQ3WDq0in3i+nRH/PdtKvjuNsie
	GfGdNXnlP7jcK72eWhn/ovd7mouUkRnDilQQsOcsHypjkd9sHJ1UoDIH61/HE7tyiRbMKf4Gftf
	e1OCzcFuYZDS3a3C9T+vui5Bvh3cM0BlpqK7NvzfJwrDqvODzzOHiHJAZUyeK7CMcke1CBJYCop
	83suxsI3LlA0L/JyLtEu6Lret7TGe88tfRoIpmW1iwqaikg/Fi3gpSQbpmyFGqFpLLRrZX5sW4L
	I7va6DZMIJukvNP1q631lFJeBgW2Cb0ZzqIMLUChLVMy8YMAUudNzPLHsg5dsF8PRAw08=
X-Received: by 2002:a05:600c:8b27:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-499aa199601mr74656405e9.5.1787135968713;
        Wed, 19 Aug 2026 03:39:28 -0700 (PDT)
Message-ID: <e0f91d0e-0b08-4d69-bf94-243bd26f67df@gmail.com>
Date: Wed, 19 Aug 2026 13:39:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: Jan Beulich <jbeulich@suse.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
 <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1787135969-508CDCFC-F3FF276F/0/0
X-purgate-type: clean
X-purgate-size: 3732



On 8/19/26 10:22, Jan Beulich wrote:
> On 19.08.2026 07:15, Furkan Caliskan wrote:
>> sched_init_vcpu() calls init_timer() for a vcpu's periodic_timer,
>> singleshot_timer and poll_timer before it can fail -- these
>> become live, linked into their target pCPU's per-cpu timer list
>> regardless of what happens next. If the sched_alloc_udata() call
>> further down then fails, the function frees the sched_unit via
>> sched_free_unit() and returns 1, but never unlinks these three
>> timers.
>>
>> The caller, vcpu_create(), makes this worse: on sched_init_vcpu()
>> returning nonzero it jumps to fail_wq, skipping fail_sched and
>> thus sched_destroy_vcpu() -- the only function on this path that
>> calls kill_timer() on them. vcpu_destroy() then frees the vcpu,
>> and the three timers embedded in it, while they are still linked
>> into that shared list.
>>
>> This silently corrupts that list. It only shows up later, when
>> something else touches a neighboring timer: sched_move_domain()
>> crashed with "Assertion 'entry->prev->next == entry' failed" on a
>> completely unrelated, valid vcpu's timer.
>>
>> Kill all three timers in sched_init_vcpu()'s own failure branch,
>> so it doesn't depend on the caller reaching sched_destroy_vcpu()
>> to undo what it set up itself.
>>
>> Fixes: 1ad5dad74cde ("[XEN] Re-jig VCPU initialisation -- VMX init requires generic VCPU")
> 
> How did you arrive at this commit? It doesn't even touch sched_init_vcpu().
> All it does is move kill_timer() invocations around. I think it's
> d884b1077817, as that's where the "return SCHED_OP(init_vcpu, v)" was
> introduced (i.e. where kill_timer() would have been necessary to call in
> the error case). (I can't exclude the issue was pre-existing already at
> that time, but that would require more analysis than I think is worth to
> invest.)
> 
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -589,6 +589,9 @@ int sched_init_vcpu(struct vcpu *v)
>>      unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
>>      if ( unit->priv == NULL )
>>      {
>> +        kill_timer(&v->periodic_timer);
>> +        kill_timer(&v->singleshot_timer);
>> +        kill_timer(&v->poll_timer);
>>          sched_free_unit(unit, v);
>>          rcu_read_unlock(&sched_res_rculock);
>>          return 1;
> 
> This almost, but not quite open-codes sched_destroy_vcpu(). Would be nice
> if the cleanup logic was shared. The sched_free_unit() call there could be
> leveraged here as well; what would need skipping are the sched_free_udata()
> and sched_remove_unit(). And of course the RCU-locking would need sorting.
> 
> Jan

Would something like below be okay?

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d3a0a97e1d..36704a5836 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -589,8 +589,8 @@ int sched_init_vcpu(struct vcpu *v)
     unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
     if ( unit->priv == NULL )
     {
-        sched_free_unit(unit, v);
         rcu_read_unlock(&sched_res_rculock);
+        sched_destroy_vcpu(v);
         return 1;
     }
 
@@ -869,8 +869,11 @@ void sched_destroy_vcpu(struct vcpu *v)
     {
         rcu_read_lock(&sched_res_rculock);
 
-        sched_remove_unit(vcpu_scheduler(v), unit);
-        sched_free_udata(vcpu_scheduler(v), unit->priv);
+        if ( unit->priv )
+        {
+            sched_remove_unit(vcpu_scheduler(v), unit);
+            sched_free_udata(vcpu_scheduler(v), unit->priv);
+        }
         sched_free_unit(unit, v);
 
         rcu_read_unlock(&sched_res_rculock);


Furkan

