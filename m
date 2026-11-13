Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7201606A333
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=up4R3wkj
Received: from list by lists.xenproject.org with outflank-mailman.1487255.1689708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRowN-0006VM-Vp; Fri, 13 Nov 2026 10:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487255.1689708; Fri, 13 Nov 2026 10:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRowN-0006VF-T6; Fri, 13 Nov 2026 10:55:31 +0000
Received: by outflank-mailman (input) for mailman id 1487255;
 Fri, 13 Nov 2026 10:55:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRowM-0006V9-HO
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:55:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRowL-00Fja4-Qf
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:55:29 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6ec9a-bab6-0a2a0a5309dd-0a2a4506842c-18
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:55:29 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6eca1-195a-0a2a45060019-d155dd35d8f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:55:29 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so317404f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:55:29 -0800 (PST)
Received: from [192.168.1.51] (host-78-146-248-75.as13285.net. [78.146.248.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c77393700sm4028795f8f.18.2026.11.13.02.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 02:55:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:Cc:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794567329; x=1795172129; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sS2L53F7LAkyHD5eyE5a18DH85AkaMP9KbWFqjQE5u4=;
        b=up4R3wkjScABY+tXtepYb6IDWhSDlCi9aM9KGeEG+EWXPwRWFeG2M9lCMjXPRTTEvV
         K9O5twnFDlQ+nOdCa/6d71SUWYkPTo/DSnNKrIkXrcEmTykhtGwa3Bsuu1B3Oan1SLrN
         MF57XrEUBhFECbywvKlh8R0NNKJlAUNQDtC2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567329; x=1795172129;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS2L53F7LAkyHD5eyE5a18DH85AkaMP9KbWFqjQE5u4=;
        b=qTaSLs6VWy7apbOL7W+Pkr8VVXqX3pMySr6Aw61tbtH8IAk2d5J7h2IJMMFlwfFOQx
         iOdnhYca6ptmkD4iFEJjSBkOXgku01S3+XqNHJKoK4PQqd+4pXZ+p1mYiWZNPdigxOj8
         PYoBTPE3DDDTqso7F0rwXrH4x5AGg0KvA5qKeo5cCav+Mr+ydu9vyoZ1bzm//DMajiKP
         BXc0xUwW2xK4DwqlVhVb2bwOlxbJBf8fRLqSDnBaig/mMSyIuAiBgaAebnw9fJUv1pOQ
         QcDJihUviGt2A81E5B2b4pJB6neRgZRxMFitgoussWaBYArnXQeZrYUdK7OICKx466Yt
         /FZQ==
X-Forwarded-Encrypted: i=1; AL+hErFBWpwT3cSEriSSNQNRgFBng0aKbzfkB4dFtvHc5f1ZixGxOluFplgofQEdYfRErGP1II+DUBkmaUw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/AdEGSOyIqVf/fhunXpcYaOyOdI5oCU+JRw4V1ZWCSqLiyE96h
	wITFmoDKDIHvEtheJHqkGTLIv4ElmXwJ/S7gogPQGp6rJdvp30XAEg6pRqUoKk2bPfM=
X-Gm-Gg: AYBFou1IUuGEQ2vvqVnERgriO9dWrZSLPsk9mxaovAYg7bw9YIYU7U8RXQe6f+POfwn
	fTaGHPGnHmKLNwQ5ThqKk0RHZOHMv85Us1XTqUUowlOoMg/9r29KJz9HltZTczFhiiZUFrjUbTK
	euW/l/eCEWhFzh+WI4zpgsqJyvvKEX+1mw0xhtDCd9JkxZGA7J+hlWhXREDt50WO94YA6Uo9Uzb
	bNlDEE9kl+xe+5zmHq/QofNFOWo+93PyuZDVZBvHGIc+w/QB1IMUJTPUBWkh3qx2R7A3GQw6j1n
	SinLaWo/MDdwB3r7uqlTcWjg5brOidlRIzoHc45twql+u58HPt49zbvm7D+XU5mnemJchbIlRMA
	kQ8E7zcYARdyrowAWCPzpdlEj2La//1bGPUpmBcgoo0LBDkB2DwnBObiIpinG8bs8j9K23zUThP
	0uHaUOvqfzUSWO8Pr5vU74Q2Dt8qv7SbEkKQC9e5sIel8CgbhtETdC3OJae/RFfh2PuhME8c5yE
	oAmgp/bihOrdzOCBETSCOAW67D8CkTV76VFMB6RHXOpkM4Bhsjl7QmVgXBMlx+7jLRAdEXUPjZy
	/6v1mxQdVs/OLQNwPPaCr4tQCBpYUWQpC5sZFzc4WmxYQ/XZWna3SkypjB+zVQ11wbUQDQ==
X-Received: by 2002:a05:6000:430d:b0:48f:bbf3:cf52 with SMTP id ffacd0b85a97d-49c73350e7bmr5274214f8f.52.1794567328782;
        Fri, 13 Nov 2026 02:55:28 -0800 (PST)
Message-ID: <5b1832a9-013d-4695-b089-333181157f8a@citrix.com>
Date: Fri, 13 Nov 2026 10:55:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
 <66c8bb12-1139-4689-99a0-3bef189ba5e9@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <66c8bb12-1139-4689-99a0-3bef189ba5e9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794567329-F7ACA77B-F4B645E1/10/78276251493
X-purgate-type: spam
X-purgate-size: 5138
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 8:51 am, Oleksii Kurochko wrote:
>
>
> On 11/12/26 7:58 PM, Andrew Cooper wrote:
>> This appears to be an error in x86 which got copied into all other
>> architectures.  .data.read_mostly is an internal detail, and none of the
>> similar sections get exposed externally.
>>
>> Simply place .data.read_mostly in .data.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> CC: Timothy Pearson <tpearson@raptorengineering.com>
>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> This is to simplfy the script checking that xen.efi's section
>> attributes/alignments are correct for UEFI SecureBoot.
>> ---
>>   xen/arch/arm/xen.lds.S   | 8 +++-----
>>   xen/arch/ppc/xen.lds.S   | 8 +++-----
>>   xen/arch/riscv/xen.lds.S | 7 ++-----
>>   xen/arch/x86/xen.lds.S   | 4 +---
>>   4 files changed, 9 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index d1bb6c62d208..8d0954c90afd 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -86,16 +86,14 @@ SECTIONS
>>         __ro_after_init_end = .;
>>     } : text
>>   -  .data.read_mostly : {
>> -       *(.data.read_mostly)
>> -  } :text
>> -
>>     . = ALIGN(SMP_CACHE_BYTES);
>>     .data : {                    /* Data */
>> -       *(.data.page_aligned)
>> +       *(.data.read_mostly)
>>            HYPFS_PARAM
>>   +       *(.data.page_aligned)
>> +
>>          *(.data .data.*)
>>          CONSTRUCTORS
>>     } :text
>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>> index cddb70855307..b2159279169c 100644
>> --- a/xen/arch/ppc/xen.lds.S
>> +++ b/xen/arch/ppc/xen.lds.S
>> @@ -77,16 +77,14 @@ SECTIONS
>>           __ro_after_init_end = .;
>>       } :text
>>   -    DECL_SECTION(.data.read_mostly) {
>> -        *(.data.read_mostly)
>> -    } :text
>> -
>>       . = ALIGN(PAGE_SIZE);
>>       DECL_SECTION(.data) {                    /* Data */
>> -        *(.data.page_aligned)
>> +        *(.data.read_mostly)
>>             HYPFS_PARAM
>>   +        *(.data.page_aligned)
>> +
>>           *(.data .data.*)
>>           CONSTRUCTORS
>>       } :text
>> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
>> index 250ee3f36f4f..d1c5ce59c90d 100644
>> --- a/xen/arch/riscv/xen.lds.S
>> +++ b/xen/arch/riscv/xen.lds.S
>> @@ -84,16 +84,13 @@ SECTIONS
>>           __ro_after_init_end = .;
>>       } : text
>>   -    .data.read_mostly : {
>> -        *(.data.read_mostly)
>> -    } :text
>> -
>>       . = ALIGN(PAGE_SIZE);
>>       .data : {                    /* Data */
>> -        *(.data.page_aligned)
>> +        *(.data.read_mostly)
>>             HYPFS_PARAM
>>   +        *(.data.page_aligned)
>>           *(.sdata .sdata.*)
>>           *(.data .data.*)
>>           CONSTRUCTORS
>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>> index 925848980219..99802aed4e13 100644
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -295,13 +295,11 @@ SECTIONS
>>       __2M_rwdata_start = .;       /* Start of 2M superpages, mapped
>> RW. */
>>     . = ALIGN(SMP_CACHE_BYTES);
>> -  DECL_SECTION(.data.read_mostly) {
>> +  DECL_SECTION(.data) {
>>          *(.data.read_mostly)
>>            HYPFS_PARAM
>> -  } PHDR(text)
>>   -  DECL_SECTION(.data) {
>>          *(.data.page_aligned)
>>          *(.data .data.*)
>>     } PHDR(text)
>
> The ordering is preserved, but the alignment between the two isn't.
> Today the ALIGN() before .data sits between .data.read_mostly and
> regular .data.  After this patch it sits before .data.read_mostly, and
> the only thing separating it from *(.sdata/.data) is
> *(.data.page_aligned), which has no inputs on RISC-V, PPC or Arm with
> CONFIG_MPU. So the tail of .data.read_mostly will share a cache line
> with ordinary .data, which is the false sharing __read_mostly is meant
> to avoid (IIUC).

__read_mostly is indeed meant to reduce false sharing, but this patch
does not introduce any.

HYPFS_PARAM should have been read_mostly to begin with, and page
alignment is greater th cache alignment so there's no sharing there either.

~Andrew

