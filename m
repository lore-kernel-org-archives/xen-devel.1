Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F03C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 14:53:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395503.1633848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhfl-00046h-2Y; Wed, 19 Aug 2026 14:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395503.1633848; Wed, 19 Aug 2026 14:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhfk-00046a-Vw; Wed, 19 Aug 2026 14:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1395503;
 Wed, 19 Aug 2026 14:53:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwhfj-00046U-Vk
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 14:53:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwhfj-00GvnN-3W
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 16:53:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c363-2eae-0a2a0a5409dd-0a2a450cc6d2-28
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 16:53:43 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c376-f479-0a2a450c0019-d1558036a448-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 16:53:42 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4994c49f588so11651875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:53:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0d6721sm85565645e9.11.2026.08.19.07.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 07:53:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1787151222; x=1787756022; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbA6JXXyVmCBXLEtXdb1uu35/iM8yCB3kbwPdKt9X2M=;
        b=TTL/X4bjxmjCgivBS3YacY5vlMMmQxik2JZowcwDxqQVXpVJNPFowBMeS3KkfFdgC2
         B7T3i1dSN3mLI1UrEEXqUlN0Rhzr9EVE0XsWdOLUkGWoShoYJ85mfaOzmjl2d+Giuz8y
         z8cBoXp/K5qFp3zZt//0ciAB60RKo1/HlKyd/cBIYjADsaeDzHXRrF8h15UDQ7rT3QDq
         HFLzG6bNeA6NL0FlrWVLOVySPElvm09S0D141rMOuC4HYnLosuonuNna3oTpdBTbW6ao
         WNZQrL4L8cEmPGe4A1tGC6slGPb9DozoTFN3MmW5XENFfuRbCrg9DkQEWOscZiMcDbms
         RZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151222; x=1787756022;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbA6JXXyVmCBXLEtXdb1uu35/iM8yCB3kbwPdKt9X2M=;
        b=NWTdOBYimBL1Il4dYfI4/Y52Zy1+LnfN+9Bd157Quf+efYg+Tv4wZXiHtYwyUjFqi5
         Fj8GPldgFXduIwz5rbzQskvkgzs2xfsFFxVdVxqeEWCU0ifKog78aeWK8NzqHcPDdSoX
         if8znROWqThoYvkGWBp9Z7uTtzL2ep+sj17yQLY37slcasw/z0XPer24FIKwGV3LBpJ/
         5NnXG+2lULiQdsy2OMgAyZkxvmHpG6isd0XGqT9bonp9HZF8r5GSzIx9ae1bIqlpVegM
         Rl/UvGqU6c1VKOnleA7xMMcxJVYPvreIu4NT51CBvHcOCxZttdfKmDFQPSpe8RYkkAeD
         ZMHw==
X-Forwarded-Encrypted: i=1; AHgh+RpBMkNB4eN3RcJvBhN8HZpy/6qX+u/bRdNt89ZAyNqJfZGXFjKNSUvNnrmfct8RnDi2DMzDNwT3UPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu1fCbVWEJkqQAG52kYXhfqA5A0TCw7x6cFYBU0GzDQ9dvmOqf
	LeyLwYc84z4lJIPyByOPaAscx+p2ybEz+tEnNhKEvUFU/ezLEA6iO6xaWELIQ8UUgQ==
X-Gm-Gg: AR+sD11byHoMUr30oY0KG2Pu+hdKRVPHeVsYanBZ5Kp+OifXDRnT7ioXoOmrnYQwLpx
	jfwyM8jtt4m7s2K9pf0C2yIYcht0mLH1ehQwKTF26vshZixSosFpoez1y5jX4H1nRrHmrN2X6EH
	Bq4swnwMyPZz3lxH2Nb4tezzgYNex06KSJrqggNItKMhWVECZsWUtWqz7N7GYHKGl+k1/2jOir5
	3NjtbHCAt+iKUvH2SZoduNlGW/R3hNFqWwEEBmet5xh0jWjdvWFYxg4LXAhSyztEdFlnleuWDIa
	uy5R5G1glcbiBn5Z043aKL3LIRWa5iWHZjUuzeDY7ahgFAKNGN5qyGoKbOYwm50BqEgkKWxlZR4
	NkNVmjdrd4nZUkr59YRCFtGRHFn/yC+/8Hj/DXpGMHLilkS2oGnN9vBmJ6x4XvYa55d0SwBbgZN
	GucRGf8+ZRpT6H/ref77gbRft20SGaAaIFL9dR7xPcoZddIL6U6k0cgjoL/dAThr1r6CWuvIR8q
	0MSHY8WPGkYmtodei0e0kky6SdDiN2/OpUnvFfKMa9HpwjMQJzJ
X-Received: by 2002:a05:600c:3f10:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499aa0f306fmr99397055e9.6.1787151222437;
        Wed, 19 Aug 2026 07:53:42 -0700 (PDT)
Message-ID: <90d8da75-3d95-4cb2-944c-24e11b0e215a@suse.com>
Date: Wed, 19 Aug 2026 16:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Remove MICROCODE_UPDATE_TIMEOUT and associated
 panic()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260818130738.1911850-1-andrew.cooper3@citrix.com>
 <5fa222d8-af04-4b1a-a457-ee5004ace484@suse.com>
 <65789d8b-d18f-4f1c-8ffc-e1247daa4031@citrix.com>
 <ffe6c2b0-ec82-40e6-9bf5-fd49a3ef3a43@suse.com>
 <1200071f-122a-4dc0-aa08-7a7e2f1a6587@citrix.com>
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
In-Reply-To: <1200071f-122a-4dc0-aa08-7a7e2f1a6587@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1787151222-772D8A5B-935D17E2/0/0
X-purgate-type: clean
X-purgate-size: 885

On 19.08.2026 16:04, Andrew Cooper wrote:
> One other idea I had:
> 
> If we rearrange the loop to have a periodic "taken $X seconds" (shows
> liveness), and maybe at 40s decide to panic (by passing through the out:
> label first so we release the APs, so they can crash more cleanly), then
> that might be acceptable.
> 
> By 40s, the system isn't surviving even if the cores do all come back.

Maybe, yet I'm curious: How did you land at 40s as the "magic" boundary?
For a runtime load, even the 4.5s that you say GNR takes may already be
too much for the system (Dom0 and/or DomU-s) to properly survive as a
whole, depending on their requirements and/or configuration. Even our
time calibration rendezvous wants to occur once a second (albeit it may
not really need to run that often, plus iirc you have been saying that
we should get rid of it altogether).

Jan

