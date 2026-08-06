Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219EC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 06:57:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384249.1627264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrs2h-00045Z-0h; Thu, 06 Aug 2026 06:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384249.1627264; Thu, 06 Aug 2026 06:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrs2g-00045R-Tk; Thu, 06 Aug 2026 06:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1384249;
 Thu, 06 Aug 2026 06:57:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrs2f-00044G-CS
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 06:57:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrs2d-006mfY-Ot
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 08:57:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a74304e-5cb7-0a2a0a5109dd-0a2a4505e1c2-24
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 08:57:23 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a743052-4cb1-0a2a45050019-d155dd2fdd8e-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 08:57:23 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso1117281f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 23:57:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff7b1809csm3173036f8f.18.2026.08.05.23.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 23:57:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1785999442; x=1786604242; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xl4BRyTVRm2AXv14x5ldoaieV1jo7UO/WRkwMTRXvk=;
        b=WnskGpLCh7TobAX64mgB9lCYOC4IjYZfhTdt7wtFYvfOKxIRKHQzdh36Q0hl78d5wD
         yjoh9+qBSLye9VbZQhlRFw8XmNPQZgTNVp5nQUUjymPNfVHVmYI3JDGw30W67bhtTzyM
         uDYt5lKKfbbo+K7cghwynkUmQyNgpNHSF/O3EmMffRx3Ytr6ujnHjHHcgaECi8c2v5cx
         GgP6/+rI12XZcYA5jqFqDuTvomBDvjDj8dEGxFiQvNIyv+OMZ5lRvGgs8xbnj15G3xfL
         slbGtA0QGVdW+8PK+GRB3I8ROru+i+evKX7UMhbV1GNB09d8sGUo62J+5HkqoEwi19xj
         JrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999442; x=1786604242;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xl4BRyTVRm2AXv14x5ldoaieV1jo7UO/WRkwMTRXvk=;
        b=kTr/gwgWsndnG2dRxJuVwSRN53deW/lWe58IkykX84dIrka36tNHaoDXriVVIqW/vv
         MMwwFRIbBsmsn+SV74YO6Q8evMZs4kJ2ogeIqg+EVh1Ms796Khji8o0Jpc9aDYmN667S
         IYtVX+ZPzKzJmdCO6XAGIEz2Rp0xBZzhzFYaTzH8WrGIQFrHsIwzt4OBO7epq0JrVtST
         x99qkHVZ58puPUo+fPB6m4nnRXbHmfN8qwujbMMeQMkDec8eJIDpckZ6wn1/eBvHPgnY
         KqZK/h91Qoe7Iiheoc/8tqFaZbS/R5paCpyM9a9X+wM13TzD4kzFY3oVQmhp651+WnIY
         Gesw==
X-Forwarded-Encrypted: i=1; AHgh+RrzBfbEs5qORfjEx2BrfwpS4d3llfbP0+u97I6t98wCp/lMMOg78lj3u9EFQh0n+av6nEx8OKZQycI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7gatpJFXNDQtzG+iQyY1ejO8dQkwcfmbKgevJwR1cyCkzgqEm
	kpWiv7yCPnmjvpoTGdTyJgxlNt3StmEvZ8AJqjaRSDMy9z96s2ehhDinwz8hGBZFbY893Wt3wfh
	/Vp1jxA==
X-Gm-Gg: AR+sD10rikYar2HuUa8Hp+aOTHei/ZipZFaJCStxz9jk3H7tG8PLcAkQyVIa/xOqNpP
	BIqBV9x4nALSmBcMXqfKrhjOX9G9kIZMYFcYNY/JizpSkKIztGrSz6OWEzdigIjOsBZIAHYAFtE
	tKmu4iH/U4lCz/KDBi5kMPCDN9NWe8vluPpwKyDeuFg0kg8FFj/rx6WxFZvnpqtiEvbgOlj9fj8
	BUirUJ0FwzsRABIbnhopklqK5xJQcdeAssMO9QGcwceOu9h7baxMso1ECtH/5sd4vO4Okf7kZVc
	L0JND2hpqrqwnZoIyYVNiiTRtPLgFDFnUsRXRVzJCPLqCTeAcbolpHUKNefkeRoCq0lV30FKbRP
	aEPfHwdwNs7oyMHQOe0M+yK9/oMcjfQAoCr1SR5iL9YPVboqyw+9q6D++ksFjUqn+ByvnNlT156
	uZskM/tikzEc2CYqjmNLVsTf8StAi6ckntx4n4y423tnr7mKCtj4AM55yw2wy+qWl4Rp4GmZFZL
	Cd6KsI2q8C2TkhVA7hQhIRThjmIxFZuddfnaD4ZJpjnY7fjnm+92eZYrKCywwQ=
X-Received: by 2002:a5d:62c5:0:b0:47f:8fb6:c32f with SMTP id ffacd0b85a97d-47fec52a71cmr15377387f8f.24.1785999442600;
        Wed, 05 Aug 2026 23:57:22 -0700 (PDT)
Message-ID: <0b38417e-2c59-4df1-8429-ec7c98ce22d6@suse.com>
Date: Thu, 6 Aug 2026 08:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/nmi: Don't configure EvtSel repeatedly
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-6-andrew.cooper3@citrix.com>
 <d76fa0a2-1a53-4ee4-b077-d51715dba339@suse.com>
 <da3b4ee8-7c12-4fec-8d31-6f2f66bba4a8@citrix.com>
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
In-Reply-To: <da3b4ee8-7c12-4fec-8d31-6f2f66bba4a8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785999443-24F1F2A1-F266D2C3/0/0
X-purgate-type: clean
X-purgate-size: 1155

On 05.08.2026 17:37, Andrew Cooper wrote:
> On 05/08/2026 3:20 pm, Jan Beulich wrote:
>> On 05.08.2026 14:45, Andrew Cooper wrote:
>>> In both setup_{k7,p6}_watchdog(), EvtSel0 is first zeroed, then written with
>>> everything but the enable bit, then written with the enable bit.
>>>
>>> setup_p4_watchdog() is slightly more complicated, owing to what
>>> appears to be a bug introduced by commit 2a2bd8de16b6 ("Clean up NMI
>>> watchdog handler."), which causes a second bit to be temporarily
>>> different too.
>>>
>>> The middle of the three writes is useless in all cases.  Drop it.
>> Spotting the 1st write in setup_p4_watchdog() wasn't quite as easy, as
>> MSR_P4_BPU_CCCR0 (as passed to clear_msr_range()) has nothing to do with
>> MSR_P4_IQ_CCCR0. Using unrelated MSR names there is as unhelpful as using
>> raw hex numbers.
> 
> Perf counters on the P4 are utterly insane, but our local logic really
> doesn't help matters.
> 
> Another option would be to remove P4 watchdog support, in the basis that
> we really can't test it.

Well, my Tulsa system is still alive, and the watchdog looks to be working
there.

Jan

