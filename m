Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A3C88E75
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 06:18:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424713.1648969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7RvX-0007jA-Mo; Fri, 18 Sep 2026 06:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424713.1648969; Fri, 18 Sep 2026 06:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7RvX-0007j3-KF; Fri, 18 Sep 2026 06:18:27 +0000
Received: by outflank-mailman (input) for mailman id 1424713;
 Fri, 18 Sep 2026 06:18:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7RvX-0007iv-1d
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 06:18:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7RvW-004vmg-Ee
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:18:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aacd7ac-e002-0a2a0a5209dd-0a2a450bbaa2-22
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:18:26 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aacd7b2-b7e8-0a2a450b0019-4a7de14ca80e-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:18:26 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so130378f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 23:18:26 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4872008023dsm1453197f8f.29.2026.09.17.23.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 23:18:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789712306; x=1790317106; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDrM1rXJY+2LuSqMSQqcwWYWAtN2395aCP/SrQLth64=;
        b=bIOXczzMVyMnDelAj1+2l10zgsAh81zSnCKKJ2GbsQB6fO/fct8lw5t9EclLINfhbf
         4bVYeh4kWlNYFvmzYUBF7luoiZfrUGQ6WWrHWMCjHRD/6xrhRIXkbbQAdgkIxOCcmgCF
         YcwkCEwNi2BWM56HBFfcWhHDbCPflRQN9MDJtD5dHC3DnAtWNZF5jE1b//PuSWiWoiTz
         TbR3bpmTDLM+dI9gSi5gwHzEFvaGKrziHLb0SpaQ09T2OUEzh53h8VwAnOSyeF9IDKGy
         6mQi7dRd1byVYbUbXKK+LJyJrfD30qXLjrmIzgacx3tky9k45AaBKkvyGjVFL7iReLY+
         BGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712306; x=1790317106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDrM1rXJY+2LuSqMSQqcwWYWAtN2395aCP/SrQLth64=;
        b=LrxYdAYvcJ/8fzRcyQV+DETtkOOcqCZlN//HsqMEFoRyCeZ45bao9oUqmaShrUOskb
         0j3Rh3BJmJgm6E5ZSijakPDDfmvMrI1QDH7tBFAGQvtK7GKdhIeUXIhIMjn8SiTvzqlu
         JCfeI38X5aSTxeu7h7dfxI6Yc8gYNTCzw2mzJhwFbDFQoJWP5Z06XONsZW++tO5K6Sli
         UONoELBD7LkuMB1RJ62AUvodivP92GCeRhRJ2ELLJRILVx6VrtTCkWMBvU3UqGkG/OWw
         4iZTaSMfcrCEWPLUdwNrpNT7fZrngSamswqKdR9VgQcXlQzB7TFgYmDhDXOGkj+FvziC
         PAlQ==
X-Gm-Message-State: AFuF++mLJfMJ/rQmbL6SDqr5PtWWOI3c8vn/1huSD/MCdmmK1QqxAaHL
	zGbYJQFMs94f1VGgOct0cG1wX1d6OOO8DBF0sb5BGsdHoY9P2SvEA5cS5T/4ePwdwJGj7k11UCZ
	Dm0o=
X-Gm-Gg: AYBFou2Lqmf/fJKUXXpV8U6IeK/cLoEEjZx44U3N0Kv0B2yiKRL7bRneWvlczuMoaXY
	AESIZsIKC6/9cor/Myw1mbGFTKtd54/p3bSMDyLlMlBw8ki1y99PvlrVIcm201bra7XHlYVzO/D
	9VjKrC8Ixh6upZtVXm8RlTZFKJxn5VpxyRpi8GUzjWjT+e4XJEiU0pe5ZT+v93QiNNIpSB8IdV4
	FHZjbIh+yFeJLNbKJWmJFb0aqOFj1H/kzsF2JlVxXWihfbugR/ZjSeoYkLYVk6FDu0aLEwpnzc3
	RRMa44JzySaDaGx7NC/l9uC/kGH2cSn2zGH/vcPc4/OEkezrPr1Xh+uN5n86+mQn4V1XkVLWPtb
	7SjxO6oAqpuOJ0CC12wq4xVb4IiWNbVKu+oPYzNVAnD4lG1zTjS0vMZPavauiaHz0UFh9w6Bqxz
	h4a3IyCc0YoOhz5yfwUyLfjQ2aW/8qNIqbWENe/b1RM53kA+wIFRegI5xlxePpkSiFXJzOV07Tp
	sw=
X-Received: by 2002:a05:6000:2312:b0:486:f6dc:52c8 with SMTP id ffacd0b85a97d-4871e269e92mr1606354f8f.37.1789712305874;
        Thu, 17 Sep 2026 23:18:25 -0700 (PDT)
Message-ID: <35ee5c25-bf5d-4443-aa33-f71c8eefe526@suse.com>
Date: Fri, 18 Sep 2026 08:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] EFI: avoid OOB config file reads
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <dunlapg@umich.edu>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
 <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
 <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
 <64821a66-6726-449e-b1f4-2d8750e99f95@suse.com>
Content-Language: en-US
In-Reply-To: <64821a66-6726-449e-b1f4-2d8750e99f95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789712306-A98C19EA-140384A8/0/0
X-purgate-type: clean
X-purgate-size: 1449

On 16.09.2026 17:05, Jan Beulich wrote:
> On 16.09.2026 16:37, George Dunlap wrote:
>> On Wed, Mar 25, 2026 at 2:24 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> @@ -878,6 +882,23 @@ static bool __init read_section(const EF
>>>
>>>      file->ptr = ptr;
>>>
>>> +    /* For cfg file, if necessary allocate space to put an extra NUL there. */
>>> +    if ( file == &cfg && file->size && !iscntrl(file->str[file->size - 1]) )
>>> +    {
>>> +        EFI_PHYSICAL_ADDRESS addr;
>>> +        EFI_STATUS ret = efi_bs->AllocatePages(AllocateMaxAddress,
>>> +                                               EfiLoaderData,
>>> +                                               PFN_UP(file->size + 1), &addr);
>>
>> efiapi.h lists the Memory parameter as OUT, but that seems to be a
>> mistake; the UEFI spec [1] says this is IN OUT; and the other two
>> callers of AllocatePages in Xen initialize the value before passing it
>> in.  So we should probably fix both efiapi.h, and initialize this to
>> an appropriate value, rather than passing in stack rubble.
> 
> Oh, yes, we definitely need to init the variable. I'm less certain about
> efiapi.h, though, as that's an imported header. We'd need to check
> gnuefi, and import a possible update from there. I guess I'll leave that
> part to the maintainers...

Actually no. There's no need to use AllocateMaxAddress here, at which point
the need to init addr will go away.

Jan

