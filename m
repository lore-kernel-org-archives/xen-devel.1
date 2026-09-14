Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66E0C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 06:44:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420491.1646797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60QB-0005Io-U4; Mon, 14 Sep 2026 06:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420491.1646797; Mon, 14 Sep 2026 06:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60QB-0005Ih-RH; Mon, 14 Sep 2026 06:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1420491;
 Mon, 14 Sep 2026 06:44:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x60QA-0005Ib-M1
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 06:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x60Q9-000AY7-Uu
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 08:44:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa797a9-8faa-0a2a0a5109dd-0a2a450cdd74-8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:44:05 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa797b5-f479-0a2a450c0019-d155dd31e56e-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:44:05 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso1943044f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:44:05 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:686c:f5c4:7858:246b:ca62?
 (p200300cab735686cf5c47858246bca62.dip0.t-ipconnect.de.
 [2003:ca:b735:686c:f5c4:7858:246b:ca62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb34f353sm23631237f8f.26.2026.09.13.23.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 23:44:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1789368245; x=1789973045; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xguFSnOSYw+2MbbJX+zFbpoRsJjaPMvT3MEKHOb3FA=;
        b=aVEcGDefdS7jFVcZrzB/aDJUzHLnymLPkKjkfC5W8ILj3vIgpeXE9f8Jj0EE3pGOiW
         m7T6jpTDvxy2EsIdJlMfKpP5vkopn+bjXf+oA7IEYLwxJQ/P0N2juYswI2wh5A5myntN
         JeR0Gy415UjIFQu2w3jEGFE+nF4d/lyhlKQmT9ey3nbsfRDZzj9+REgPfhGqUk9qCH8X
         MVkFApMtTi3IsY++CdITVi0pRwCRWQU9TpnRF/SJiUcOEK6a8mf81c1YyVYyVSCypCQ6
         TdkirgORF6YTy/lwmU1c9uiqCfKNRTeh7NHURU4FbMhBql3QJMPalQYLDj78Xz/X8zDp
         dtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368245; x=1789973045;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xguFSnOSYw+2MbbJX+zFbpoRsJjaPMvT3MEKHOb3FA=;
        b=pDV0g2a7sqI3m7336OG1ddy+V6jaL8j/yC19Pqpr243mlzKPaIZASYZe67VibAUEkx
         VQSAqLuW8iRSJ/dNmDStLXF+Yb1ApruHfKxf3D8WyVTbsqiRP9zybP0k77ox+B+9+gHQ
         o+V41JTgldcMSmD0hr6fmy+83e7CnRf5m+IfW+XVyvwf6o7agEvr6JI5opzYt6HTaJOA
         /2sZNwXETAqkaIfEWgeReCUk9yf2Jrkd0b5s2/MY9ENBfw7oxlpqVPcl3q4UZJ6qfVoc
         e9rC6BF6Psd331TqYg9Ojc5L+v2cxJojIMsGUGwL+gvvHs5ixAuLF9WYZWL3xHX1GvsC
         jLxw==
X-Gm-Message-State: AFuF++mCBvCeXgsJZPTi7kPR+Y7jx3cVUhb9munFzSGFegcKui+M7meq
	JJPpU4+79WKFHhMkFUToLnDR4VsJQgDHtn5K9zQi3R62M0Se+U8uA9LwgrS5uYL/Fg==
X-Gm-Gg: AYBFou1te9SLBjfZYOU+SgS0tOG7f0Ij9bGKzPPuEVCghjfS+e4n9+tWxCpktciBieL
	yHuKBF8ug/nL6Cp+pk0z5ttI6IAZSnHqP6qSFgc/GkBqBbfrvd21pWxjV/9Pg0Mimqeg+fQzMna
	+Og18LaBpLLgNjA0SUdczK7WLw1D6ayubgyo4z+hM7BVBMaEp4wMc0uihkOAWToUZv6PDDdMBhV
	uUPh6tYeFiLHt5zgvrNzyazapxvkEkKwuspYcLAwpRKqWz6lLUu353dDCiJhQ6OFAZk9kVm7oPG
	1Cw+bk3pl5vInBxthCmNeMSWJRQ8MwjD46/qS8pwhj5x2J5t1t7o9Bevr9un109OldfeltXnLLc
	J1W7DLRG5yIQbJk9c5y6g9GS5xToXxh3xopFyhyuFUMikRHw+yqNpV8D0vo63xqK9Idzp/Q/P8Z
	oeXRSz8E4KSDYELzcgFt2egwc9nEjpmGNlEahWd5wklij4lNGjYmMF0CugQymZ8hBqbgH9YD1CV
	p63Kg5SMvVa3g5pPFeP3yrsCVlmGWCUpbNbsRNyS9u60//vwz+z2xT85EBRfTUvf7LlRtRnaDF7
	BVZ3HW4sKPEO5WP11qraYlFbtjjme0o=
X-Received: by 2002:a05:6000:290c:b0:486:f285:396 with SMTP id ffacd0b85a97d-48702b35091mr1077617f8f.52.1789368245385;
        Sun, 13 Sep 2026 23:44:05 -0700 (PDT)
Message-ID: <e21ebe06-2fb3-40c4-9176-4719c07fbf76@suse.com>
Date: Mon, 14 Sep 2026 08:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
 <aqJhJO2FtkrJCabM@macbook.local>
 <f17563f9-3a42-4002-afa0-b763e125dcd6@suse.com>
 <aqJ4myv4_II75W5K@macbook.local>
 <f51588b3-4100-4353-a35d-ac0780f2aab0@suse.com>
 <aqKikxvL_6SCs_Cj@macbook.local>
 <46dcfb81294d6f644a4d3f3c11b1f47e@bugseng.com>
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
In-Reply-To: <46dcfb81294d6f644a4d3f3c11b1f47e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1789368245-02EDAA5B-52068D76/0/0
X-purgate-type: clean
X-purgate-size: 2658

On 11.09.2026 20:53, Nicola Vetrini wrote:
> On 2026-09-10 14:29, Roger Pau Monné wrote:
>> On Thu, Sep 10, 2026 at 11:52:10AM +0200, Jan Beulich wrote:
>>> On 10.09.2026 11:30, Roger Pau Monné wrote:
>>> > On Thu, Sep 10, 2026 at 10:38:34AM +0200, Jan Beulich wrote:
>>> >> On 10.09.2026 09:49, Roger Pau Monné wrote:
>>> >>> On Fri, Aug 28, 2026 at 09:02:18AM +0200, Jan Beulich wrote:
>>> >>>> The use of unreachable(), when unreachability is visible to Eclair (and
>>> >>>> compilers), is deemed a violation. Drop the redundant statement.
>>> >>>
>>> >>> Urg, isn't that something that should be fixed in Eclair then?
>>> >>> Otherwise all the unreachable() calls in our codebase are likely to be
>>> >>> found by Eclair sooner or later, and will need to be removed.
>>> >>
>>> >> No, aiui most are covered by deviations. In particular ones in BUG() and
>>> >> ASSERT_UNREACHABLE().
>>> >
>>> > Shouldn't this be a deviation then also?
>>>
>>> Maybe, just that I had no good idea how to express such a deviation (preferably
>>> without a SAF comment).
>>>
>>> >  Maybe it would be helpful if
>>> > the commit message states why this is handled differently from other
>>> > unreachable() instances then.
>>>
>>> I've added "..., , and the one here isn't covered by a deviation" to the first
>>> sentence. Will that suffice?
>>
>> TBH, the handling of unreachable() feels inconsistent to me.  I don't
>> blame you for this, I know you are just trying to fix the remaining
>> issues.
>>
>> I guess I will defer the change to someone more familiar with MISRA
>> and why some unreachable() usages are covered by deviations while
>> others aren't.
>>
>> I think the point of adding something to the commit message is to
>> justify why this is removed vs a deviation being added.
> 
> Actually this should be done with a deviation, and I thought it was already taken care of by
> 
> -config=MC3A2.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||reboot_or_halt)))"}
> 
> namely because unreachable() expands to a call to __builtin_unreachable(). It might be worth checking why that is not the case. Probably the configuration needs a slight tweaking.

Question (on my side at least) is: How would such "checking" look like?
As said elsewhere, the syntax used in and the semantics of all these
deviations are close to impossible to fully understand (which is very
certainly different for you). Yet without fully understanding what's
written at present, how would one "check" that this is actually what is
wanted/needed?

Jan

