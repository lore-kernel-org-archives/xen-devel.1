Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BE3CD342C
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2026 10:35:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1299655.1574204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJqe5-0005KT-0r; Mon, 04 May 2026 10:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299655.1574204; Mon, 04 May 2026 10:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJqe4-0005KM-US; Mon, 04 May 2026 10:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1299655;
 Mon, 04 May 2026 10:35:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJqe3-0005KG-O7
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJqe3-00FhK1-3w
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:35:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87661-2eae-0a2a0a5409dd-0a2a4504b17c-16
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:35:22 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8766a-1dec-0a2a45040019-d155802ee9e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:35:22 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso19443815e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 03:35:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981ded99sm25482246f8f.18.2026.05.04.03.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 03:35:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777890922; x=1778495722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iFeFbHt16mOzgiyoIATFoHaNCn8YVz4jgJIMEFh5n9I=;
        b=Cnv4eYPyIqDMv0I1x+7XrNdpHszRJunfwQADj12wx462scHQ1TR9gq+wOtFfOPqkRW
         OjktzpqlPtZVFKQGIVaRSXTJeAU/Dy2BMpgLWCNjtEbKfC6USROvpyML097q+kIaYQmo
         JH19blUzn7z/j9ESN3NfUCqtrdj6rvqHb0BkboPxnAdE9pATj5EBEqpk56S6uCDTOI5v
         EIAeynTylBXh2Z5MC8EUYSLFLdspugjlVzZ3oJim6ve3XWEwTXnumxhgwSJtc4fLubYW
         pXrpbiwEBws/bNseVY779MDlC0MhtXX/DHKW8PBdDlq+eRQBAd3wWkiKK/1n96yLGGkl
         mhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890922; x=1778495722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFeFbHt16mOzgiyoIATFoHaNCn8YVz4jgJIMEFh5n9I=;
        b=oenGEmGHi7bO+KAlXkD5EQyNl8DTTlgU83Bwdy6a10pYM5JTMrWh+xRw08qzepwFQZ
         0qAgzV/lnK7Xh6a+zcVv7C8OnRE0oJ837EjWzgHiIss+ZV7vfA8BoKYF/boGSoKb5XWE
         bfGdF16D2PTPOWk9Fz3XBdSyRcUZ9ADKHBt0rgEA5lmoL0s2U3yUW56oS0VqVMMkwFy8
         4ItVK1hL8hqEFtyo9AU98ygcLz58DNIxAYnUMfRHdqSwKwZ8Xrkd8iQun2nx/bwL+ZSh
         lbrlH3A7cACUxE+tlbOteshLPEMzYFMJUhwacsKRBBSWrdyKbEGGZTCCiPUSnlfuDgWs
         jG/g==
X-Forwarded-Encrypted: i=1; AFNElJ+w9QDrreI9SvaXHQ9zJ9hpx4gXRK58LX5ZHuoWBjvvUVq0RcUKdAtcSMLADzL9MU3Gfm4MAzdRc4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyErWVHUHMda76r57OR52Ezd/D5Ak8uwPqC7mWzHFBSxC6xOvjf
	HyhQ983+GYMGwGJWZ2JrJ2JfSHc9CqbwKGieF8TFzwhR3AZQ3Zfowx2C+HVvo5LDjQ==
X-Gm-Gg: AeBDieuayANFJ2TkEo3Vf7h/+UHiu1iRQwMBnz5SIkM/HSeBiYcTLHYyyfoHG1tFM7Z
	U3brjRSYUoomw8jT2QEU2BMyOqWpJppi3pW1ZsEjFgoDqVRwhQY6aCa4rY48loGXMEaQQyvO4vm
	rEDnK51c5oQAe9weHJRVOttaC8SbQwnOr9j3hghhG92pqIDmhB88YZ+fXLWwYU/7Y7f6mD7cDce
	Eo3WZkM/zOUoA5JzE1CN+skUOopG7CRqKPvMmgx67SeL7l1oMB7XbFZNSb3+CgFdYlwkDL7UH2T
	01DFv0xHrMXK8cPhl6s/cDpZq6z9XJ1mlGcXDMtNVCctH9ipo8YOItZyPEQZK9AotVIZTZDbO03
	0isnXJd4ouKD3kaNfxf72WFm86nNhIJIPs6xx3SgKmzS9sOo2eXa/oO47LSyRzZ+jRjHF93KzC0
	uGxcbiY98NrTO9ej9aHYM4N9wsouWm0/o69NDtzajSppkdMLYP6ZSPxLoEaEtHMMFN7jfVfNzc8
	Nj9gQVNgAf2Rd/OaCuqProIeq4hw1P3ZvGe
X-Received: by 2002:a05:600c:1386:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a988716c5mr143453095e9.5.1777890921037;
        Mon, 04 May 2026 03:35:21 -0700 (PDT)
Message-ID: <085c1968-6863-4948-b1e1-7b0bad2bc1ec@suse.com>
Date: Mon, 4 May 2026 12:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: Drop allow_unsafe parameter, tune down XSA-9
 mitigations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
 <60c94a2c-a414-4ba5-b22e-54beae3c25f3@citrix.com>
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
In-Reply-To: <60c94a2c-a414-4ba5-b22e-54beae3c25f3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777890922-28B733FF-6534CF25/0/0
X-purgate-type: clean
X-purgate-size: 1987

On 24.04.2026 11:18, Andrew Cooper wrote:
> On 22/04/2026 5:58 pm, Teddy Astie wrote:
>> XSA-9 mitigations prevents Xen from properly running if a affected CPU
>> is detected. While the vulnerability has no mitigations (aside not running
>> 64-bits PV guests), it's only outcome is a DoS.
>>
>> There is no real point in preventing Xen from working here and it would
>> be preferable to just log the vulnerability to the user so it can act
>> appropriately.
>>
>> Also reword the errata message regarding that it only affects PV64 guests.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> It's hard to tell whether or not we would want to drop allow_unsafe, but
>> currently, Xen is allowed to boot with XSA-304 mitigations disabled
>> (intentionnaly) which has a similar outcome than this one.
>>
>> From a user standpoint, preventing the system to boot or starting guests is
>> too extreme and would be in practice seen as a bug, even if it's justified
>> policy which can be overriden.
> 
> There is a lot of history here, including for why the panic() is
> actually completely unreachable.

Deliberately so, as described in 0c7a69665110: The change done allows for
a trivial 1-line change restoring prior default behavior (in distros which
may want this).

> I actually have a very similar patch, from almost certainly more than a
> decade ago.  The difference is that now I'm a maintainer and in a better
> position to say that this logic really shouldn't have been taken;
> certainly not in this form.
> 
> Perhaps an easier justification is that there have been issues like AMD
> erratum #121 prior (e.g. Pentium LOCK CMPXCHG) and post (Zen1 has a
> related errata, can't remember it off the top of my head) that went
> unaddressed.

I agree it would be better if we were consistent in treatment of errata
(somewhat) similar in effect. I'm less sure which direction we should go
in order to achieve consistency.

Jan

