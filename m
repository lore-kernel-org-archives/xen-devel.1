Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A162CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:10:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450004.1665500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGXK-0005us-Al; Thu, 15 Oct 2026 08:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450004.1665500; Thu, 15 Oct 2026 08:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGXK-0005uM-5T; Thu, 15 Oct 2026 08:10:02 +0000
Received: by outflank-mailman (input) for mailman id 1450004;
 Thu, 15 Oct 2026 08:10:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHGXI-0005mS-DO
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:10:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHGXH-00Fx1X-Jl
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:09:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad08a55-2eae-0a2a0a5409dd-0a2a450cd3ea-6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:09:59 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad08a57-f479-0a2a450c0019-d1558033b0fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:09:59 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so30205875e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:09:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd67a080sm50887665e9.3.2026.10.15.01.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 01:09:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1792051799; x=1792656599; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWz/Q/e4xfTnjx1BnY66hyE1/2iihu5eJvjmWLbMfso=;
        b=bZuXtkYKI6myGcLUbtf4GWPA6eBmxOBRovXqCZC+aNIKkkER3KsZy8EWia46XaGpOu
         ao4UNOOQ69jC+gmggQvtpQNUn7cjBU2e3jodf+NGSZsKWScw9qqtZI23+BpTyhMgDzL6
         H2tHN4e5Qa1pdyV+J/OJNum5zy+iJ7E6fWalQVKdzfsOlA2/OFyu5HTN6githEYEbHY4
         tKR5j50TxwxHcGpk9R2vUDfZWjoGFYObStbjwH8cjg4pcwILGetONfmsnpLTrKQ5d/+H
         CWaEZyU/P7mDM54qgp1UmskXFh4b2WJwO+7dBIfAh9zgI4BjyCahupSiRoy+BXH7/rji
         KBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051799; x=1792656599;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWz/Q/e4xfTnjx1BnY66hyE1/2iihu5eJvjmWLbMfso=;
        b=WkTQSWmCN+rGccxO8R0d6fVU508hT9YI8TsBlNrBZY9MlbH86f7QKgQ6S/VJqsH57x
         c4fZ4fhqQuV/n1l1896QVR2eR/JDiMhNupImEVFRGCVXGijyX0QyvsL84S4O57QAefaz
         A99NUAw/xlTdEDTViBu77PgkDEETVDxZP7el/pSssQBe/U61gTWW+4cmuQXhhh4H5IWp
         yGz8jk95PtZBFbgG7UKallZs/QzfC7d8T1IRiVpjfD6q50IBe8bGrjago3cRBG0mkoC1
         moS8jd9SFO2IFq2t3jLJHedQKx65/qHBEBhf2nx2gy5YWcYR4sK3KVW8VpsFC58AtuOI
         nhPw==
X-Gm-Message-State: AFq9FYKm90BR+/n4gljMIy9EOhT6YL80o4UF3fLFwlUsmdRqFErzHkFz
	s+eCyvUuzDADxpYwheVsfSaO7E0xtXMtGJO04SA717gDUrb8Q9bpTflsqN7fRKJIYQ==
X-Gm-Gg: AYBFou3Tai1jNERTxVLJg7CC6sKUtsF7HAb+w1mV97ExOEeJvhEPtL3N8xrz1p76EI9
	WG4+c1OIydmv0ALHJxBAl464/MzzvTUaAWBz2+owY5bdNAE+PVFusPHapiN+CbOYowryZ++ydYn
	prUjTGqqJ0oLpWp2vw/lvz68z6tb3ygdby/2B3WsdDAK6swFQQsaEgLYZks9wTdgQug6VsfDnAV
	R6cIoXmDg1i5uJRwxCbaccUQkFd+70WUzmBJF8pCpf+80BuJAir/JlEQnP+x4nme0NFnmGSASAb
	E7MJR5PjwO4qDcuGd61Gk63Ytd9kNVAkITA6xbXaDTbMNu7EaBABsUfDKNLWrtK76dsurQCdcYl
	pHedXic2T8pO5tGTdy+//YAOTxAVmdxjSAy7b913pVkrjec2ja+EkoBe+kGRPmq/0t1c8TWNRhv
	fN+4kCSW/DqPAF+3falwVG/7myFwOnxZa0cSQBfTZpTqs892WLn05Av4VPDQ20VyGa9HDAuS995
	uUW/XLERuVo3VyCw8oqFwW0XCHW1CkLDM3Bei88If+RDHf9PVwEkDvZh5W1Ig==
X-Received: by 2002:a05:600c:154b:b0:4a1:6af4:c6be with SMTP id 5b1f17b1804b1-4a18e4d1c0amr344415425e9.34.1792051798419;
        Thu, 15 Oct 2026 01:09:58 -0700 (PDT)
Message-ID: <2991b4a6-2b1d-4903-812c-819d478beffa@suse.com>
Date: Thu, 15 Oct 2026 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] x86/mm: flush owned pages before reuse with the
 sparse directmap view
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-16-gwd@xenproject.org> <asfoWIoeqPRX9SC-@Mac.lan>
 <CAFLBxZajMZSo6JP-Ui3Vpk8wdnWX1RtTULbYWsWPY5TjSs3JGQ@mail.gmail.com>
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
In-Reply-To: <CAFLBxZajMZSo6JP-Ui3Vpk8wdnWX1RtTULbYWsWPY5TjSs3JGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1792051799-51F33A5B-B8738DA6/10/78276251493
X-purgate-type: spam
X-purgate-size: 2111

On 14.10.2026 17:34, George Dunlap wrote:
> On Thu, Oct 8, 2026 at 8:00 PM Roger Pau Monné <roger@xenproject.org> wrote:
>>
>> On Wed, Oct 07, 2026 at 11:40:48AM +0100, George Dunlap wrote:
>>> Since d7bf1b8ea275 ("x86/mm: limit deferred TLB flushing to PV domain
>>> support") a page freed by its owner is flushed from TLBs before it is
>>> handed out again only in builds with PV support, on the premise that PV
>>> domains, with their (limited) control over the host MMU and over when
>>> flushes happen, are the only ones to leave stale entries behind.
>>>
>>> Xen's transient mappings of domain pages are another source.  The
>>> mapcache zaps a slot when it is unmapped but defers the flush: the
>>> slot's translation can stay in the TLB of the CPU which used it until
>>> that CPU next flushes, by which time the page may have been freed and
>>> handed to another domain.  Before "x86/hvm: introduce per-vCPU
>>> mapcache for vCPU-PT domains", only PV vCPUs use the mapcache, so the
>>> PV condition covers it.  Now that the vCPUs of an HVM domain with
>>> per-vCPU page-tables have one as well.
>>>
>>> While the full directmap is loaded in every context, stale transient
>>> mappings only map what's already mapped in the full directmap.  On the
>>> sparse view of the directmap, a stale translation of a page handed to
>>> another domain would keep it reachable from a context which has
>>> nothing to do with it.
>>
>> But if it's handed to another domain, then it also hasn't gone through
>> a free cycle, which is what pg->u.free.need_tlbflush covers?
> 
> Sorry, the wording there is a bit imprecise; it should be "a stale
> translation of a page *freed and then* handed to another domain".
> 
> Apart from things like steal_page(), which doesn't apply to HVM guests
> AFAIK, there isn't any way to hand a page to another domain, is there?

I think you're right that there isn't any. However, there is that plan
of Stefano's to make steal_page() work for HVM. Their main target is
PVH Dom0 iirc, so that may still be okay-ish for the purposes here.

Jan

