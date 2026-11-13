Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4473606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DE4DGlI8
Received: from list by lists.xenproject.org with outflank-mailman.1487348.1689782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRpnE-00016r-GF; Fri, 13 Nov 2026 11:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487348.1689782; Fri, 13 Nov 2026 11:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRpnE-00016k-Bp; Fri, 13 Nov 2026 11:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1487348;
 Fri, 13 Nov 2026 11:50:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRpnD-00010Y-6j
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:50:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRpnC-00AFye-Jc
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:50:06 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6f965-e002-0a2a0a5209dd-0a2a450bb926-26
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:50:06 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6f96e-b7e8-0a2a450b0019-d155802ded57-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:50:06 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso12327015e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 03:50:06 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e29d24dsm152404235e9.11.2026.11.13.03.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 03:50:05 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794570606; x=1795175406; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLx99/ZjVTe3HJ1l2gnPlhLM6D11tPxPRltGr94qPaE=;
        b=DE4DGlI8lRJdl43IkjnismKLmee50IcTaHujNUAKJA9cX5DLdpK8G+QHcvSuBAmdsZ
         FYv2vscJyETmdPVx1z4/UwF9fJPjvksOdEBMcCVkOVtsCDNTMP9SY4Iqi25l/bQSMNih
         q+gODoVQcgE66Cis04rbG9FHblbskaqpzaYklOhdviPkAZef2rx9xmwivI0I/qHkVW4G
         JC7AuhLbWhjD0F68NTp2mbqJi+4sR35DJeFu3VdvoD4KZ+N3vjuCpy0XqGHbD5TxFHCU
         VSM7vuwdhcg0pS/WPRcA0WuJ0z6q9/9P0gudMX5dsE1/3RTQKZmjWGiC9INUZC6+VX1G
         GVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570606; x=1795175406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLx99/ZjVTe3HJ1l2gnPlhLM6D11tPxPRltGr94qPaE=;
        b=plU4+t7GrQd3yQxzJe2I/HJWDo2fawAj/e7fx7CQhVOOzuNfqP7cFc8RYmP3m5ZK3E
         W5T3LwDFS7Bql9yy+qZDZjJOw4Gt/IuGNq+A3bP8nMWXbwefp12SBDPUfG2bYvRCqwIS
         NXVrrAgHv4ybpaB+/+sHQ71J9SLBjmRx0OHjD8nhIXWHvkjiT+kjpF1Xqu8aRHOoRnRI
         Yo5r5LuOJ3J0c20BsvmKpmEP0Su0D40gseXkkLs1B7S25YLuKX3s6BM0YHWI4y8e+8bL
         xhFf8vOLx2sbOQnyvcae7/u2MvovVDtzutXThPZfyLgxGl/ZwpVQzPyORX7XQTdmfL7R
         gnuw==
X-Forwarded-Encrypted: i=1; AL+hErG8V6AW3ZF8ysI5og1bLpx2GBTEDCGwMwTFaUlzIR5pn+DQqeX7X1fY3dZKLBMVHfCD2bQJSC5+Ig4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+bUTn8GKVNWxK+Wu/QnqxU/fhzzuda9FBJFEd995PlTJkD9BGO
	JBtZHIcegtzt9uRoMjvDds9b7JLBCtYO3bZrSvsw0rEDYLSeT0qwV3/t
X-Gm-Gg: AYBFou0CXnpvisyPLc9NaKm+6x425FceIMQ4XzLJJK9MreX7eyQER3qxDw9bdn5DV5s
	LVm37zcxDLz8Obe5Uizvxp3z3Nv9KWGFN2v5yN9IxkhJRdaui758CNZcTVqjg29NlSaqsQPtpQq
	C7HV2pM9Tkgp/QrsGmFes60e77TPwR3LJXdRAUo9B/mZjXsydbwmulgTLFTAYsZU9Th6uG+fxXO
	X5VnZMLLhYXILfmYllzzJtsi7Pe7kia0G9NadFp7dPCmJy6sZKrkAZU0FQZfvlGVRP1X/U+YFJE
	w9Lp7ve7iD0i5WWwEnlR7zYESry6bDxU0JhJjEa6A6BPmuBEO+4HiMbbcVqjStH/fgeb4JLHSBU
	kVs0J5r7W4LlE4KjTm2nlkqtloY4cGEaRfmFUJxfQSYgJNvW4GI6dFTucyv/QiQqt55cCVGsjUD
	g1mMVIGpM8XhStFikQRCI1JT1SFVK946YniCcy3/VhCByCCGHHDzcC5mSxGHzgvd91z29Hk4YoP
	ahQzdOwk7ZPBxjWYOJBpXpBXhLmf+At1oPL+yojJW7H26F4eX/3dSxk5kNrkGwU9/319W8SgHi5
	S1sfigqJfLzEX16wa6SsVS9qPPhrq9Dlh4RJ6HLnsJ2iyY0pXZkut1A5Z2SDsahKSFUhaDVRyJV
	iKmU=
X-Received: by 2002:a05:600c:34d0:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb55a59f41mr48336405e9.24.1794570605675;
        Fri, 13 Nov 2026 03:50:05 -0800 (PST)
Message-ID: <555e4be7-0734-4f02-b556-82a538238e05@gmail.com>
Date: Fri, 13 Nov 2026 12:50:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
 <66c8bb12-1139-4689-99a0-3bef189ba5e9@gmail.com>
 <5b1832a9-013d-4695-b089-333181157f8a@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5b1832a9-013d-4695-b089-333181157f8a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1794570606-AB2DC9EA-B2D5B752/10/78276251493
X-purgate-type: spam
X-purgate-size: 5460
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/13/26 11:55 AM, Andrew Cooper wrote:
> On 13/11/2026 8:51 am, Oleksii Kurochko wrote:
>>
>>
>> On 11/12/26 7:58 PM, Andrew Cooper wrote:
>>> This appears to be an error in x86 which got copied into all other
>>> architectures.  .data.read_mostly is an internal detail, and none of the
>>> similar sections get exposed externally.
>>>
>>> Simply place .data.read_mostly in .data.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Roger Pau Monné <roger@xenproject.org>
>>> CC: Teddy Astie <teddy.astie@vates.tech>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>> CC: Timothy Pearson <tpearson@raptorengineering.com>
>>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> This is to simplfy the script checking that xen.efi's section
>>> attributes/alignments are correct for UEFI SecureBoot.
>>> ---
>>>    xen/arch/arm/xen.lds.S   | 8 +++-----
>>>    xen/arch/ppc/xen.lds.S   | 8 +++-----
>>>    xen/arch/riscv/xen.lds.S | 7 ++-----
>>>    xen/arch/x86/xen.lds.S   | 4 +---
>>>    4 files changed, 9 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>>> index d1bb6c62d208..8d0954c90afd 100644
>>> --- a/xen/arch/arm/xen.lds.S
>>> +++ b/xen/arch/arm/xen.lds.S
>>> @@ -86,16 +86,14 @@ SECTIONS
>>>          __ro_after_init_end = .;
>>>      } : text
>>>    -  .data.read_mostly : {
>>> -       *(.data.read_mostly)
>>> -  } :text
>>> -
>>>      . = ALIGN(SMP_CACHE_BYTES);
>>>      .data : {                    /* Data */
>>> -       *(.data.page_aligned)
>>> +       *(.data.read_mostly)
>>>             HYPFS_PARAM
>>>    +       *(.data.page_aligned)
>>> +
>>>           *(.data .data.*)
>>>           CONSTRUCTORS
>>>      } :text
>>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>>> index cddb70855307..b2159279169c 100644
>>> --- a/xen/arch/ppc/xen.lds.S
>>> +++ b/xen/arch/ppc/xen.lds.S
>>> @@ -77,16 +77,14 @@ SECTIONS
>>>            __ro_after_init_end = .;
>>>        } :text
>>>    -    DECL_SECTION(.data.read_mostly) {
>>> -        *(.data.read_mostly)
>>> -    } :text
>>> -
>>>        . = ALIGN(PAGE_SIZE);
>>>        DECL_SECTION(.data) {                    /* Data */
>>> -        *(.data.page_aligned)
>>> +        *(.data.read_mostly)
>>>              HYPFS_PARAM
>>>    +        *(.data.page_aligned)
>>> +
>>>            *(.data .data.*)
>>>            CONSTRUCTORS
>>>        } :text
>>> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
>>> index 250ee3f36f4f..d1c5ce59c90d 100644
>>> --- a/xen/arch/riscv/xen.lds.S
>>> +++ b/xen/arch/riscv/xen.lds.S
>>> @@ -84,16 +84,13 @@ SECTIONS
>>>            __ro_after_init_end = .;
>>>        } : text
>>>    -    .data.read_mostly : {
>>> -        *(.data.read_mostly)
>>> -    } :text
>>> -
>>>        . = ALIGN(PAGE_SIZE);
>>>        .data : {                    /* Data */
>>> -        *(.data.page_aligned)
>>> +        *(.data.read_mostly)
>>>              HYPFS_PARAM
>>>    +        *(.data.page_aligned)
>>>            *(.sdata .sdata.*)
>>>            *(.data .data.*)
>>>            CONSTRUCTORS
>>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>>> index 925848980219..99802aed4e13 100644
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -295,13 +295,11 @@ SECTIONS
>>>        __2M_rwdata_start = .;       /* Start of 2M superpages, mapped
>>> RW. */
>>>      . = ALIGN(SMP_CACHE_BYTES);
>>> -  DECL_SECTION(.data.read_mostly) {
>>> +  DECL_SECTION(.data) {
>>>           *(.data.read_mostly)
>>>             HYPFS_PARAM
>>> -  } PHDR(text)
>>>    -  DECL_SECTION(.data) {
>>>           *(.data.page_aligned)
>>>           *(.data .data.*)
>>>      } PHDR(text)
>>
>> The ordering is preserved, but the alignment between the two isn't.
>> Today the ALIGN() before .data sits between .data.read_mostly and
>> regular .data.  After this patch it sits before .data.read_mostly, and
>> the only thing separating it from *(.sdata/.data) is
>> *(.data.page_aligned), which has no inputs on RISC-V, PPC or Arm with
>> CONFIG_MPU. So the tail of .data.read_mostly will share a cache line
>> with ordinary .data, which is the false sharing __read_mostly is meant
>> to avoid (IIUC).
> 
> __read_mostly is indeed meant to reduce false sharing, but this patch
> does not introduce any.
> 
> HYPFS_PARAM should have been read_mostly to begin with, and page
> alignment is greater th cache alignment so there's no sharing there either.
Thanks for clarifying. Then:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

