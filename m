Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97CCC5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:54:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394801.1633449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwb7X-00063C-U0; Wed, 19 Aug 2026 07:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394801.1633449; Wed, 19 Aug 2026 07:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwb7X-000635-RL; Wed, 19 Aug 2026 07:53:59 +0000
Received: by outflank-mailman (input) for mailman id 1394801;
 Wed, 19 Aug 2026 07:53:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwb7V-00062z-Te
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:53:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwb7V-00HWPc-AU
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:53:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8560ff-2eae-0a2a0a5409dd-0a2a450a8420-38
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:53:57 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a856115-f2d2-0a2a450a0019-d155dd34ddab-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:53:57 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-482938466a7so550969f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:53:57 -0700 (PDT)
Received: from [192.168.1.109] ([78.173.117.23])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm35843335e9.3.2026.08.19.00.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:53:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787126037; x=1787730837; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CJXLd/U91yXXqh2bashFWZ0DcoUxn4q8GKZFtPXLq0=;
        b=hPU8Gz0HPmKme4wkQ1wpwe02cKGnXTnnhU0dc5GHMVFhXXdY5RC79v0dQkj21Gow7Q
         Kl8w6d56zowfk0nhUC27m3fqJwJc0MT2gn4uKo4E4YKmKgyAH315YZPddn02LY2mUYc/
         set5NFnHJVAmXYwvicxnQzkoly1PN8smSLZIDRD/mhJqIPs9EpqUEjLzcle8dyxRKmkY
         yOkEXkg2zjuonOTLhurUt5+T768IU2KAFczP4/T+YhX0lcN6Clx2hyR1oLD+RnNyQjnk
         e+SwthoLbbVqzfBdeskn4Jc3FIOuvey57WJ4bKbTC81YeVPmbLf9arjjTDoHGEElsok1
         ZL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787126037; x=1787730837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CJXLd/U91yXXqh2bashFWZ0DcoUxn4q8GKZFtPXLq0=;
        b=Uq7UFQMPBbvjmEGVAL0zeyTZor8pyqoWPTVVFvJeocJ5MBtu4OzyJC2a7A99USwS93
         BdiNvqOTwr9CJ01UB8Q9wojUEnVI618t48q8CraRQP73tcpvpH3znsBSf89kt5oX7LMH
         XdgIBYEEDaQPTglSpxtQeyFbeenl218yt3qzsu3/W/ttY0Md9ktJXam6kQiYYEb58Au0
         ouGWCKch2fJNypCq04LHSTFLLj2HW6Yf+rZ6NaVsDoWJuwP2I45cRD+VwN6KCADbI/ny
         ifAiTRpTDZsql3aj6hvMHndszpNARPcOSfTyMDtpIYH4Xebl/74r+DaPCeZ2wMUveXtF
         ybYA==
X-Forwarded-Encrypted: i=1; AHgh+RpwW5fHEAtnY/0tnmrc+T4+V2IynCHPWQtd/1ko0qPtsZM66oJ9mCQ69FgHCoUrcM7GJJiQ8qkzIVk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy57HbyxXHfGgjObuhU7CgqYSXeTbSId0A+QA5HzHWUkAPU93BO
	k57+oZ4MK/jYhDCafiRDd03JEMtgscKR80gw7oXw3j+gNHjrsjTAqrGD
X-Gm-Gg: AR+sD12vMLhSgMp15d90yWyTVrEBk2sjETnOD4ENSUKhVlbpBncQr/mEBzM72FymuCb
	VqZ3SL6HzhJWeOHKgpr9NIXeUXLatjAdX7LL7Qwumbk3+PGGjzlG9pUGqDCxBTj8OI4+n5bG7Ks
	fHDwmLJJndNW5zSqyM07ujdcgQMKzCJEBE20LXhC/sj4S7I8p/F33+inhQPMfLVcMYgqHSyhR2T
	nrqPqh+ovgP+47Hc11cxe7h8GI2E8asM3JFqUJS8kEk7qAGAP6Wgzrcqlr0R4SO4JjrviHCaZEA
	3TkQXc4B93wSlxfJeV6dS+llFYfTSZyKs5/WDDEZJSJerkC65nsITMfYnxGajifcu/hXebLpBzc
	hxJqgwiP4ypH2VLTiq0JcTfWJp9gIhUgtByClvAXs+qRJQg6PzGc/WABu9n2kpM3l5WHsa3dl7i
	2nkCYhS7MHUBA16qShoqAvAoas1QYKERIMThmW+hGRninFrsSkbwgUSWSt79qg4OpYXm0=
X-Received: by 2002:a05:600c:c170:b0:499:86ce:465e with SMTP id 5b1f17b1804b1-499aa15d8dcmr49130935e9.4.1787126036561;
        Wed, 19 Aug 2026 00:53:56 -0700 (PDT)
Message-ID: <50005702-c719-4ba9-92f7-4d5a0dc3e0b8@gmail.com>
Date: Wed, 19 Aug 2026 10:53:49 +0300
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
X-purgate-ID: tlsNG-4011c0/1787126037-51AC4CFC-2A265EF1/0/0
X-purgate-type: clean
X-purgate-size: 3604



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

Commit 1ad5dad74cde moved kill_timer() calls into sched_destroy_vcpu() 
function, which is not called if sched_init_vcpu() fails. 
Before that commit, kill_timer() calls were in sched_destroy_domain(), 
which is called if sched_init_vcpu() returns non-zero to its caller, 
alloc_vcpu(). 

        for ( i = 0; i < max; i++ )
        {
            if ( d->vcpu[i] != NULL )
                continue;

            cpu = (i == 0) ?
                default_vcpu0_location() :
                (d->vcpu[i-1]->processor + 1) % num_online_cpus();

            if ( alloc_vcpu(d, i, cpu) == NULL )
                goto maxvcpu_out;
        }

        ret = 0;

    maxvcpu_out:
        domain_unpause(d);
        put_domain(d);
    }
    break;

put_domain() calls domain_destroy(), which then calls free_domain(), 
which ultimately calls sched_destroy_domain().

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

Furkan


