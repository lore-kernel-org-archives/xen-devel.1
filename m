Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7AC4361B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 22:35:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8D423B85
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 22:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D8D423B85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48802.86321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn82q-0003V5-Ct; Wed, 09 Dec 2020 22:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48802.86321; Wed, 09 Dec 2020 22:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn82q-0003Uy-9n; Wed, 09 Dec 2020 22:34:48 +0000
Received: by outflank-mailman (input) for mailman id 48802;
 Wed, 09 Dec 2020 22:34:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmJG=FN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kn82p-0003Ut-1B
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 22:34:47 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 821a30fc-9ff7-4d9f-b428-bdd89e8694ed;
 Wed, 09 Dec 2020 22:34:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h19so5318952lfc.12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Dec 2020 14:34:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b29sm305007lfc.12.2020.12.09.14.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 14:34:43 -0800 (PST)
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
X-Inumbo-ID: 821a30fc-9ff7-4d9f-b428-bdd89e8694ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6vOSNl6ZN+cRD4S79xLYqwO2xUi/L6Es4MdZ96t33CI=;
        b=rrxUX6eU2HV56LbQJ7QzxF22bmupZKBe1FHTZGW2k5Rs/emO+Dy3tv2h/mby6fZkZg
         y3FskzidsQAOrQ9d/1KP8u+fI925wAJCAqCeMlwCjkPWZ5xcV/QhnyWk8LXfcgYcUPPC
         adm8+NkXTeuBjqnHhRTpAOdw/vaedU5QyP3j5GWKZSuPG3g4yDKY7ifLv+LzLjPn86/i
         K/SfSB7vWok2LEnFaUuLMnsn64DKqDOdobhXjvHpyLLMS5tU8YIkXwjwLDHdUB9Ab+7C
         Hl6yXWH9ckxrBrBHkxieuHnrEZodQ8T2KfAqDamBpHoomey8FBVH/B3HtTVfd0tr6mdN
         Pqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6vOSNl6ZN+cRD4S79xLYqwO2xUi/L6Es4MdZ96t33CI=;
        b=iOuFUBFZ86R52r3yYdHHu+oXvN6ukL/yOdC7CekcSVCiCXlKv24O3u745kxoqfdwHc
         G1zx/blnOucA3yKko5M0XBOe+7LbBH5lcovDJ+RtBETuhFPN/5yKPY/D8a79eW+PcqrW
         E0DhMJzl+v0hiDvvv+jWXmeG/8rhOacPOGDhw9yI1XINXE/cqvgpN5d+LhW3fgTsHAM9
         FNF9XnvchU+d3/A9eCv7vX+nbQzdRjkelwuRDEPw/50DnJuvzMKusmvMq5jlZ/lULzDN
         WvsKK9o+vgMk23SgJl31CQZoF/jWiIoDHitTmUcAu8I347+MZNxPPSKEjims6t1iZH/w
         Fzyw==
X-Gm-Message-State: AOAM530zKZbfo3ZTVuhS0J5dd1d9w6A5g+Vxk42BvaRn4vQoC8ChQEho
	KbBP/QfRhLGn9kWNKVPWjoU=
X-Google-Smtp-Source: ABdhPJwxY8mp53k+b6uPi3cJo7z72H97Mv0vFDIwbSnJYKNFecXHJvQKXRSYP/5qfEoIKLyq0jJGQA==
X-Received: by 2002:a05:6512:34d3:: with SMTP id w19mr1687874lfr.180.1607553284483;
        Wed, 09 Dec 2020 14:34:44 -0800 (PST)
Subject: Re: [PATCH V3 13/23] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-14-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091329480.20986@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e9ba97b2-01e4-f657-fceb-ccf4857e91c2@gmail.com>
Date: Thu, 10 Dec 2020 00:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091329480.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 09.12.20 23:32, Stefano Stabellini wrote:

Hi Stefano

> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The cmpxchg() in ioreq_send_buffered() operates on memory shared
>> with the emulator domain (and the target domain if the legacy
>> interface is used).
>>
>> In order to be on the safe side we need to switch
>> to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
>>
>> As there is no plan to support the legacy interface on Arm,
>> we will have a page to be mapped in a single domain at the time,
>> so we can use s->emulator in guest_cmpxchg64() safely.
>>
>> Thankfully the only user of the legacy interface is x86 so far
>> and there is not concern regarding the atomics operations.
>>
>> Please note, that the legacy interface *must* not be used on Arm
>> without revisiting the code.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - new patch
>>
>> Changes V1 -> V2:
>>     - move earlier to avoid breaking arm32 compilation
>>     - add an explanation to commit description and hvm_allow_set_param()
>>     - pass s->emulator
>>
>> Changes V2 -> V3:
>>     - update patch description
>> ---
>> ---
>>   xen/arch/arm/hvm.c | 4 ++++
>>   xen/common/ioreq.c | 3 ++-
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
>> index 8951b34..9694e5a 100644
>> --- a/xen/arch/arm/hvm.c
>> +++ b/xen/arch/arm/hvm.c
>> @@ -31,6 +31,10 @@
>>   
>>   #include <asm/hypercall.h>
>>   
>> +/*
>> + * The legacy interface (which involves magic IOREQ pages) *must* not be used
>> + * without revisiting the code.
>> + */
> This is a NIT, but I'd prefer if you moved the comment a few lines
> below, maybe just before the existing comment starting with "The
> following parameters".
>
> The reason is that as it is now it is not clear which set_params
> interfaces should not be used without revisiting the code.
OK, but maybe this comment wants dropping at all? It was actual when the 
legacy interface was the part of the common code (V2). Now the legacy 
interface is
x86 specific so I am not sure this comment should be here.


>
> With that:
>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you


-- 
Regards,

Oleksandr Tyshchenko


