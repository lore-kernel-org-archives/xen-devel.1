Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7DCC6B19
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 06:21:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448462.1664487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGsMi-0003FX-FV; Wed, 14 Oct 2026 06:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448462.1664487; Wed, 14 Oct 2026 06:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGsMi-0003FQ-CS; Wed, 14 Oct 2026 06:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1448462;
 Wed, 14 Oct 2026 06:21:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGsMg-0003FK-DN
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 06:21:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGsMf-003Kz5-Q8
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:21:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf1f5b-e002-0a2a0a5209dd-0a2a450bc210-24
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:21:25 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf1f65-b7e8-0a2a450b0019-d1558035c8a7-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:21:25 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4956869750eso26399655e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 23:21:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19f249692sm405268785e9.3.2026.10.13.23.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 23:21:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1791958885; x=1792563685; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noYBIJiktNRyqfUuXS8gQRRDHhRezXm9D75uOzMy6mQ=;
        b=e15LNspGX8j2dCSgbN5lRPJriNth4hopbwUA/FxFl9cdAsBiwcrg9JM7m3qHx5ng5f
         3YiEkhrA2GOsmI2VpOk8DHlZQWalWYw1BP/VyWZjsFJTwKsjr/CrgeGqvdxeUtWpD6Oc
         W3+14zftZhvdQNgkj/3pXwgLC9oog6DmeisEkdyUAkX31i+qjheioVq9qFMzzlCEXv4+
         gjlU1tA8Ip1TjKkiItooMAASwT4VlhP5vkJpytAnNc10fivfCHkjlCy+9FyDMUZd8iRZ
         v7zbsPySgKrx3lFpBkIetEqAgU+2Jgc1lfj7jGcAxsw3hfNt9ZtFTv9rGVEkF8+9LllD
         0frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958885; x=1792563685;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noYBIJiktNRyqfUuXS8gQRRDHhRezXm9D75uOzMy6mQ=;
        b=gbh9XhamGJXXOcCH9wVNrbhx8PM8R9xOpTWu2OcT0m+stDDT8bO3cXHjnWFj2zcja2
         Al0M6iHNaT8f/dh2GGnULXDrdGXW7V/eEkiFMehZi2xPlG75Ne4uvcaq6G3rqBsh7tRM
         Sbb18wqpT9L+fP/08w550csSmBkqUso8rUY7qsDTgKe7Wg9qm+zrsK0i6BWSv1HA97lR
         d1bvConXwyI64fwwlHG8F0TdDZD1GC7Vhb5H95lm/PO59OUFpaKQTmuvNYpNP9JTcS8E
         B680778Qennk5oVFuZVfNAihC0Q2mS8q1s/DPxzPjTOaOwSdOkMeR9v2591CZZWO+9oH
         UAkg==
X-Forwarded-Encrypted: i=1; AKwUvBxC1mZP1g7M9kuANpF3fMjK1jHONUMh9YY2X5Bj73axBSwlVpiWVOyfan0y6pVi3NKZRDqJGcT9Z1g=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKSYSe1gqAoIwpwQ6kIfk9dfxH65Xza4n7WRX3dKXte873kmQJ5
	qfQ87ASlZlTwdCH/uEy0XtaCcOw4bbSFxYqnbGUmYz4s68ykDlWNLhuaaAA7b99wYg==
X-Gm-Gg: AYBFou3A+aChnY2pK2OueBjd382pgrXCKlU16B9/fSPALuNZ/sMqtTAD7M9lYgMJ70I
	ypYlRv2CSdgY6FsjT+Si+7kyMIArC7lQi/+c8iKnzQ7/NahXff6w48rQyawj09EzDh8KjEh9FF1
	xaxmgWnCvrOkSbzjvJIxn/csszByc28hEimnuisfx058kmeEAPe4yfGQaEvN5lbNePZX0EqUcal
	CKk4oAtjIZh9CcbQRkVKNwvZ4ZACfquB5Jk/Pn/h8R9jiVLtRoaaPAQC50k9qa2FyRm7tyRb/M5
	tTj8Ihol3qUagp0dFgEavocECbC1hkFKcKfY+h8dVtZylaibPE5fCBJO4s+SDUrkaW+LxsBTKpA
	5KXG/MDVyfrWubN6+xM9kioO3CUBpB3sOEZ76aeJZFp+LOFvQz20+DMasyrvYtUONoGnQNOvf16
	VUi1XLFUx/a/G5CLbom0uARYPoia67/wIapqPC7BOndaxuWFnZtOVcu0iyuWTWA98ZsW7+RaZbN
	M21acHH38aPXrm2OhikyHlbkbyOd8VesbmkJG4/UyXiGeSxo4Um7fnDfdT9+DXO
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr283175425e9.18.1791958885195;
        Tue, 13 Oct 2026 23:21:25 -0700 (PDT)
Message-ID: <a6a65b86-958f-434d-a070-e425990344df@suse.com>
Date: Wed, 14 Oct 2026 08:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: add "auto" to scan PCI only when the default
 base has no UART
To: Benjamin Leggett <benjamin@edera.io>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260922184316.324817-1-benjamin@edera.io>
 <20261009202447.852414-1-benjamin@edera.io>
 <236fed46-c64f-4bfc-86a5-2147ae34d5d9@suse.com> <87bj8xs54e.fsf@edera.io>
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
In-Reply-To: <87bj8xs54e.fsf@edera.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791958885-184CB9EA-3732733C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1925

On 13.10.2026 22:44, Benjamin Leggett wrote:
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 09.10.2026 22:24, Benjamin Leggett wrote:
>>> On some systems the console UART is at the legacy I/O port, and on
>>> others, such as Amazon EC2 bare metal instances, the only UART is on
>>> PCI. "com1=...,pci" finds the PCI UART, but it prefers any PCI serial
>>> device to the legacy port, so it is not correct on a system that has
>>> both. No option today says "use the legacy port, and scan PCI only if
>>> it has no UART". A deployment that boots one command line on many
>>> kinds of machine needs exactly that.
>>>
>>> Add "auto" as a value in the <io-base> position. With it, Xen probes
>>> the default base as usual. Only if check_existence() fails there does
>>> it scan PCI, as "pci" does. Without "auto", nothing changes.
>>
>> I've always been considering check_existence() as somewhat fragile (it's
>> not very difficult for it to yield a false positive, especially when
>> HAS_IOPORTS=n), which means that I'm not really convinced it can (reliably)
>> be used for the purpose here.
> 
> How do you feel about making the retval for check_existence() work like so:
> - 1: a UART answered the probe at io_base.
> - 0: the probe ran, and no UART answered.
> - -1: the function cannot probe this base, so it did not test it.
> 
> and returning the -1 in cases that would spuriously return 1 and be
> "false positives" today, so we don't try to probe something we
> shouldn't?
> 
> That at least covers the cases I can see, including the HAS_IOPORTS one.
> 
> e.g. `if auto && -1` -> we bail with "can't probe"

Makes sense, yet I wonder: Why did you raise the question here if 5 min
later you send a new version of the patch anyway?

And btw - that patch can't possibly be v1 anymore, yet it neither says
which version it is, nor what has changed from the earlier version.

Jan

