Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8239BC5DF82
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 07:52:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396014.1634101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwxZ5-0000eu-7G; Thu, 20 Aug 2026 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396014.1634101; Thu, 20 Aug 2026 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwxZ5-0000en-4i; Thu, 20 Aug 2026 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1396014;
 Thu, 20 Aug 2026 07:51:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwxZ4-0000eh-IZ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 07:51:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwxZ3-0088Xc-Uv
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 09:51:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86b20a-8faa-0a2a0a5109dd-0a2a4502a5ae-44
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 09:51:53 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86b219-6ca4-0a2a45020019-d1558030b063-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 09:51:53 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-499b02fc590so6701995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 00:51:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b20a14c6sm32137555e9.0.2026.08.20.00.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 00:51:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1787212313; x=1787817113; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhBK6YnNsECh8KigWIjCiZjoLxt1fp8hP0W1MkIlNMA=;
        b=LGD49Ojb9wPgdoynv1LxMjddwRNNWqsq7dK5MkyGt9NlBYQLa7Rp/VnwjjF+P1IAfz
         Yw4Q/k1+119j6Kri8cYPy0i0DshUmxMD5ERn3IPfD1tEXsoTj338k0ytBrrqf/n3eTCs
         3H8DmXs/YVXdYWS2QU6eCp7Jg8jzrwNkBMQ4/rWoEBh1o/fbzbr/0uNVwQjnNl3C5yRt
         bAlPvo92kb78EOGk2HYIFDtZ09+YflLplu7dbPkKmcd7+H4gui9JcvQig2CjH4BDQ4lq
         FD+CJ6alnnyTA0QliJDp0utWoBBOFTB4VlYXBIdBLJvh6g7UZfn/M24XGxFwDB8jsXO8
         xC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212313; x=1787817113;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhBK6YnNsECh8KigWIjCiZjoLxt1fp8hP0W1MkIlNMA=;
        b=A5+P6Jc/+JB3np9o4DK1zORRs+wWc3/O3TrDCZcBLhoByK+U4wp3GGoDF6ADgc1xlA
         iXYLNAcc50x2vn7Z7LS9O6p4JblZ4drxalMgv80w33d2Avy6N9NJw/vTNmm/aGiKzSKT
         Kkuw8qmOGopzwYbAgrlFCpXQUX6GUrK53SmHNQmb76MW3ui4EjymeySsFzeu+r65Uqms
         OhPsVg70pGjvHraFr0zalT2bKS7AykP2nGxmWspcrd7bIGDFf3uw4IEfEdXHlFbXklqB
         q5/ioeFdcsVSi5IdV+s/xc0/xQiUDcrFIf7Sl5ZoYTLiSPeCh3Il2oyhk+8mcjdq3yXb
         VcRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqfKxGWGEuwVJEqCgx/B4icszIsOUcaFjnQ3rss69kg5wJRTTsZ3KrgVWwJX71a8Wcqr5F5yiYlco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiBRPKI8pNeeUB6BkNjAxaL34Z8UzoX2cNtRPFaX4G18fxZRp+
	9ndT54PGrwI9Ao0yId5PelMNGRueE7m2hSl6yFiL0yCnYS44su46OT636DQOIqovRg==
X-Gm-Gg: AR+sD10WgQjcVgU2569ZpRtQNWFnxIstmaNVrGNqRWD2y8+YJ8GrdlfVbgkMKormcji
	GNgMctHh7fyWY5UODdFjL6KWq+O+PPYkMeCFUms98JfUxFG4tozaTBYiE3MCGTYdXS2LR3dmNgN
	FMm0/DJLNOHAK6JNYe+zCv1T/8Ze6NV12sXMLfbNwdwYWLjK58yEinHSmVRN4+aoF5t2hc1H9ZF
	HHFNP9vBk1NW4jOhOvEOXGXCT5NJB9AFbqc8b3q5FQ2ibuPbiBBBOXAJN9kfQdU1BUy7LCkgBmv
	dEIx19vwuZHb9ZFixpWl7vi2NURB1M/3cc2v/1Rut6cG5JVKpSZRhrEN7Tr9Xc0NlRtUiuhR9Gj
	VWJ83zt/yIstNorPr+ejzanEQ43Zq6u2P/fgtuGCitO1bhNcrH6OKjawg5kgb7xbKAeqsaNnPXt
	dF1T0MN7IUBQur6y3Ck7OH39pkoDkKoVvGmHEeN/iqhzQQieiSM4NRx9dfOfNeZCs+AnJkrtpu+
	8rP4OXRHIfLBOTqhqx506nTQBls+0trTUSK0a39yqVqnvQHmuqw
X-Received: by 2002:a05:600c:a012:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499aa1431a5mr203011985e9.1.1787212313335;
        Thu, 20 Aug 2026 00:51:53 -0700 (PDT)
Message-ID: <92022f85-9a53-4db8-b489-fc91c86b413c@suse.com>
Date: Thu, 20 Aug 2026 09:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
 <d6e603bf-8dc5-4ac7-842f-ff9d1f67b98f@suse.com>
 <fdec0b6b-eddf-4a36-a755-c67963daa9ea@aol.com>
 <6ecf80ef-2f0e-44fb-beab-dbcf065a4431@suse.com>
 <bb44067c-6739-4e83-a0fd-cc7ea797048f@aol.com>
 <4c58bda6-e9ed-438d-b96e-feda74a6c4c7@suse.com>
 <31a5870f-2a4d-4dc0-af9c-f0567e0f6fb3@aol.com>
 <db8fd04d-bbc7-41c7-8473-b821d7f77d5f@aol.com>
 <302ed12f-40ca-405c-80ca-ac4f2785d754@suse.com>
 <cdae1785-4d9a-4aab-929e-de55c26b7b94@aol.com>
 <10cd9f6b-678b-407b-a51e-70e9ed7a35fd@aol.com>
 <131b1252-b108-4b4c-8457-673ff0d20d5e@suse.com>
 <b14969c8-9676-404e-b7cc-ce13a6d7ff94@aol.com>
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
In-Reply-To: <b14969c8-9676-404e-b7cc-ce13a6d7ff94@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787212313-672B12AC-5EACF022/0/0
X-purgate-type: clean
X-purgate-size: 2208

On 19.08.2026 19:13, Chuck Zmudzinski wrote:
> On 8/19/2026 9:51 AM, Jan Beulich wrote:
>> On 19.08.2026 14:36, Chuck Zmudzinski wrote:
>>> On 8/19/2026 8:16 AM, Chuck Zmudzinski wrote:
>>>> Yes, I agree that v3 of the patch to hvmloader should presume that the DM can get
>>>> a copy of the OpRegion and read its contents so most of this can be done in the
>>>> DM instead of in hvmloader. So from hvmloader's perspective, the patch will be more
>>>> about avoiding the layering violation than anything else.
>>>
>>> However, there is one advantage, from the viewpoint of the Xen virtualization platform
>>> as a whole, to do the patching of the OpRegion in hvmloader instead of in the DM.
>>>
>>> If we patch the OpRegion in hvmloader as v2 of this patch does, we provide a common
>>> solution for extended VBT support for Intel IGD devices that would be compatible with
>>> all DM implementations, not just with Qemu. So why not do the patching of the OpRegion
>>> in hvmloader?
>>
>> As indicated before: If the OpRegion holds data that is needed to drive the
>> device, and if the OpRegion is exposed writable to guests, then guest can
>> screw up that data such that subsequent guests won't work anymore. Hence
>> exposing to guests (which includes hvmloader) needs to be stopped, or at
>> least be limited to r/o. That, in fact, includes exposing to any privilege-
>> restricted DM as well.
>>
>> Exposing r/o may be entirely okay (i.e. may not be a layering violation),
>> depending how exactly an OpRegion surfaces for a device (on the host). Aiui
>> it's not addressed by any of the BARs, yet it looks like it needs similar
>> treatment.
> 
> Yes, the OpRegion is not one of the BARs as specified by the PCI specs, but
> it functions more or less like a BAR region with the devices's ASLS register
> at offset 0xfc in the PCI device config space of the device acting like the
> BAR for that region.

That is, on real hardware a write to that register moves the OpRegion? That
would need following by the DM then, i.e. the DM would need to indicate the
original position in the register, and the guest (incl hvmloader) would
then be free to relocate it.

Jan

