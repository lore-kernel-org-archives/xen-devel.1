Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B74C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 10:12:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408118.1640813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Qta-0007cr-Jd; Fri, 04 Sep 2026 10:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408118.1640813; Fri, 04 Sep 2026 10:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Qta-0007ci-Fj; Fri, 04 Sep 2026 10:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1408118;
 Fri, 04 Sep 2026 10:11:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2QtY-0007cU-F9
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:11:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2QtX-0097Qv-6L
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:11:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a9948-bab6-0a2a0a5309dd-0a2a4505e76c-44
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:11:39 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a995a-4cb1-0a2a45050019-d155dd31f050-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:11:39 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4858303de5dso1025403f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 03:11:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885c5bbdsm4911880f8f.36.2026.09.04.03.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 03:11:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1788516698; x=1789121498; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm/ie6BzhM/m68G6nNkLdfn5xrpN4kaLJzeUG30OYRM=;
        b=cWwxkVerjGRvLTjnhypxPOQkZz5hHl4cfjt8lQQl+IjVXar6jWXxxKAmoOZkOuHtkL
         f6B3e2qB4rgTDq8GbViDa2uHh2O7iMnA1zqIRT0NcFKSUSUjp99KZ0NGB6xTjPIS4I81
         0P+/z4fSCPftcpqamsD39NIlq7LcSpbr/sxyA4mWZ5+XXd76HCktqBUeZ0AH3TPU06iv
         WHiehabS7HQWYAP7gBZtJFxJ0OLJkA/vNXX/o0vFPylEI/To48q9MTj3nhW0MTTJ5Lg2
         53ctAM8HjycPA15j9At2tsbElvu0r6Xj4Hiy7oMGxG3E+w+1faCUA2QXSxRxoXjxj/kH
         VYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516698; x=1789121498;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm/ie6BzhM/m68G6nNkLdfn5xrpN4kaLJzeUG30OYRM=;
        b=AcnSXwGEUYOWChUNTowYTlYVl3oKfe+rli+XAER7tAoww6yvLHUkiRxUMY6AF/9L4x
         ccYRdBb6cGCDMg9VUvmLdToCAThVUQIiPCyXAw88jDijEEzYS6nINMm82rWjm3eRDrm6
         q/zmACt7eb8FtlswCptXk0dRjhgGWCwQYyoeS0/MKSdPx/ftp9JO8zu8ixlcrmclY346
         TiIQC6wTAZFH5pve6Hguysu+zILafaSFjLcUwJTlWa1zbWKlc5FYLwUlQNSQqOrlzjUm
         tUzrgTeuTZuAMhr8cqllwzu9EkJk9jexB4L03Ao4W/i6injQjJan8iT3mKd3boEgEbf1
         ie4Q==
X-Forwarded-Encrypted: i=1; AKwUvByg1nd86OQSWcNZIoF/rA5Tooq9t5bWa9o1tK2vOJAzo6wjaDQ2+VhsNsTsMBp9vwTqA0Cx6GorG1M=@lists.xenproject.org
X-Gm-Message-State: AFuF++nKRK8yAv3zVxLC8il8I74cWYMY8XPwpPMwU42kj0DWAfIzva1h
	EMwYyx/4nR34e1ZV75KsklCK95mn5yfC0TmKLp+1r684u4UI9vUdC7JMdsyZEJP11w==
X-Gm-Gg: AYBFou1rbj8Nrasu40yJQjtO547yTjwWcGmeV7FRNrZeOagDh5wZ3XGM2hsmrWMMUSu
	JB8i0sHxTSEerzt4XSUFQOfyrwpC31vJ/UCiWeh2GdctcDYFOQxjVpcDySzqEEne4EMTh+pSMvA
	6WfDnH0M9eBQEbwNTlLQhHVHGgaDmyI1GsZVgT09DZQg4jiR3d4mVUVwtZnr7Nuxzx2HbSLdxml
	wm1a5qTrZAOSZLkX1V7Xmp+ovnbBClGb2KFjr6UhJ1q0whrKuXV68mc60cFEDrvEMpG777gkNi1
	2pmvAX+aIIX6ta2U/uIhGo0Dv93oH+bcPOHgKcRgEfUDRQ/Jlr0VzYH2tsUOxWTvYeRkG+rQbdX
	C92PMGIi/0+ook/SMok9rW7fM51nNxdizoNPazrQwgeX3yyU1q0mNUbfy962c7wCT8wELaoO7Zh
	ZpaimcFCma19jhCMQ9FyUNTJa8CQYDVTaF2nQ3yZbyybXSyBegf9bMbwMOfeHbbNSQ8an9IjBNT
	9yPEUeEvLB+5i1BaYqdmPa4o6yOYIXhuF1tkYSFYQVDz/Gipi2o
X-Received: by 2002:a05:6000:1a86:b0:485:8c16:a332 with SMTP id ffacd0b85a97d-4858c16a74cmr2175953f8f.39.1788516698432;
        Fri, 04 Sep 2026 03:11:38 -0700 (PDT)
Message-ID: <caf3fe1c-fe49-411f-a4ea-7512d671debb@suse.com>
Date: Fri, 4 Sep 2026 12:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
 <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
 <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
 <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
 <f413cc9c-cef5-4f85-b232-15e3c64f2a45@suse.com>
 <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>
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
In-Reply-To: <CAFLBxZY=37WMc2+7Sc8zRSFcLCe5RdAwsPuyKUpMrQm87kvPeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788516699-F76BD2A1-1F9F4119/0/0
X-purgate-type: clean
X-purgate-size: 2898

On 04.09.2026 10:50, George Dunlap wrote:
> On Fri, Sep 4, 2026 at 9:29 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> your position here is really inconsistent:  You wave
>>> away a partial pagetable walk with three map/unmap operations on the
>>> context switch path as something we'll have to do in the interim, and
>>> can optimize later, but are now threatening to make me add in
>>> special-case codepaths and run tests to save a few memory reads and
>>> shifts.
>>
>> I think you misunderstood. There was a concern raised already on v1,
>> and that concern wasn't covered by the patch description. In my initial
>> reply I said "Functionally the change looks okay to me" for a reason,
>> after all.
> 
> To quote Andy's mail:
> 
> <<<
> 
> So what this patch is doing is still keeping the double copy (the
> fragility) but reintroducing the expensive part of the operation into
> the context switch path.  If you can't keep it being L1e, there's
> probably no point keeping the optimisation at all.
> 
>>>>
> 
> Basically what I took from this is;
> 
> - Andy thinks stashing any intermediate form (whether L1E or MFN) has
> a technical cost (two copies that could potentially go out of sync,
> thus "fragility")
> 
> - Andy thinks that the expensive part of the conversion is the MFN ->
> L1E conversion, not the vaddr -> MFN conversion

Iirc later, when discussing with me and Roger, this was somewhat adjusted.
Unfortunately the outcome of that discussion wasn't put in a reply there.

> - So, stashing the L1E might be a win, but stashing the MFN is unlikely to be.
> 
> - If we're not going to special-case this path, we have to pass an
> MFN; and if we're going to pass an MFN, it's probably better to just
> to get rid of the stashing; the extra fragility introduced doesn't pay
> for itself in terms of potential performance improvement.
> 
> Note also that by the end of the series, we add two more
> populate_perdomain_mapping() calls to the context switch path, at
> least for ASI domains, which means another two of the "expensive" MFN
> -> L1E conversions.
> 
> So v2 is doing what I understood Andy to have suggested.  I agree the
> meaning isn't 100% clear, though, so I may have misunderstood him.
> 
> As I've said, I'm not opposed to optimizing this path once we have the
> final form functional and have measured it.  Mapping the three tables
> we need to modify in vmap, and stashing both the addresses and
> pre-baked l1es, sounds like a perfectly reasonable thing to do,
> *after* we get things functional and have had a chance to measure the
> new context switch in its entirety.

And I (largely) agree. What I'm asking for (beyond feedback from those
who were involved in putting in the optimization) is that the removal
of that optimization be justified against the original commit's
reasoning.

Jan

