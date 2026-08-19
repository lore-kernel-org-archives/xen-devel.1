Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25A4C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:23:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394731.1633395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwadL-0007kf-Oa; Wed, 19 Aug 2026 07:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394731.1633395; Wed, 19 Aug 2026 07:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwadL-0007kY-L2; Wed, 19 Aug 2026 07:22:47 +0000
Received: by outflank-mailman (input) for mailman id 1394731;
 Wed, 19 Aug 2026 07:22:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwadJ-0007kS-Ld
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:22:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwadJ-0096X5-28
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:22:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8559ba-2eae-0a2a0a5409dd-0a2a4506a83c-16
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:22:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8559c4-195a-0a2a45060019-d155802ad4cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:22:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso6590875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:22:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14514d5sm3950500f8f.10.2026.08.19.00.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:22:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1787124164; x=1787728964; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NZoBcFqMNoc7iCqfHSRU1JgiQhuz7rRtU331DbrzT0=;
        b=VEQcWSGX4GeK5QkZE/WEn6ze3wqWEVsq0ahedcipUmx3UAk049P7bMHKlhq8P5g+V7
         WcneJJ6b+yfbCa0JbwMhBIf1FrX08cHpGG6Lbakk8MK/qqSNJkGARpIqMETwkgvQDMCf
         r6MDSzGn0F4iTl51n7tMyxIUpD8dlMzs4Ozb3X+lKRVbSmoYr4vOPgisDjuULsslDGWe
         y7pyfU/md0UHk7MdFZmL0WfKsckOhuQ0mFYDV7QyRKW1hfvuydVepf9ppp6cZaYbtoJC
         GbCssrtCWuLNYXzVt+V5iHz2rh6JhJYzafSRantSRR6vOrHY2E9zxSzpKyHppz9dsAT6
         GwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787124164; x=1787728964;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NZoBcFqMNoc7iCqfHSRU1JgiQhuz7rRtU331DbrzT0=;
        b=DwkeKMSCj7Y1u9VC3k/+eI5TUBDCneWfBS5b3yJXUyp6XL1z9EBLk7LQthmrTYcq81
         Q+k8E0cTuixRHn/NZCISgynj/tACAyvszMclAG0w9qqCvXAmWRVDgGkUByVxEPTnRrUk
         J518rjZLpV5YKj8CaU4Sye5IUTt0kN+8B6klMxnH/7iwum49AcHb0s4KnDZ/wfaLNOQC
         tXgklL65algJd0SC7ZMtucavP4Ua3rC9wsla76ry89uf7/7H66xluFdjUcKA8nI4tDHm
         xwKUbFAdt9LfCbyf0GuESaNscZehXgyTq2AgRjEhwRqzlatWksrqaSxoNNY/oQmthnZ6
         XcuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8QzTBkKQGGZQPpAfkXyqxykjG41/3Xk6PTj9WRjp2qJinHr6iP+o1CfFfSOHgwxW7qyFjfMbgx3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsqY4/4/6BixT4fUHqfA3M3y1f5o2xlcoBcrC3NmpMnun/IKTF
	C9n4bHe7juD5TOPGlNaa91dU1szB9GQ5yrob0EMOEJmLp/+i6xEQsu5t+/VDv47YSw==
X-Gm-Gg: AR+sD13OU+mqESWdsMSci4L+zXYsB3WvhE0wAEHjVWUkdk/sG2KCVrQuiAE10zH8neb
	oGK+gwwlgwSg6HslCt4ckyB1EFgzvtGLMKtRvNzYC6reNB5u9vE8AlP+cdzqUEvsyoYhujpijbE
	tNPdN6VQUvMBb8n74qc0tErw6uOZ5ZZaErAZmVGiPwhc/Z6rCgQOmOFpXUurI/VHIBqICKWxQjl
	LU96pv/GSCvXvTn4S4S0AWVhxc89dbf38d0CIPFmxMitkQcKRm67VHyg3iPYb9Yick7edEKQshl
	kruZK1WsJhz1SwYn0Y62eK0FtsWh7hcvtQ9GhV3yOxshxeTSFXKV25H48HSfvZW9Z4ybnxXxIoU
	3jX5UMuFPWUfZhAGpOqdyWg6dE4ct/wyWS1QyUQdrXFGNJmcrzu1OJ5eoFTfMBD1XDLeJZ4ohLV
	M2pXlqBT6cINZl76SP/kRv7b1C1OL8iNkNU5dmSNplrIJzHDmeE56UWv7kaYAcZA3HHzqe9HIeI
	C8QyLf/l5x3EfviPS0FEa24G02JhxTRpkSsE1cCkgW5Jaui0p9ZGP0EnG2wSeM=
X-Received: by 2002:a05:600c:37c6:b0:499:87f3:a2a3 with SMTP id 5b1f17b1804b1-499aa1c7bafmr45212215e9.15.1787124164412;
        Wed, 19 Aug 2026 00:22:44 -0700 (PDT)
Message-ID: <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
Date: Wed, 19 Aug 2026 09:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
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
In-Reply-To: <20260819051532.9197-3-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787124164-FDE0E77B-F564CE00/0/0
X-purgate-type: clean
X-purgate-size: 2596

On 19.08.2026 07:15, Furkan Caliskan wrote:
> sched_init_vcpu() calls init_timer() for a vcpu's periodic_timer,
> singleshot_timer and poll_timer before it can fail -- these
> become live, linked into their target pCPU's per-cpu timer list
> regardless of what happens next. If the sched_alloc_udata() call
> further down then fails, the function frees the sched_unit via
> sched_free_unit() and returns 1, but never unlinks these three
> timers.
> 
> The caller, vcpu_create(), makes this worse: on sched_init_vcpu()
> returning nonzero it jumps to fail_wq, skipping fail_sched and
> thus sched_destroy_vcpu() -- the only function on this path that
> calls kill_timer() on them. vcpu_destroy() then frees the vcpu,
> and the three timers embedded in it, while they are still linked
> into that shared list.
> 
> This silently corrupts that list. It only shows up later, when
> something else touches a neighboring timer: sched_move_domain()
> crashed with "Assertion 'entry->prev->next == entry' failed" on a
> completely unrelated, valid vcpu's timer.
> 
> Kill all three timers in sched_init_vcpu()'s own failure branch,
> so it doesn't depend on the caller reaching sched_destroy_vcpu()
> to undo what it set up itself.
> 
> Fixes: 1ad5dad74cde ("[XEN] Re-jig VCPU initialisation -- VMX init requires generic VCPU")

How did you arrive at this commit? It doesn't even touch sched_init_vcpu().
All it does is move kill_timer() invocations around. I think it's
d884b1077817, as that's where the "return SCHED_OP(init_vcpu, v)" was
introduced (i.e. where kill_timer() would have been necessary to call in
the error case). (I can't exclude the issue was pre-existing already at
that time, but that would require more analysis than I think is worth to
invest.)

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -589,6 +589,9 @@ int sched_init_vcpu(struct vcpu *v)
>      unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
>      if ( unit->priv == NULL )
>      {
> +        kill_timer(&v->periodic_timer);
> +        kill_timer(&v->singleshot_timer);
> +        kill_timer(&v->poll_timer);
>          sched_free_unit(unit, v);
>          rcu_read_unlock(&sched_res_rculock);
>          return 1;

This almost, but not quite open-codes sched_destroy_vcpu(). Would be nice
if the cleanup logic was shared. The sched_free_unit() call there could be
leveraged here as well; what would need skipping are the sched_free_udata()
and sched_remove_unit(). And of course the RCU-locking would need sorting.

Jan

