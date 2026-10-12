Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C61CA9ED5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 07:05:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445840.1661688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGA5X-0000NU-0v; Mon, 12 Oct 2026 07:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445840.1661688; Mon, 12 Oct 2026 07:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGA5W-0000NN-TQ; Mon, 12 Oct 2026 07:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1445840;
 Mon, 12 Oct 2026 07:04:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGA5V-0000NG-Ti
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 07:04:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGA5R-0055a0-TV
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:04:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc867d-2eae-0a2a0a5409dd-0a2a4503c17a-34
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:04:41 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc8689-fae8-0a2a45030019-d155dd32a4bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:04:41 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48b02a2359aso1393515f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 00:04:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9aba3e5sm17507061f8f.31.2026.10.12.00.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 00:04:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1791788681; x=1792393481; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5H9B39Nd5D95c8kb4KNIU0U3j7Hw+T4Kk/G3QmQq88=;
        b=STHEUxJPWJ+CduLhPGuUPUkq2xPMkJ8EV60/mObF0qCwGoab2ErdXauKPcDs8wBU5Z
         AG6ooB9K7iR29bddVVhynDsD38u1x0Gmzv9VBi7XdDbn4TbkNS4osgQIxjXDBVf0JxsS
         1eTTtEmW3Y2pMnLuhS9ZZ7zvbEHvw6gt7fgo+pd8r9F6sUsBBicblhDRgg2nWEXBiJHn
         sgu0GpQmDPigb1fi8MJltwTaJruTeExoxRz2RIlyhnksNvIb3bkJMQyrnigYyiO/NIw2
         Gh7P10SJH5GCYHU1pZOjAN6xo1PoCACv+oHC2gfNrKmHAH+3Jrf8fWpNYyMgEgZ1Ww/0
         jFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788681; x=1792393481;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5H9B39Nd5D95c8kb4KNIU0U3j7Hw+T4Kk/G3QmQq88=;
        b=LBBVo1n+RHcME5iNeiE8npoP/B/eUBUbIiMSwin00H/6/kCPL7m84ulYbER4s+tFlt
         IXW/5Y7uhdb7KwxXT/Vhc/jpeZFVU/gQXt2XEE6M0yMnyPOb7lbNGpWaMP4oejii6+N+
         mdszJMhClfO77WFI5J+N7w81CqxdybSZYL3amIc4A3GjgTJhWkSch02VYhHVBcTjebMG
         v3tm4jQpDYHJ6DzW2y7qhcDRuEnU/235mxW+sscczEsTpmsPRPclK7E8SWsHkH6QYDug
         qTd6mCezK0LLpdiYoDnJi6IzSwV9RLHvtPc9lI4dEeVLb6/LRTM+bI5QxOqmmAZImCL3
         7xow==
X-Forwarded-Encrypted: i=1; AKwUvByoEANmel0mrSOOu8rz1odAI+YSmrPJy6WoqHpduZwO+B4qAcdQ6KZMSY3XjXh0Z8GUs84l8lqo5gU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKG37JYbUeLErVzNJu5cZrv8FSn2Gr3NmiIoT9Ncf6uRzjvxgAo
	9/vYzjp936b5pXIv1fcVOX0yfVDex3Ed/pBKxMytFzxi8q3M05dVhdyeTWU9JvGnuiRxmDX13Ck
	4jIxVnw==
X-Gm-Gg: AYBFou3rpM8/wmVhukmAEnctIhfUGRE8gl8G/8A7EVE2rmpUrhZDSsidQ+bWUfTPJ6G
	h+nOR/sJn8wawHIOl+AcFDW1McQ6T20wJpKqsWbywvlsT/nEzn73VgykNtImXMAM2zoBq6Dt6tw
	Vi/kUzQu5UxerDMUH7JBuGxHdOErxlq7349WNOHyzlrKUreL508oS3i3alWzasM0xhnjv0WegDk
	MFc0croG7IoJk69crGiJ6dHn/7RlZ7GLSxGEHXmrs5JZxlZoH+yIbqZVH2figdvSq16EfgLfFOc
	wT6fjq0JNePMBvGjOzKEneGHYkmSpeN5op++0wkGYElMx5IRPHOYI4ITsrpVzmBlXnpe0IK5C7V
	Z8WJcTXFKaaWGDb1hYIGxDLnJqECo/JcgV82vo5BcYEaWW5EWRbjr8UfD+0zGFAwItl8h9DkU+U
	NXqyVvhlq6osyva5vTuPwBHoH3demNSdlEIvi2/2Yr/OUdlVrAsLi6TgDJTVkTRKroRmqxeYXtG
	HRCWI6JOe4GPB/x8RCoaSaU24cO1T9SAGUuUhjCxUc0qwO18aM0+UE6YKOJZBXJsz/nfuQd6Q==
X-Received: by 2002:a05:6000:25e8:b0:48c:55c1:fb47 with SMTP id ffacd0b85a97d-48db9464fbemr17188299f8f.10.1791788681016;
        Mon, 12 Oct 2026 00:04:41 -0700 (PDT)
Message-ID: <0e9d573f-299a-4459-81d0-94c905c85c8e@suse.com>
Date: Mon, 12 Oct 2026 09:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/argo: make the ring copy length check overflow-safe
To: WeiqiW <coolhaoyt@gmail.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>,
 WeiqiW <lukewang19@outlook.com>, xen-devel@lists.xenproject.org
References: <20261010132845.36208-1-lukewang19@outlook.com>
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
In-Reply-To: <20261010132845.36208-1-lukewang19@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1791788681-6F0C94E9-0F0F064A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1554

On 10.10.2026 15:28, WeiqiW wrote:
> From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> memcpy_to_guest_ring() bounds the copy against the ring size with
> 
>     if ( len + offset > XEN_ARGO_MAX_RING_SIZE )
> 
> where len and offset are unsigned int.  offset is masked below PAGE_SIZE
> just above, but a len close to UINT_MAX makes len + offset wrap below
> XEN_ARGO_MAX_RING_SIZE and pass the check.  The head_len computation in
> the loop wraps the same way, so the copy length is no longer bounded.
> 
> All current callers bound len via iov_count(), so this is not reachable
> in practice.

Which makes it questionable whether the change is actually needed. But as
it doesn't look to introduce (e.g.) dead code, the change is likely fine
to make.

However, there's a formal aspect which may need sorting:

>  Do not rely on that: bound len first, then compare offset
> against the room that is left.
> 
> No functional change for in-range inputs.
> 
> Signed-off-by: WeiqiW <lukewang19@outlook.com>

There are two different real names and three different email addresses
involved in your submission. Generally we'd expect at least the From:
that's going to be transformed to commit author to match the S-o-b. The
mail coming from yet another email address is maybe okay-ish, but not
helpful. The main problem being - how would anyone (reliably) determine
that all three belong to one an the same person, not several merely
happening to have identical / similar names.

Hence no ack just yet.

Jan

