Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB88C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:24:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407974.1640715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PE3-0001nT-Un; Fri, 04 Sep 2026 08:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407974.1640715; Fri, 04 Sep 2026 08:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PE3-0001nM-RG; Fri, 04 Sep 2026 08:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1407974;
 Fri, 04 Sep 2026 08:24:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2PE2-0001nG-84
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:24:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2PE1-0068X9-L8
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:24:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a8044-8faa-0a2a0a5109dd-0a2a4509a50e-20
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:24:41 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a8049-be1a-0a2a45090019-d1558033adcd-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:24:41 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so6224305e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 01:24:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee60bae6sm166982965e9.9.2026.09.04.01.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 01:24:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1788510281; x=1789115081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mxqBxYsPuVY5Ues6Y+FJ04DO4eGszOkGdL/EPudWdE=;
        b=fJE2DB939nXsCYT6LX05agSb90bpPrDTANkEhVkEmtuJLJnJI5WT0tvxJxUTsG6AMU
         Larh+xheaZH3QnspbcQRpwBHAJOkpGlDApvebPXfgeAFbyERcqimKOE33O49pyuywxiy
         gHcms2y/irPXEFEfizvrtAEfnH3y+74AXM4YmleVL+jPIOIHaNigghRnt9LS+N+6fY10
         ptVEy8X9IMUBrsuhRov7FsxPAkIMINXCikR2WntmrcOxWl+zlOjw+qznx+YeZZ4Udhnw
         iZDW58LU6uEEdsWTMak8tAFIhB3H70nTpNgP1DWhd94UfLigIKnLssNYB991jJPBa0Em
         FLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510281; x=1789115081;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mxqBxYsPuVY5Ues6Y+FJ04DO4eGszOkGdL/EPudWdE=;
        b=nzO6YyHFy5gOkqMq90C2UOzB2Wv2O2Mb3ww9T2dDEArhFWRVjKm1zPgCTFJlK2KcOn
         aqhnBzdxBsKZLdhrXWUfoCbzd1TdUSpePxcC9bR/IrxnjIVvP2H9z/SZaqy/QYQMVUjg
         F66j/jOepjTmqM3xwqRJJI7avox4q5NLONnXbEL1PhQoXFM3kYPJw415wfQZz1RwJsT0
         +xMfmzVIvHNSUef2rIhfB3EJwT4KALLb/tIVVdXKuh7GnwCuWMf8blayCx/oQJ9Z+3EE
         zT05q5Mhmu7lsVen4fJwHFxJOcmvJDhk5Wf8+F3+kX/Ahl/NouKRFK5wLON+DdbcjDbe
         cwlg==
X-Forwarded-Encrypted: i=1; AKwUvBx/dlZlP1WMSP2xxkwsGyodFafY+TlkftIMl6jmZi+AWKxBZvvwOUXYfSc7SUGchFHCBDTWrX+JwY0=@lists.xenproject.org
X-Gm-Message-State: AFuF++mg3ulQutroQrN0MPHJ/Zdxsc98ieaqNy26PiAHg0BV/ae+MK0h
	uz2Sn165LDmZnH/4Q2dRX7hF4n1KDa9LfSiqtLdfKmtm2YoY/PhZvRmRaXEZcLysgg==
X-Gm-Gg: AYBFou29V1PCfvcEkfEUiv/RkOrqoJLefAHmOgMj0ir4bq74XE+Hhc89IU7hV0MdxHI
	kAih4w87twlS3fb9r9ATnt3XAhEe6dUl9bWlR1IKpHd206Ng1ZyUhf21w52hOSbE49jwBJpWXk7
	lK+e8s31rAV00NcLvdfUYqz9Nn+NkjezFh3bBtv1aBUrkkVPuerfwUR8NgoPHlfsdzFtV2TN4gp
	7y4+5zpSZFMrwXRHs9ztO2bGNCt0MLohHO+YuUSUkAtwuVKWQo5D0EwjHizoQPT1X+5uHAave8l
	wYKQGdXuL39Sq2MwhYMnIvY1CaAci9bRMDPhAIpWInY1PnepksS3LvNwRsHgo2q9r+iJ/R3oWvE
	2paADtpa4iSQthFVFclA/NiToAcWFV4m8n4nHnIxDJOnl63hNrFTkGK0N0KKX3hVcE9tHPhzGNM
	LtBWrqK5QYa0C/CHlZmmJ+/kZaKUTyjLoIZ1JrXUfa7oSVAa3VAoS0sJJVwHTczCi2O5YpsIqDl
	CUMHnEy+zoZSQVUMGhWRKgN23Vc6vYC5blMdUP3vCHFVGgTs12d
X-Received: by 2002:a05:600c:3b11:b0:49c:f7c4:dc54 with SMTP id 5b1f17b1804b1-49cf82512b9mr58363415e9.14.1788510280948;
        Fri, 04 Sep 2026 01:24:40 -0700 (PDT)
Message-ID: <98ea7e14-4787-43a2-81ef-a65493e3cd92@suse.com>
Date: Fri, 4 Sep 2026 10:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Support multiple ioreq pages
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Julian Vetter <julian.vetter@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <23816f6d-57eb-4567-b6da-93269e6a1c23@suse.com>
 <1788509352.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3@vates.tech>
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
In-Reply-To: <1788509352.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788510281-3A0C5034-1613B71D/0/0
X-purgate-type: clean
X-purgate-size: 2934

On 04.09.2026 10:09, Anthony PERARD wrote:
> On Tue, Aug 18, 2026 at 04:08:04PM +0200, Jan Beulich wrote:
>> On 20.04.2026 11:38, Julian Vetter wrote:
>>> Julian Vetter (3):
>>>   ioreq: switch ioreq page allocation to vmap
>>>   ioreq: Indent ioreq_server_alloc_mfn() body one level deeper
>>>   x86/ioreq: Extend ioreq server to support multiple ioreq pages
>>>
>>>  xen/arch/x86/hvm/ioreq.c |  63 ++++++++++++++++---
>>>  xen/common/ioreq.c       | 127 ++++++++++++++++++++++++++-------------
>>>  xen/include/xen/ioreq.h  |  13 +++-
>>>  3 files changed, 151 insertions(+), 52 deletions(-)
>>
>> For (future) reference, in case it wasn't said earlier:
>>
>> To be able to test this, at least the last patch here will want to wait
>> until the apic_id == vcpu_id * 2 issue was addressed. Andrew said he'd pick
>> up Alejandro's work there, thus - once finished - permitting up to 255
>> vCPU-s (i.e. requiring 2 IOREQ pages).
>>
>> Once (really: before) we grow the number of vCPU-s for HVM, we need to
>> revisit the amount of VA space set aside for vmap(). For many years we've
>> been adding new uses of vmap() without making sure its reserved range is
>> still adequately sized.
>>
>> Since multi-page functionality added here will also need qemu changes, and
>> since we did determine (elsewhere) that ioreq_t needs to grow as well, it
>> remains to be decided whether the two changes wouldn't better be done
>> together, to keep the qemu backwards compatibility logic somewhat limited
>> in size / complexity. Anthony (in particular) - thoughts?
> 
> Put like that, how can I say "no" to merge both changes together :-)
> 
> It will certainly be simpler to maintain if having one feature mean also
> having the other. But it kind of depends on whether both changes are
> ready to go in at around the same time. I don't really know how the
> changes in QEMU will look like, and how QEMU will choose or have a
> choice of which feature to use, and it might be one that can be
> negotiated as runtime and the other one been a compile time change (as I
> think QEMU still depends on unstable ABI).
> 
> But it looks like both changes in QEMU are for having more vCPU, so
> having both at the same time might be better.

Growing ioreq_t (in particular the data size it can hold) doesn't have
anything to do with increased vCPU count, I think.

> So yes, I'm all for less complexity, but I can't ask for this to be a
> blocker, especially if the other change might takes years. So far, I
> don't think I've seen any patches for QEMU.

How exactly a new ioreq_t would want to look like remains to be discussed.
Perhaps we could go an intermediate route here: Add provisions (e.g. a
full page per vCPU, plus a format identifier at the start of that page),
allowing the enlarged ioreq_t to be put on top, yet without needing any
(further) changes to the map/unmap logic?

Jan

