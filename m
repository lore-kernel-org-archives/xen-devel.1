Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B5CC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:21:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383569.1626842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcUO-0003ms-Mq; Wed, 05 Aug 2026 14:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383569.1626842; Wed, 05 Aug 2026 14:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcUO-0003ml-IY; Wed, 05 Aug 2026 14:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1383569;
 Wed, 05 Aug 2026 14:20:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrcUN-0003md-J4
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:20:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrcUM-004Azg-W2
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:20:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7346c1-e002-0a2a0a5209dd-0a2a4506d2d2-42
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:20:58 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7346ca-195a-0a2a45060019-d155dd2fe8e4-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:20:58 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so532307f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 07:20:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e5efsm9339266f8f.27.2026.08.05.07.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 07:20:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1785939658; x=1786544458; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztlQGn8DvKCCDgciuvr4MBrBLBlPYBDCgdZ1t25z4Cw=;
        b=ayVM+D2Kxo4T09BKLOTN2LqLnpH42WWy7+KKpunvyIvUBVWs5trAZBZiHJ71LtcRvZ
         JoDxuDJAWMG3RvjhE3dvdf5+a7WQamMS61K7qOOg3fzSM5nt4h9BAPffQhV4CV7ELY2M
         ek/lqSFbz7jdolg4MISIs7sJlVGEuVc2XA4kSJHrZhPuN15mPQVRslKIn9ntBu1htGr2
         BEr+0rrCIiORbigntd3FzGr9nykPRDDvdGmyusCl49vYXp7j5ry1U81bofubEwl5lBMx
         y9grbC/+NUf/bbI8aZg+pBCp4x/Qgff34W0ZKn82sv8VXNiZI1H+8FmNcB9NSH5QQlmh
         VjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939658; x=1786544458;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztlQGn8DvKCCDgciuvr4MBrBLBlPYBDCgdZ1t25z4Cw=;
        b=MR+R40dwlBhsP2qqSoc8uoLIpKJxUPg42PQ64w3r9r5G19bBMGhcIlOKlmuXaceDpW
         eXNAEgQZidQ5V7h7KJXuWJ58qoKNSsog/Ejrnkf8VFAQXahxOY7v4tTFIvILT5hfo6RH
         KRNZpI9aCass5M/4crcNOw1M7Ro9I81R9pB72CWDgGR6RUHcid7eIGPHKBkRXPku+uUG
         Kw3Ose2e/6MTBHmfQOcOcqiVcmnOr6/3vecrqTqlPP8BeNmINspq/4PvdceW/j7Y29vF
         aDNbpx7g6ObVRaBmeTSc1vjnk1jiiak4e9dSIOTz+NBgHwW3YKwWq+2aGnpRWFoBFK/F
         MZHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBp1P4A3S3svoAOgYdRYc1DQ8bFql9OuO7h9lW5o26hJSOcfI4HceRUd1nspFLC885QPyN1EAxmPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuP9LqLhl5+qCpEN6B0tu5MkA09ivr4UNRCP2PHTfLS2JqRYrb
	RpkAuTrs/Y0QwJ0Er7dBFT3x9ApjW4dNJuSRgrrUo9/Ora1Ydn7OQVdBSf3IX1OE7w==
X-Gm-Gg: AR+sD11BMzrcv2krFbha6zdtjOMrC9G1K3yK88cfAGmYStrXQigcHXt1+kAmNkAEs/T
	GJeWUIeAiuAmA9GMbHTeSpB5wM7sCimKOqFNn54RveQ/7afYF3/HGnXAPi0BkJsIwpYjimN3YJq
	zFthOVJsm0MABH4FThZLVr54/sN/SxxIV4eJqu2qqWnKO/0h8LKGeFdeWMR4yIHtxMnfahdQBuE
	rxG5SNj2vNFMf0lMTpFlai8Frfcy+ruWLsIBdtF2UztTVG+tJ3BBpDpj99Z3r6Pp2ychdMdP7x7
	9eHNIwoK7dMIX6g7jYjz8M2INura6eVBu5bxd7Ys+icIYU2QficQkVF0FdbERwBTTW2/E3rAzt/
	X2BmmCSlMBRpM0/mC4PL6Z3YVztvLttc1Z8WfM72UqbAv8v/wu1jkzPi67rj+NaAQX37cii+nxt
	13fxfD8TRABy8Mx747Xz+MVoFktHjQ9NXURAmc8kleku2sm8dXQ5NduPT2d6LXy3miOLUUq+W9S
	ZKr+recQgFQRv5heoy2M5ZGAkEkNS8avaDR6GGAKRVDjkLdXSUs
X-Received: by 2002:a05:6000:41d0:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-47fec62ea74mr13286445f8f.22.1785939658244;
        Wed, 05 Aug 2026 07:20:58 -0700 (PDT)
Message-ID: <d76fa0a2-1a53-4ee4-b077-d51715dba339@suse.com>
Date: Wed, 5 Aug 2026 16:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/nmi: Don't configure EvtSel repeatedly
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805124525.105457-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785939658-FCA0477B-568236C7/0/0
X-purgate-type: clean
X-purgate-size: 1224

On 05.08.2026 14:45, Andrew Cooper wrote:
> In both setup_{k7,p6}_watchdog(), EvtSel0 is first zeroed, then written with
> everything but the enable bit, then written with the enable bit.
> 
> setup_p4_watchdog() is slightly more complicated, owing to what
> appears to be a bug introduced by commit 2a2bd8de16b6 ("Clean up NMI
> watchdog handler."), which causes a second bit to be temporarily
> different too.
> 
> The middle of the three writes is useless in all cases.  Drop it.

Spotting the 1st write in setup_p4_watchdog() wasn't quite as easy, as
MSR_P4_BPU_CCCR0 (as passed to clear_msr_range()) has nothing to do with
MSR_P4_IQ_CCCR0. Using unrelated MSR names there is as unhelpful as using
raw hex numbers.

> While doing this, rename the 'counter' parameter for
> setup_p6_watchdog().  It is the event which is passed in; the counter
> is always counter 0.
> 
> No functional change.

These sequences of writes almost look as if they were trying to cover for
errata. Are you sufficiently sure there are none anywhere, for this to
truly be no functional change? If so, ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

