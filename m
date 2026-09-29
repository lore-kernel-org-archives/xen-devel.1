Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2528DC9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 14:53:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436489.1655139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZCD-0005pB-U8; Tue, 29 Sep 2026 14:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436489.1655139; Tue, 29 Sep 2026 14:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZCD-0005p4-Ql; Tue, 29 Sep 2026 14:52:41 +0000
Received: by outflank-mailman (input) for mailman id 1436489;
 Tue, 29 Sep 2026 14:52:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBZCC-0005oy-2c
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 14:52:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBZCB-009QXV-7w
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:52:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbd0ad-2eae-0a2a0a5409dd-0a2a4508c534-24
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 16:52:39 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbd0b6-f659-0a2a45080019-4a7de18ca1cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 16:52:39 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so32158325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 07:52:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a013d08f1esm10638675e9.4.2026.09.29.07.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 07:52:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1790693558; x=1791298358; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGaWn1OdgePanBo1DgoOq4MSpJIw+hk2TnF/zdsZf4o=;
        b=Xynu7+vSQYQR7y50muA5a+iHmkkxzVXUBzQUXFpv0GD/zgQfCHPaEWhX+tG0+1jOjd
         O0lGe+AifAuPChJvEDZA/ircz5dGkSbA+Zzkz+Ptx89MchvylToJ76jeg2wHneFttmrF
         PZ2Bc90Hoq+j/9BV1BtsbFZ2Zt+Mk9q0ZIjEHvQwo5oQipucbrPEi+0Sr0krdWwaP56L
         P69P0R8PWrJIhJrCV9npALeGdtrlAV3Ewq3yQyPnAI46u2+SCAMbtAu2K6K1h/EWdSfW
         hQryyGBvVHpiEgaOCt7LXIeFMeP4j6MEd6KBxOJoAkoZIUZXii4jITKAzY5AsDwPeLsY
         ywbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693558; x=1791298358;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGaWn1OdgePanBo1DgoOq4MSpJIw+hk2TnF/zdsZf4o=;
        b=ycsa7RTBq3+bGDGlHAYVaR+9lOwSlQjpt1m7Mw29sG/6ltA0O9OEaLHkVO5g5p8bu1
         b2l5YcWykeXPMq5SlkGoM+HqAoXE+E3qEg27pmkpz3Y0IXpN58yv8jIn29QcwlZKj2pH
         IdZ+AVuazUpobl8MCcXlVNDqhY6GJ/3fc4emOEmGK85NRiN2Ituj4/oPTuCo6wf7k+kM
         12dXSWXBKo7mGqVyUTFvmrSm+CMzvU8ubIJFA/RYPvwlY7Y0G83kyeBtCNLwSUGSBnvc
         9Sad8ewG2WWCk/MIqnbL8q5mWZQ96aI5P2a7F5HSrL6PhK7tjJ7WTekM6nfZdmthsB44
         TJcQ==
X-Gm-Message-State: AFuF++mW9brZYHtpnCL6uXSJRvLEf6I8jtbXJGRGR2mJb8AT97qKfxPJ
	r2LhUsmaOQMiftkDA71xwXuWeC1Qq3w4NrU33s9irqj9Q8g6ryZzzWrnkWYJK3vVGQ==
X-Gm-Gg: AYBFou1hFyGnrmett1W1LOPWQNEak1uWMYejyZy+pFv1Ivq1nyYxAZCKSTVtWE8Zj8X
	VB2JeiTq1nGd0yjYyISX1s9cxP2f4i+ieUEp3EC8C7wNWmjOtcl6akx16V9lXbI5XKWNbEq5L+p
	lubYlA3u1P6VgwPJvexupGNa3M/+LCVOkuzEisKTOKhS+5AmPEeFs12SunravM4vUzF9Qbamw9W
	vW2GvlHlTf9wkq3i2TNaSnXMBMt8KlnIR+gQSY33WR6ZCY+oLnnbVE6/wtqRZ3gi4DveK3MukTZ
	/bIV8F1jlcBeR4lyQOhKzjYOYO5368I9laFxBp1nOSDaZmW+6OzjP25Kva6zdmRDJMd2fzpYPrq
	DAxyoaodDtCu1MdbNYTDcm/WBZrge5tM9ZnMYpEwz4awm8MtOHIymYqOGetjr9J9p0FlaPEv6kO
	BrPVS/rAdPtvgHXk7BXe4jzppHoZFQ4bMfoA4eGx4UduArdp3UBxvhnRL5Qve95bf7RMknmWQYO
	NdlChzMKkSaWBknAfdnFg2723zbY6JE4eg1whxDUV2lkGmICuje07maRb/7FsM=
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr99420665e9.21.1790693558316;
        Tue, 29 Sep 2026 07:52:38 -0700 (PDT)
Message-ID: <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
Date: Tue, 29 Sep 2026 16:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com> <arvJQSDecSSAU1WC@macbook.local>
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
In-Reply-To: <arvJQSDecSSAU1WC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790693559-CC77387B-F736F0FE/10/78276251493
X-purgate-type: spam
X-purgate-size: 1642

On 29.09.2026 16:20, Roger Pau Monné wrote:
> On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
>> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
>>>  static inline void rcu_quiesce_disable(void)
>>>  {
>>> +    unsigned int cpu = smp_processor_id();
>>> +
>>>      preempt_disable();
>>> -    this_cpu(rcu_lock_cnt)++;
>>> -    barrier();
>>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
>>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
>>
>> I'm not terribly convinced about using ACCESS_ONCE() for atomic
>> accesses. In particular...
>>
>>> +    smp_mb();
>>>  }
>>>  
>>>  static inline void rcu_quiesce_enable(void)
>>>  {
>>> -    barrier();
>>> -    this_cpu(rcu_lock_cnt)--;
>>> +
>>> +    smp_mb();
>>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
>>
>> ... this variable is to be read by remote CPUs and autodecrement seems
>> like the wrong tool for an atomic decrement.
> 
> I can use {read,write}_atomic() instead, but there's been a tendency
> to phase out the usage of those functions.  On x86 this should be a
> plain `addl` or `subl` instruction (the non-locked version of
> atomic_{inc,dec}()).

If remote CPUs are to access the variable, is a non-locked access okay
in the first place?

Furthermore, iirc the compiler won't ever emit a plain ADD or SUB (or
INC/DEC) when accessing volatile memory (which ACCESS_ONCE() enforces).
It'll favor simple insns (MOV plus arithmetic) in that case. Of course
use of {read,write}_atomic() would also "guarantee" a 3-insn sequence
(MOV-SUB-MOV or MOV-DEC-MOV).

Jan

