Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88310C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 08:33:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394885.1633495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbjM-0006Ko-6w; Wed, 19 Aug 2026 08:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394885.1633495; Wed, 19 Aug 2026 08:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwbjM-0006Kh-47; Wed, 19 Aug 2026 08:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1394885;
 Wed, 19 Aug 2026 08:33:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwbjL-0006Kb-7J
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:33:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwbjI-005Cdn-TD
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:33:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a856a29-8faa-0a2a0a5109dd-0a2a4509bb1e-32
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:33:00 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a856a3c-be1a-0a2a45090019-d1558034b582-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:33:00 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49557167508so7703535e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 01:33:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa11f832sm42564735e9.7.2026.08.19.01.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 01:32:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1787128380; x=1787733180; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCJTQX+7EPYMYBKv6GGunUbsM7O1XB1lvOqnyK2ApEM=;
        b=B1/jU/4GKeSFRFiYJw+RPAcou90DeE0jaQFc31ZerKK8pQTHlUkaTHVMnZcxeotz3G
         Kz+PNPh/R2zLb7+kszP29CihAjAkFHPcTn1COoTthaROYalJfIp6LdszYF0xcidAXujl
         SrDuW+hHisk6iNXNd9upl8EAF0CILdzXxbyoZ0IbOxh+tq7/nZLks//PhV0eQ9HwE4vZ
         S8W1zN2mUy17wWetwPXC8NVYOyBbFbYeumobUgyXj0rjfE/ZQ3busGM58qQKz3m8FzI4
         EqDETQN23nGf2/7iWp0fh7EaZa3Fbo4QJsHFcYQ/+eKwPMA1kSXTRtrM73MJnumG2rxo
         qB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128380; x=1787733180;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCJTQX+7EPYMYBKv6GGunUbsM7O1XB1lvOqnyK2ApEM=;
        b=U91lB4qfqhsa+doAbfkreE+pld8DIWAdzbzk3eWk3+73LilKXztePlD/KB7ZpBQwTy
         7ZjjJ52OBwAwcmMP0pNXTADAJKqyJ4YhM7bwwZcUDW26XNhegRVZGyALm/u85ZzTCalx
         gfxc3u0sJQH4XQqqldCro7dk1lAZxFrw0zIpPWefeA+NbiuUtO9NV/BzIPLt5Qi370vJ
         EK9nOSWC+nWZ3gKK+RAeNirT5esh81O2yy4yuVQJZPh+aZYR8fJxf+ZJkBnfL++GSdCU
         cgmppwQF/wOI34BHt9y2JkR3pRMIXnWANfBAAdy+qSzi7ekMhka/p02xZvutdvNvDjnv
         njmA==
X-Forwarded-Encrypted: i=1; AHgh+RrPyVp0M4xv91Udyg6TOdS0gZblYKf55OdRuoRfKiFi0Mjq+W38UZ2LreKkao3ZP8Xr4mes9oPRlRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG1g8Xt08eIwFV8rXCGBhC71ILgW0wkhU6YqxX83A3v/n19Jmo
	25vJH7QDwzaKf492wOmroI+CtApF2PHBz2ucpmGpruvYh/AZw//H0jn3dUD4EYoZ/A==
X-Gm-Gg: AR+sD13uOf0DeU6NKRSS7P0vqeMiHiV3ldSYdzPXKsRcmINnVzHA+YenQr6AtOIYBhN
	Hq7PplTr0N3L9SuAHzUoTY46kqMCwD3DaDjXgM3e0KHfB7cYOvagh+ZQGxExZcsPXLf3t7u9D2e
	kW9rvQ4vU252TQGgGgiZezjUvlC5iB+njErhXEi6LFPf82l5jnIHZx5so6MmN2sF2BCKm/33B9k
	+a0gYc3zGVK+OPeOcg4MwW4S5qh201V3DFYh/GsCLyBpe45dPnrkW4gMYRDftKgfbmvliPNltGd
	rDVAmE20KP4/SCN72A4JLB+16hNn1AngzY+l5k2aS9LZk0jWAqtMLN7CC9Pgi9PDYusnk3AhuvP
	Sre+d7xIK/KhxYaKne5BHYxyuTZvB9xNZllgePlOtrvhTGkJHu/58evb5ay2yboP+KAQlABnpX+
	QMW6MXyz/RwHxV+9oh4jMuQAf8eaq69fe+4xVg5ZO0EKiHEDOjbx3nKlhwLxAWHYNLiIEHag8Hz
	AjUZsIlBwo/p7+/wCRL3FGFgvft527pHoUomKj+MHNU+auGozcm
X-Received: by 2002:a05:600c:3485:b0:499:a685:c10 with SMTP id 5b1f17b1804b1-499aa19a3b8mr55615185e9.4.1787128380251;
        Wed, 19 Aug 2026 01:33:00 -0700 (PDT)
Message-ID: <8de158e4-c9d6-47cf-887a-de8c061c5bcf@suse.com>
Date: Wed, 19 Aug 2026 10:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
 <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
 <50005702-c719-4ba9-92f7-4d5a0dc3e0b8@gmail.com>
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
In-Reply-To: <50005702-c719-4ba9-92f7-4d5a0dc3e0b8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787128380-BDCC7034-96C3B0DF/0/0
X-purgate-type: clean
X-purgate-size: 3222

On 19.08.2026 09:53, Furkan Çalışkan wrote:
> 
> 
> On 8/19/26 10:22, Jan Beulich wrote:
>> On 19.08.2026 07:15, Furkan Caliskan wrote:
>>> sched_init_vcpu() calls init_timer() for a vcpu's periodic_timer,
>>> singleshot_timer and poll_timer before it can fail -- these
>>> become live, linked into their target pCPU's per-cpu timer list
>>> regardless of what happens next. If the sched_alloc_udata() call
>>> further down then fails, the function frees the sched_unit via
>>> sched_free_unit() and returns 1, but never unlinks these three
>>> timers.
>>>
>>> The caller, vcpu_create(), makes this worse: on sched_init_vcpu()
>>> returning nonzero it jumps to fail_wq, skipping fail_sched and
>>> thus sched_destroy_vcpu() -- the only function on this path that
>>> calls kill_timer() on them. vcpu_destroy() then frees the vcpu,
>>> and the three timers embedded in it, while they are still linked
>>> into that shared list.
>>>
>>> This silently corrupts that list. It only shows up later, when
>>> something else touches a neighboring timer: sched_move_domain()
>>> crashed with "Assertion 'entry->prev->next == entry' failed" on a
>>> completely unrelated, valid vcpu's timer.
>>>
>>> Kill all three timers in sched_init_vcpu()'s own failure branch,
>>> so it doesn't depend on the caller reaching sched_destroy_vcpu()
>>> to undo what it set up itself.
>>>
>>> Fixes: 1ad5dad74cde ("[XEN] Re-jig VCPU initialisation -- VMX init requires generic VCPU")
>>
>> How did you arrive at this commit? It doesn't even touch sched_init_vcpu().
>> All it does is move kill_timer() invocations around. I think it's
>> d884b1077817, as that's where the "return SCHED_OP(init_vcpu, v)" was
>> introduced (i.e. where kill_timer() would have been necessary to call in
>> the error case). (I can't exclude the issue was pre-existing already at
>> that time, but that would require more analysis than I think is worth to
>> invest.)
> 
> Commit 1ad5dad74cde moved kill_timer() calls into sched_destroy_vcpu() 
> function, which is not called if sched_init_vcpu() fails. 
> Before that commit, kill_timer() calls were in sched_destroy_domain(), 
> which is called if sched_init_vcpu() returns non-zero to its caller, 
> alloc_vcpu(). 
> 
>         for ( i = 0; i < max; i++ )
>         {
>             if ( d->vcpu[i] != NULL )
>                 continue;
> 
>             cpu = (i == 0) ?
>                 default_vcpu0_location() :
>                 (d->vcpu[i-1]->processor + 1) % num_online_cpus();
> 
>             if ( alloc_vcpu(d, i, cpu) == NULL )
>                 goto maxvcpu_out;
>         }
> 
>         ret = 0;
> 
>     maxvcpu_out:
>         domain_unpause(d);
>         put_domain(d);
>     }
>     break;
> 
> put_domain() calls domain_destroy(), which then calls free_domain(), 
> which ultimately calls sched_destroy_domain().

Well, yes, except that - how would that have helped for a vCPU which
failed to be properly constructed? The function loops over all vCPU-s
in the domain, but that wouldn't include the vCPU in question.
alloc_vcpu() would (of course) insert the vCPU into the list only when
sched_init_vcpu() succeeds.

Jan

