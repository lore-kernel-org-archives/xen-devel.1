Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B603AC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 08:03:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372199.1619586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wocmX-0003XB-DO; Tue, 28 Jul 2026 08:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372199.1619586; Tue, 28 Jul 2026 08:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wocmX-0003X4-AX; Tue, 28 Jul 2026 08:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1372199;
 Tue, 28 Jul 2026 08:03:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wocmV-0003Wy-SN
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:03:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wocmV-001y52-8n
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:03:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686244-2eae-0a2a0a5409dd-0a2a450cec56-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:03:19 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686246-f479-0a2a450c0019-d155dd34c95b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:03:19 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f7854678bso1213656f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 01:03:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c46240c4sm57476945e9.12.2026.07.28.01.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 01:03:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1785225798; x=1785830598; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2GLG6+V1DlfEJxeQ+3HMIeqcrQuJlhbxT8+jpUHpdw=;
        b=G9P7Gb9FqiddT1ZxB+siTZWnFEPzqrikxS1N9hYmavtNXfVnPZJgA1oHOL4gaU/5rD
         BYuVOQ/dbaYrSZxYYxAJHbyiotJn+k/jQJXWvfU18oOH3ZFt1Fuoxee3vZju/woC3t9A
         BShnm9vmtXc5utntbAHi4hwWmKgl2/0H9/s2Zow4KK6O95i6pNMpHIe/To54QWL0YmMK
         bzJYwLWqpDWfzmljsjRKDyFwcNq9fkw3LNU1uDKig0z4Y95LcJ6kA9jyLPWnyEXfQQgk
         Sl9Hp77ak0nYrV3pcClIaUJoATQjDfjLj/4c7nGODA5XY7AOhO12JfkLgt4ebkmryGqa
         QhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225798; x=1785830598;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2GLG6+V1DlfEJxeQ+3HMIeqcrQuJlhbxT8+jpUHpdw=;
        b=IRrohSlEVkTwj2Jo6HnIpsj+/cY7wySjiTgSwhliKrqdeQGqkdrfyWs6DbKKP3r/XR
         cB3xziOEd2fK0TrNOUDIOqywN5a71/HqUM42OWTssFneF7nYWlaHU111jw7bro8vnZ3g
         W4NajMBcvCg3z0gRUz11Z0DdBJOdZeyATbRPnzB1qBCu1lXbI1dE029xyXG4iPNTt9aL
         pAu5torPHUt74fmlBWW/YjvMVJK/Z3jWP+xWbFPu1y/O8s1WzewuSPj4Hg9899/NmqJd
         30kBtNbIQa0nZbCs/dg2z//XDlygvQ+DC3hIpLUO5Iq+h5LJwEcQif/T1QXof9sud6o4
         l3QA==
X-Forwarded-Encrypted: i=1; AHgh+RrPFIojxuVpVutCtG1+dr4swR7BJ85Fk6wQCbaHLQIi/m2jV0hWm1RQRkckBicsCaPdBhFCEQVieLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhIA8DNwJc71L8SSVgATfmrQCPUm95qk2vzX7XFcWcXBqt9aYK
	/Os3/3ZwQVQkUK3CT50XgBoepXwVWcT7nw0fdB4Ls1RyaIZHorCWBEoymhG8wK5/NQ==
X-Gm-Gg: AR+sD12RHCgqYWqvsyU6WiqKbNNzLU19yKcftJqr5jIKtmcxCA1DPKEQ8MmtlsltZtZ
	zpBpe/v31LIXc4UbcvV0/wDwBzC5Muzrh9GALiMy2n2YzpgTaJPGK41NZFgm6K4JV1SLDWC/New
	FiCDpp1r6aLRsBAMaYqkp+jBxsDowFO0rgdRi0Uq2nbIt9SXwTM/hgOu0v3vGoaQLLlBxyq5OYi
	Zifk542XA4JwXITWkRlcUoY7gdnr8GUqsvXkYcE+eWFT9aqlGJ2tV73k7gIYT7QTWu9OAtHrxH6
	1CG6JlyNxOKDoMPvosqZKksl+H3Rtv+YIPxJlDIwTXVZ8XJC+w6/SO1oIH3rh6z9jQFqRaLed+2
	TUJlDObi6q6ge97j3fOhdFmMc92mb1cs6KvRURD9ZENj1XO29BTdYoGocVvBszWtVtVyiaL6QZB
	ffCQHXAojph1N7MJFAthFQ9aGQAr5LVBoSGFpp+iC/xjsUYgds+BCWteeyR0wpHOYRkg==
X-Received: by 2002:a05:600c:1d19:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-496c641518dmr14388755e9.2.1785225797345;
        Tue, 28 Jul 2026 01:03:17 -0700 (PDT)
Message-ID: <874be4f5-b7fc-4114-959e-1b31ed4e7608@suse.com>
Date: Tue, 28 Jul 2026 10:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: ross.lagerwall@citrix.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jason.andryuk@amd.com, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, teddy.astie@vates.tech
References: <1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@vates.tech>
 <20260728071641.263677-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20260728071641.263677-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785225799-03CD3A5B-5C2489AB/0/0
X-purgate-type: clean
X-purgate-size: 1201

On 28.07.2026 09:16, Stephen Cheng wrote:
> On 27/07/2026 11:48, Teddy Astie wrote:
>> Had you considered improving the current implementation of virtualized
>> VMLOAD/VMSAVE ? AIUI, the way Xen currently implements this instruction
>> (by mapping the L1 VMCB then calling vmload/vmsave on it) is more of a
>> implementation choice than a requirement.
>>
>> A better (at least, likely safer) way to emulate such instructions (and
>> not relying on VMSAVEvirt) would be to copy parts of L1 VMCB from/to L0
>> VMCB and let Xen perform the appropriate vmload/vmsave on its own VMCBs
>> as usual.
> 
> You're right that it's an implementation choice rather than a hardware
> requirement.  On whether it's worth building, I'll defer to Ross's
> reply: given how limited our resources for nested virt are, and that
> AMD nested virt doesn't work today, dropping support for older parts
> isn't a functional regression.

But the functions you drop aren't needed just for older parts. They're also
going to be needed when the insn emulator hits these insns. This still is
in need of properly wiring up, but imo we better wouldn't delete code which
is going to be needed later on.

Jan

