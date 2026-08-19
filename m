Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC5C5DF87
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 11:57:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395254.1633730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweuc-0000GN-32; Wed, 19 Aug 2026 11:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395254.1633730; Wed, 19 Aug 2026 11:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wweub-0000GG-W4; Wed, 19 Aug 2026 11:56:53 +0000
Received: by outflank-mailman (input) for mailman id 1395254;
 Wed, 19 Aug 2026 11:56:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wweua-0000GA-L5
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 11:56:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wweuZ-005lv0-Kl
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:56:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859a01-8faa-0a2a0a5109dd-0a2a4506ac36-14
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:56:51 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859a03-195a-0a2a45060019-d1558031a563-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 13:56:51 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495437bb891so7178095e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 04:56:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e00bddsm46885735e9.3.2026.08.19.04.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 04:56:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1787140611; x=1787745411; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2yy6x6x0Ym69OtS8ZIaQs5CFIZaL3dzU++UsgVAeBE=;
        b=bWimoQEJBKOY36sN244gpKAQKVX/lS3Vjfb7xCQG1F9zfDNvoFKRg2XsokSnyup6hQ
         ERty8Py0oIGadU/FRIAPmU9Ft21B1qC4AJaPb4cl4bSqiOxa+D2tNTomKQgT8y6mwxkL
         Oi87ps443TaAaKypyXrsy6AFAxkCfgpRSDNdbdNOLkv+o+zDP9cvVplRZg583enR+CEw
         o+rERSuyFMD2e2cRRkt/ByVLGxSVUwoyHJCODL/21IKgHlgy8f3snaUdMQRutMo35/yI
         R2wT8MAVaQxBMzh9ETxCFBkyuxZkok0STVYjNB3iNiH9PfBGA6JjJom+XcuDdMhymyek
         2R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140611; x=1787745411;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2yy6x6x0Ym69OtS8ZIaQs5CFIZaL3dzU++UsgVAeBE=;
        b=l8DxFaj67mMUrUzkbk/hhJHS9KmradunlvALaZhuB5uxglw17N4hyLyEYoKEHE1rxC
         puijeQmM3DuNDuk4mKIV5+N/wRPCSUyxkE+Ikdy2saDbNYuQOz5LLPEMi5UU6Rwxq/bM
         26tfufN+tBUCWnaZskU5IrqCtLP/ViYeWVy8rgUjeRaOlC7Y1FRiwDhMv3tN4GRiHhDx
         oozIQfLalyosqpIYEEnKGjaoj18aispcjYPeBCxNNWiJKv/TDO1JWxTgqfZ2RFggeYrt
         QbaDXIMhpUOSR0jbrhhyJcLGM7QfybMtJKQj0G0w6b9R0UuTBFabki44Tx28AD65/ftC
         bocg==
X-Forwarded-Encrypted: i=1; AHgh+RqFT2Rsp4eu6xAry72CQl+F+feI4WckHk8w+5eWisxnO+aULCex+I5MQ8Iu5X+/zL2blXsh77yKUr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjYcL8CgpVOO4PfcGdBokyL0x4xWP5NmpuuuOsd0FI29sU3e91
	sL6sljyKxaX3ap9LxgSpehs7lxbKKF1zZKgbUxi53rCW0BumbKliEkVDeuav5MAWgA==
X-Gm-Gg: AR+sD11W6ipALNhYna9yGJxk0AIMT3smDxzoP0F8WG0Yj2c/Utm00jbMIefWGFX9BDP
	FYwmqTMa9ofWyR+qozdB0vLnirQs0XbCvrrLLsLbS5fxVY5A7y7uQ0Z9ieB/QJ6NRbrchoV8Ouq
	1YZhhrM7I62PBYOlb4qh5i9GSEKaOioqERAf4BgCky3XzJWL0YOHLgylEVsR/DqG7ed+XLB1B2u
	c9rpGSDIHYhhNc3861uAi1qIowwzFo44rBRCbFXdzPzhQM0cePeeYu4ZsKjMhYJvp8C9qo1zDb+
	pcuK0NhbI6TpKbqJLbxICiNj/xPI7OwWcTeuXgQSy0d7ONUrjaJQRR1Rljs6lTGiJXt02iXKgLe
	e3lGmvLsJOft1fr3CdAcjoWcwiIwuObRwg4KRcQngogM9/E4LKzBUx8X39JaAM53WYxwzsHls/i
	CpIDEhWNKg8lTdlgpZEt3uP9acU5jC+uaulMepRJ8GuTlzsJprsZ/pFS7aMvkKFEVM6BbkjzwEJ
	pXq4MsBHk2Pdk64T2r6abV47a3Cy0aEQo4/TTcPRbN/0EJklD2tUaOlfyFgAzM=
X-Received: by 2002:a05:600c:19c7:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-499aa0e7cfcmr53081745e9.3.1787140610877;
        Wed, 19 Aug 2026 04:56:50 -0700 (PDT)
Message-ID: <ffe6c2b0-ec82-40e6-9bf5-fd49a3ef3a43@suse.com>
Date: Wed, 19 Aug 2026 13:56:49 +0200
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
In-Reply-To: <65789d8b-d18f-4f1c-8ffc-e1247daa4031@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787140611-F440377B-DA05CDEC/0/0
X-purgate-type: clean
X-purgate-size: 2912

On 19.08.2026 13:13, Andrew Cooper wrote:
> On 18/08/2026 3:31 pm, Jan Beulich wrote:
>> On 18.08.2026 15:07, Andrew Cooper wrote:
>>> Panicing in the case of a timeout turns out to be about the worst possible
>>> action Xen can take.  It leaves all other APs waiting on the condition
>>> variable, some in NMI context.  As a result, they fail to be shot down and
>>> dump state for kexec crash analysis.
>> At the same time there likely isn't much to be learned from a kexec dump, as
>> the source of the issue is in the CPU, not in Xen.
> 
> The single most valuable print message I've ever added to Xen is the one
> which reports which CPUs didn't respond to NMIs.  Up until now, it has
> always highlighted hardware issues.
> 
> Despite my wish to remove this panic specifically, there is still
> information to be gained from kexec in a similar scenario.

That is you think of a system without console, where those log messages would
only be possible to fish out of the dump. Fair enough.

>> Further, this code runs with the watchdog disabled. If there's truly no
>> progress anymore, how would one know from the outside whether the system is
>> dead altogether vs the control CPU still kicking around?
> 
> The scenario you describe can only occur if the BSP accepts the
> microcode successfully, and one of the APs locks up properly.
> 
> If the BSP locks up, we never get as far as deciding to panic(), and the
> system hangs already.
> 
> If we have a bad microcode, it is far more likely for the BSP to hang
> than for the BSP to work one of the APs hang.

Hmm, probably. (I'm always having in mind the one old system I have where only
the primary cores on each socket get ucode updated by firmware, with secondary
cores needing us to deal with them.) Still somewhat hesitantly:
Acked-by: Jan Beulich <jbeulich@suse.com>

>>> Microcode Loading on Granite Rapids takes about 4.5s of wallclock time, far in
>>> excess of the of the arbitrary 1s Xen allows.  This time is spent in the WRMSR
>>> to load the blob, and there's nothing the system can do but to sit and wait.
>>> Despite the delay, the system as a whole does survive.
>> For this I wonder whether the log message issues after 1 sec is adequate. If
>> we know things can take this long, wouldn't we better issue the log message
>> no earlier than, say, 5s * nr_sockets?
> 
> I have some work there not submitted yet, which would periodically print
> a message.  That at least gives you slight signs of life.
> 
> But nothing involving nr_sockets.  It's far more often wrong than it is
> right, and that's not how our algorithm scales.
> 
> GNR has gone from milliseconds to 4.5s.  Putting the limit at 5s is just
> going to need another change in a year or two.

That's one possibility, yes. The other is that they realize that they have to
bring processing time back down.

Jan

